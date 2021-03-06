# Markdown Binder

## Markdown Binder とは何なのか？

Perlで書かれ、Plackで動作する Markdown Viewer である。  
（ブラウザ上から編集できない為、Wikiではない）

現在見ているこのサイト自体 Markdown Binder のデモを兼ねている。

テキストエディタで簡単にドキュメントが書け、localのplackで閲覧しつつDropboxで勝手にサーバーにも同期されてしまう理想的なドキュメント編集環境である。

筆者の備忘録をオープンにする為に作られており、基本的に筆者に必要な機能しか盛り込まれていない。

## 既存の Wiki を利用しなかった理由

独自記法、拡張記法の弊害で乗り換え辛い、ブラウザで編集する行為が非効率的などの理由である。

Markdownの文法は十分に簡潔でその編集はテキストエディタが最も適している、ドキュメントの構成を組む場合もファイラーで直接ファイルやディレクトリを操作するのが最も効率的である。

筆者はWikiを否定している訳ではない、筆者の目的に最も即したプロダクトがWikiではなかったのである。

## 閲覧性へのこだわり

閲覧性に関して考えたことは **テキストの読み易さ**、**応答速度**、**操作性** の３つである。

### テキストの読み易さ

即ちレイアウト及びCSSの出来である、本職ではないが筆者は最適なフォントサイズと行間について気が済むまでチューニングを行った。

### 応答速度

ページロードを全て静的コンテンツとし、画面の再描画も領域を必要最低限に絞り今に至る。これを実現する為、テキストソースはデーモンで変更を監視し事前にHTML化している。

### 操作性

現在も最適化の途中である、permalinkやsourceへのリンクも削るか残すか悩んだ上残している。ページが長くなった場合にメニューの操作の為に画面上までスクロールしたり、逆にメニューの階層が深くなりすぎて操作し辛くなる等、課題がある。

## bot や wget に対応している理由

古参のメールインフラに知見のあるエンジニアなら誰しもqmailのドキュメントは`wget -r`していたのではないだろうか、あれはよく閲覧不能になっていたので私も未だにローカルに持っている。インターネット経由での閲覧がメインでも一括取得への配慮は忘れたくない。この配慮の為、Javascriptをoffの状態でも閲覧できる、勿論onの場合に比べ応答速度に劣る為on推奨である。botへの対応は勿論検索エンジンに載せ**ドキュメントの検索**を行う為である。

## 別のこだわり

やや特殊なのは通常起動時は plack の $app と別に fork でドキュメントの**更新監視プロセス**が生まれるようになっている。

**簡単な事は簡単に** のポリシーに習い、Standalone時はplackupで両方起動し`Ctrl-C`で両方落ちる

但し、fork を伴っていると Starman で HUP を受けた時などに色々と気持ち悪い事になる為、切り離せるように viewer.psgi 及び watcher.pl を用意している。

**複雑なことも不可能ではない** と、いう事である、これはPerlのポリシーに習っている。

viewer と watcher を別々に起動したり、サーバーでは watcher を使わずローカルで作ったHTMLを同期させる等、好きな様に構成できる。

因みに watcher はcacheディレクトリのHTMLを生成しているだけなので、ローカル環境の plackup で生成したcacheを同期させれば別環境では必要のないプロセスである。

静的コンテンツの応答速度によりこだわるなら Nginx や Apache 等フロントエンドWebサーバーにHTMLを裁かせることも可能だ。

*アクセス時にキャッシュをチェックして更新する様なロジックだとこれが出来ない*、watcher というプロセスを作った背景である。

