# Apache

## とりあえず

- ServerTokens ProductOnly (HTTPヘッダーに付くプラットフォーム情報を切る)
- ServerSignature Off (エラーページに付くWebサーバーバージョン情報を切る)
- TraceEnable off
-  Options None ( / と /var/www/html/ )
- #ScriptAlias /cgi-bin/ "/var/www/cgi-bin/"
- 余計なモジュールのロードをコメントアウト
    - #LoadModule dav_module modules/mod_dav.so
    - #LoadModule dav_fs_module modules/mod_dav_fs.so
    - #LoadModule status_module modules/mod_status.so
