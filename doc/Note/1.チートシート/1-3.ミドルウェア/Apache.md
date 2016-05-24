# Apache

## mobile
Vodafone?知らないな、そんなの。

    BrowserMatch ^(DoCoMo|SoftBank|KDDI-) mobile
    RewriteCond %{ENV:mobile} ^1$
    RewriteRule /(.*) http://m.example.com/$1 [R,L,NE]
