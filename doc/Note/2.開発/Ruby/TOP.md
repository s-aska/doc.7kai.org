# ruby事始め

## 諸注意

- なんとなく身内向けなので文章が適当です。
- 知らない用語はググってみると良いです、意味がわかるページに辿り着くまで諦めないのがコツです
- シェルについての予備知識 <http://doc.7kai.org/Note/0.Beginner/1.Linux/1.Tutorial>

## 開発環境を整える (OS X)

1. Homebrew のインストール
2. Xcode Command Line Tools のインストール
3. rbenv / ruby-build / readline のインストール
4. ruby 最新の安定版 のインストール
5. MySQL のインストール（おまけ）

以上の工程でMacにrubyの開発環境を整えます。

無垢なMacに環境を作る手順・解説を書いているのでボリュームがありますが、ruby特有の部分は短いです。

## Xcode Command Line Tools のインストール

*Xcode*は主にMacやiOSアプリの開発に用いられるツール群ですが、一般的なコンパイラやライブラリ等も同梱されており、UNIX環境向けの開発には欠かせません。

*ダウンロードページはちょくちょく変わるので適当にググってインストールして下さい*、Apple IDや開発者としての登録が必要になると思いますが、そんなに大変じゃないので**面倒がらずにやって下さい**。

2012年9月現時点の最新版では*Command Line Tools*は*Xcode*本体のインストールの後に別途メニューからインストールする必要があるそうです。

## Homebrew のインストール

*Homebrew*はパッケージ管理を行うソフトウェアです、MySQLとミドルウェアや開発に必要なライブラリ（画像加工、暗号化通信...etc）等、**色々お世話になります**。

	ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"

*Mac Ports*を利用している場合、アンインストールしましょう、**奴の時代は終わりました**。但し、色々なものが動かなくなると思うので就業後、また忙しい時は避けましょう。

## rbenv / ruby-build / readline のインストール

開発で多く用いられているバージョンは1.9系のrubyですが、Lionでも標準rubyは1.8系です、大人しく1.9系を入れましょう。

*rbenv* / *ruby-build* はユーザー領域以下（`/Users/<自分のアカウント>/`）にrubyをインストールするのに利用します。

*readline*はカーソルキーでコマンドの履歴を出したりする機能を提供するライブラリです。

	brew install rbenv
	brew install ruby-build
	brew install readline
	brew link readline

## ruby のインストール

いよいよ*ruby*のインストールです、*rbenv*を使って任意のバージョンの*ruby*をインストールします。

*rbenv*は**「1.9.2系の最新版よろ」**みたいなカジュアルな指示でインストールしてくれません、自分で最新安定版を確認し、インストールします。

最新安定版は公式サイトでチェックできます。 (http://www.ruby-lang.org/ja/downloads/)

コマンドでは `rbenv install -l` でインストール可能なバージョンのリストが得られます。

	# 書式
	CONFIGURE_OPTS="--with-readline-dir=/usr/local" rbenv install <バージョン>
	# 例
	CONFIGURE_OPTS="--with-readline-dir=/usr/local" rbenv install 1.9.3-p194

はい、これでインストールはひと通り終了です、お疲れ様でした。

※最新のXcodeはruby 1.9.2のビルドをサポートしていないので大人しく1.9.3系を入れました。

	ruby -v
	> ruby 1.8.7 (2011-12-28 patchlevel 357) [universal-darwin11.0]

この時点だとまだ1.8系のシステムrubyにパスが通った状態です、普通にrubyをタイプし自分のrubyが起動される様にするにはコマンドが必要です。

	# ターミナル起動時、自動的に読み込まれるbashの設定ファイルにrbenvの記述を追記
	echo 'eval "$(rbenv init -)"' >> .bash_profile
	# bashの設定ファイルを手動で読み込む
	source .bash_profile

	# 書式
	rbenv global <バージョン>
	# 例
	rbenv global 1.9.3-p194

`⌘T` で新規にターミナルを起動し、ruby -vをタイプ、これで最新版のrubyのバージョンが出力されればokです。

	# 例
	ruby -v
	> ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-darwin11.4.1]

## MySQLのインストール（おまけ）

大抵の場合、MySQLは必要です。

	# インストール
	brew install mysql
    unset TMPDIR
    # DBの初期化
    mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
    # 自動起動の設定
    mkdir -p ~/Library/LaunchAgents
    cp /usr/local/Cellar/mysql/5.5.25a/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    # 手動起動（インストール直後なので）
    mysql.server start
    # 権限の設定、ローカルホストからの操作を全許可
    echo "GRANT ALL PRIVILEGES ON *.* TO  `whoami`@localhost" | mysql -u root

**※ここまで書いておいてなんですが、私はrubyで開発をした事はありません。**

次回、「HerokuでSinatra」です、よろしくお願いします。
