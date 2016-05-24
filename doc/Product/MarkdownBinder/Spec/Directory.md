# Directory Structure

    ├── app.psgi     ... Plack Application ( viewer and watcher starter )
    ├── viewer.psgi  ... Plack Application ( viewer only )
    ├── watcher.pl   ... document source watcher ( source => html )
    ├── config.json  ... title and footer
    ├── doc          ... document directory
    │   └── TOP.md   ... top page source
    ├── cache        ... cache directory (auto create)
    │   └── TOP.html ... top page html   (auto create)
    ├── htdocs
    │   ├── favicon.ico
    │   ├── robots.txt
    │   └── static
    │       ├── css
    │       │   ├── style.css   ... style sheet
    │       │   └── iphone.css  ... iPhone's style sheet
    │       ├── img
    │       │   ├── icon_16.png
    │       │   └── icon_40.png ... iPhone home icon.
    │       └── js
    │           └── binder.js   ... client side program
    └── view
        ├── index.html  ... template
        ├── iphone.html ... iPhone's template
        └── sidebar.tx  ... side bar template
