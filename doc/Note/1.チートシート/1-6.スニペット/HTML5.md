# HTML5

## Template

    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="utf-8">
    <title>Title</title>
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script>
    if (navigator.userAgent.indexOf('Win') != -1) {
        document.write('<link rel="stylesheet" type="text/css" href="/static/css/win.css" media="all">')
    }
    </script>
    <link rel="stylesheet" type="text/css" href="/static/css/style.css" media="all">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    </head>
    <body>
    <header>
    <h1>Title</h1>
    </header>
    <article>
    </article>
    </body>
    </html>

## clearfix

    .clearfix:before,
    .clearfix:after {
        content:"";
        display:table;
    }
    .clearfix:after {
        clear:both;
    }
    .clearfix {
        zoom:1;
    } /* IE6, IE7 */
