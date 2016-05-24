# Dropbox

DropboxをさくらのVPS (Ubuntu) に入れる  
５分掛からなかった、非常におすすめ

+ python26 インストール
+ Dropbox の公式 CLI クライアントを入手
+ サーバーのHOSTIDをDropboxの管理UIで登録(ログイン後にURL叩くだけ)

## ログ
    wget http://www.dropbox.com/download?dl=packages/nautilus-dropbox_0.6.7_amd64.deb
    mkdir src
    mv nautilus-dropbox_0.6.7_amd64.deb src
    cd src
    sudo dpkg -i nautilus-dropbox_0.6.7_amd64.deb
    sudo apt-get install libatk1.0-0 libcairo2 libgtk2.0-0 libnautilus-extension1 libpango1.0-0 python-gtk2
    sudo apt-get -f install

### 参考記事
- [Dropbox on Linux without X - 永遠に未完成](http://d.hatena.ne.jp/thinca/20100613/1276426233)
- [CentOS に Python 2.6 を(yumで)インストール - イッキログ Tech](http://ikkki.co.jp/blog-tech/?p=26)
