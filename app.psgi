use strict;
use File::Basename;
use File::Spec;
use lib File::Spec->catdir(dirname(__FILE__), 'lib');
use Plack::Builder;
use App::MarkdownBinder;
use App::MarkdownDiary;

my $doc_app = App::MarkdownBinder->new(
    root => '/home/aska/doc.7kai.org/doc',
    suffix => '.md',
    base_url => '/',
    title => 'The Document of Aska'
);

my $blog_app = App::MarkdownDiary->new(
    root => '/home/aska/doc.7kai.org/blog',
    suffix => '.md',
    base_url => '/',
    title => 'The Diary of Aska',
    footer => '&copy; 七階',
    rss_url => 'http://blog.7kai.org',
    viewdir => './view/diary_7kai'
);

builder {
    enable_if { $_[0]->{REMOTE_ADDR} eq '127.0.0.1' } 'ReverseProxy';
    enable 'Static',
        path => qr!^/static/!, root => './htdocs/';
    enable 'Static',
        path => qr!^/(?:favicon.ico|robots.txt)$!, root => './htdocs/';
    mount 'http://doc.7kai.org/' => $doc_app;
    mount 'http://blog.7kai.org/' => $blog_app;
};
