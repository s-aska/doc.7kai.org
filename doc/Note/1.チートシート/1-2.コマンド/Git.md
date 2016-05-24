# git

## 使わないと覚えないね

### チェックアウト
    git clone git@github.com:s-aska/markdown-binder.git

### ファイル追加
    git add app.psig

### ファイル追加 ( カレント以下全部、対象は git status で確認 )
    git add .

### ファイル追加取り消し
    git rm --cached app.psig

### ファイル追加取り消し ( カレント以下全部 )
    git rm --cached -r .

### ローカルとレポジトリの差分を確認
    git status

### ファイルの変更を元に戻す
    git checkout ファイルパス

### ファイルの変更を元に戻す ( カレント以下全部 )
    git checkout .

### コミット
    git commit -m 'add app.psgi'

### ローカルのコミットをリモートに反映
    git push origin master

### リモートの更新をローカルに反映
    git pull

### ブランチ一覧を確認
    git branch -a

### ブランチを切る
    git branch aska-work

### ブランチを切り替える
    git checkout aska-work

### リモートブランチをチェックアウト
    git checkout -b aska-work origin/aska-work

### ブランチの更新をリモートに反映
    git push origin aska-work

### ブランチの更新を master に反映する
    git checkout master
    git merge aska-work
    git push origin master

### ブランチを削除する
    git branch -d aska-work
    git push origin :aska-work

### master の更新を ブランチ に反映する
    git checkout master
    git pull
    git checkout aska-work
    git merge master
    git push origin :aska-work

### タグを打つ
    git tag 1.00
    git push --tags

### リモートのレポジトリに名前をつける
    git remote add github git@xxx:user/hoeg.git

### リモートのレポジトリを参照ブランチとして持ってくる ( ステージ、作業ディレクトリに影響はない )
    git fetch
    # pullと同様の状態にするにはマージする
    git merge

### 未コミットの変更を一旦退避
    git stash save

### 退避した未コミットの変更を戻す
    git stash pop

### マージ済みのブランチ一覧表示
    git branch -r --list --merged

### 削除されたリモートブランチの同期
    git remote prune origin

## githubでforkしたレポジトリに元レポジトリの変更をマージ
    git pull git@xxx:user/hoeg.git master
    git push

## working

### 特定の機能を盛り込む作業を始め、レポジトリオーナーにマージを乞う
    git branch topic
    # ファイル編集
    # masterをpullする前に自分の作業ブランチにcommitしておく
    git add some_file
    git commi -m 'some message.'
    git checkout master
    git pull
    git checkout topic
    # commitしておいた分と照らし合わせてAutoMergeしてくれる、
    # ここでconfrictしたら手で直す。
    git merge master
    perl Makefile.PL
    make
    make test
    # confrictを手で直している場合は修正してcommitしておこう。
    # masterをmergeした後は、速やかにcommitしておかないと自分の更新と混ざるとcommitログが見辛くなる
    # -m 使うとログメッセージにConfrictを直した事が記述されず、masterにclean merge出来ないので注意
    git commit
    git push origin topic
    # say "please merge topic branch!"
    # 必要なければブランチを消す

## ログを簡易表示
    git log --pretty=oneline

## ブランチの内容を作業ディレクトリに持ってくる
    git checkout master .

## ステージの内容を作業ディレクトリに持ってくる
    git checkout .

    git add hoge.txt
    vim hoge.txt
    # hoge.txtの変更を巻き戻したい
    git checkout hoge.txt

## githubで貰ったプルリクエストの適応
    git checkout -b pull-request-master master
    git pull git://github.com/sylvainfilteau/dropbox-api-command.git
    # 動作確認
    # この時点で commit までされるので、commitする必要は無い
    git checkout master
    git merge pull-request-master
    git push
    # 連絡

## githubでプルリクエストを送る

予めcloneしていてローカルが古くても気にせずfork元の最新から作業する手順

    git clone git@github.com:s-aska/Net--Dropbox.git
    cd Net--Dropbox
    git remote add github-norbu09 https://github.com/norbu09/Net--Dropbox.git
    git fetch github-norbu09
    git tag
    # 相手がリリース毎にタグを打っている場合はStableなタグから作業を始める
    git checkout -b maint-oauth refs/tags/1.2
    # メンテ時はここからファイル編集、テスト、git add、git commitする
    git add some_file
    git commit
    # 「もうmasterに入れちゃった更新が...」という時はcherry-pickで救出
    git cherry-pick e392a9264718db5a0da6
    git cherry-pick 07c5d97ec6f590d94957
    git push --all
    # あとはGUIからmaint-oauthブランチを選択し、「プルリクエスト」すれば良い
    # masterブランチ？あっち使うと大量のmergeのcommitログまで送ってしまうので注意
    # bugや機能追加はそれぞれブランチを切ると別々にプルリクエストを送ることも出来る
    # これは要らなかったら破棄して下さいとかそういう時は分けた方が親切かも
    # 相手側でcherry-pickする事もできるけど
