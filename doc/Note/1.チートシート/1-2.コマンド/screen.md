# screen

    screen -e^Zz ... Ctrl+a じゃなくて Ctrl+z で起動する
    screen -ls ... 一覧
    screen -r ... 繋げる（別マシンで開いてると使えない）
    screen -x ... 繋げる（別マシンで開いてても入れる）
    
    Ctrl+z c ... 新しいのを作る
    Ctrl+z "... 切り替える
    Ctrl+z A ... 名前付ける
    Ctrl+z d ... 落ちる
    Ctrl+z k ... 固まったときに kill

    Ctrl+z S ... 画面分割
    Ctrl+z TAB ... 分割画面移動
    Ctrl+z Q ... 画面結合

## .screenrc

    startup_message off
    escape ^Zz
    term xterm-color
    defscrollback 10000
