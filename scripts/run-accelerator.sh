#!/bin/sh

# eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
PERL5LIB=/home/aska/markdown-binder/local/lib/perl5 perl -I /home/aska/markdown-binder/lib accelerator.pl -r /home/aska/doc.7kai.org/doc -c /home/aska/doc.7kai.org/.cache
