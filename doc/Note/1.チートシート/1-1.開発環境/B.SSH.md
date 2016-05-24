# SSH

## 最初にやる設定

- SSHデーモンのPortを変える or 接続元IPを絞る（国外からのログイン失敗のログが精神衛生上よくないため）
	- 業務で使用するサーバーは通常接続元IP制限を掛ける、Portは気休め（ポートスキャンすればすぐバレる）
- SSHデーモンのRootログインをoff（PermitRootLogin no）
- SSHデーモンのパスワードログインをoff（PasswordAuthentication no）

## 鍵

### 接続元
- .ssh/id_rsa ... 自分の秘密鍵
- .ssh/id_rsa.pub ... 自分の公開鍵
- .ssh/known_host ... 接続先サーバーのフィンガープリントリスト

### 接続先
- .ssh/authorized_keys ... ログインを許可する相手の公開鍵リスト（改行区切り）

sshの鍵認証は上記4つのファイルを使って行われる。

他のユーザーに見られてはいけないので基本的に.sshはパーミション0700、配下のファイルは0600とする。

sshクライアントがssh接続を行う際のだいたいの動きは以下のとおり（色々端折ってます）

1. 相手のサーバーが知っているサーバーかknown_hostで照合し、知らなければ警告、以後知っているものとみなすかyes/noで聞いてくる
2. 自分が秘密鍵を持っていて相手も鍵認証が有効な場合、鍵認証を試行し、ダメだとパスワード認証に切り替わる
3. 自分が相手のサーバーに接続する際、自分は秘密鍵を使用する
4. 相手のサーバーは、接続元を許可して良いかauthorized_keysを見て照合する

### 自分のUbuntu上で鍵を作る

既に鍵を作っている場合は省略して下さい。

パスワード付きにするかどうかはご自由に。

	$ ssh-keygen
	Generating public/private rsa key pair.
	Enter file in which to save the key (/home/foo/.ssh/id_rsa):
	Created directory '/home/foo/.ssh'.
	Enter passphrase (empty for no passphrase):
	Enter same passphrase again:
	Your identification has been saved in /home/foo/.ssh/id_rsa.
	Your public key has been saved in /home/foo/.ssh/id_rsa.pub.
	The key fingerprint is:
	xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx foo@wwwNNNNNuc
	The key's randomart image is:
	+--[ RSA 2048]----+
	|                 |
	(略)
	+-----------------+

### ファイルを確認

	$ ls -la .ssh
	total 16
	drwx------ 2 foo foo 4096 2012-11-23 23:07 .
	drwxr-xr-x 3 foo foo 4096 2012-11-23 23:07 ..
	-rw------- 1 foo foo 1675 2012-11-23 23:07 id_rsa
	-rw-r--r-- 1 foo foo  396 2012-11-23 23:07 id_rsa.pub

### 公開鍵をサーバーに送信

ドメインを降っていない場合 example.com の部分はグローバルIP

fooはサーバー上で作成した自分のアカウント名、初回接続時はパスワードが必要なのでセットしておく

	$ scp .ssh/id_rsa.pub foo@example.com:

### サーバー上で鍵をauthorized_keysにセット

	$ ssh foo@example.com
	$ mkdir .ssh
	$ chmod 0700 .ssh
	$ cat id_rsa.pub >> .ssh/authorized_keys
	$ chmod 0600 .ssh/authorized_keys
	$ rm id_rsa.pub

### 確認

パスワードを聞かれずにログインできればOK

	$ ssh foo@example.com

## sshdの設定変更

- 国外からのアタックがうざいのでポートを変えておく（Port）
- rootへの直接ログインを拒否（PermitRootLogin no）
- パスワードログインを拒否（PasswordAuthentication no）

### 元ファイルは念のためとっておく
	$ cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.org

### 編集
	vi /etc/ssh/sshd_config

### diff確認
	$ diff /etc/ssh/sshd_config /etc/ssh/sshd_config.org
	5c5
	< Port 20022
	---
	> #Port 22
	26c26
	< PermitRootLogin no
	---
	> PermitRootLogin yes
	50c50
	< PasswordAuthentication no
	---
	> #PasswordAuthentication yes

### sshd再起動（失敗したら最悪コンソールをとってシングルモードでOS起動）
	$ /etc/init.d/ssh restart

### 注意事項

\#でコメントアウトされている行はそのままだと値を変えても有効にならないで注意
