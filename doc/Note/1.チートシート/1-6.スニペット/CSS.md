# CSS

    @charset "utf-8";

    /*****************************************************
    1. reset
    2. base
    3. header
    4. footer
    5. aside
    6. article
    *****************************************************/

    /********** reset **********/

    html, body, div, span, object, iframe,
    h1, h2, h3, h4, h5, h6, p, blockquote, pre,
    abbr, address, cite, code,
    del, dfn, em, img, ins, kbd, q, samp,
    small, strong, sub, sup, var,
    b, i,
    dl, dt, dd, ol, ul, li,
    fieldset, form, label, legend,
    table, caption, tbody, tfoot, thead, tr, th, td,
    article, aside, dialog, figure, footer, header, 
    hgroup, menu, nav, section, menu,
    time, mark, audio, video {
        margin: 0;
        padding: 0;
        border: 0;
        vertical-align: baseline;
        background: transparent;
        font-size: 100%;
        outline: 0;
    }
    body {
        line-height: 1;
    }
    article, aside, dialog, figure, footer, header, 
    hgroup, nav, section {
        display: block;
    }
    blockquote, q {
        quotes: none;
    }
    blockquote:before, blockquote:after,
    q:before, q:after {
        content: '';
        content: none;
    }
    a {
        margin: 0;
        padding: 0;
        border: 0;
        vertical-align: baseline;
        background: transparent;
        font-size: 100%;
    }
    ins {
        color: #000;
        background-color: #ff9;
        text-decoration: none;
    }
    mark {
        color: #000;    
        background-color: #ff9;
        font-style: italic;
        font-weight: bold;
    }
    del {
        text-decoration: line-through;
    }
    abbr[title], dfn[title] {
        border-bottom: 1px dotted #000;
        cursor: help;
    }
    table {
        border-collapse: collapse;
        border-spacing: 0;
    }
    hr {
        margin: 1em 0;
        padding: 0;
        border: 0;    
        border-top: 1px solid #cccccc;
        display: block;
        height: 1px;
    }
    input, select {
        vertical-align: middle;
    }

    /********** base **********/

    body, th, td, h1, h2, h3, h4, h5, h6, pre, input, textarea, option, div, p, dt, dd, li, address {
        line-height: 1.6;
        color: #5D5D5D;
        font-style: normal;
        font-weight: normal;
    }
    html, body {
        height: 100%;
    }
    html {
    }
    body {
        /*font-size: 13px;*/
        /*overflow-y: scroll;*/
    }
    a {
        color: #68a9cf;
        text-decoration: none;
    }
    a:hover {
        color: #68a9cf;
        background-color: #f7faff;
    }