#!/bin/sh

# eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
PERL5LIB=/home/aska/markdown-binder/local/lib/perl5 exec /home/aska/markdown-binder/local/bin/start_server \
--port=5001 \
--interval=3 \
--pid-file=/home/aska/doc.7kai.org/app.pid \
-- /home/aska/markdown-binder/local/bin/plackup \
-I /home/aska/markdown-binder/lib \
-E deployment \
-s Starlet \
--max-workers=5 \
-a /home/aska/doc.7kai.org/app.psgi