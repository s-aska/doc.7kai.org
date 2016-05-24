# Perl

### ちょっとオプションが欲しい

    use Getopt::Std;
    my %opts;
    getopts('ndf:t:', \%opts);
    # n, d は bool f, t は値を指定

### ちゃんとオプションが欲しい

    use Getopt::Long;

### オプションに型を定義したい

    use opts;
    opts my $foo => { 'Int', required => 1 },
         my $bar => 'Int';

### LWP::UserAgent にファイル名渡してそこにダウンロードさせる ( ファイルが大きい時など )

    use LWP::UserAgent;
    my $filename = '';
    my $ua = LWP::UserAgent->new;
    my $res = $ua->get($url, ':content_file' => $filename);

### 外部コマンドの 標準入力, 標準出力, 標準エラー出力, 終了コード が全て必要、かつ長いかも知れないからストリームで処理したい

    use IPC::Open3;
    use IO::Select;
    use Symbol;

    my ($read, $write, $error) = (undef, undef, gensym());

    my $pid = open3($write, $read, $error, @ARGV)
        or die "ERROR: Unable to execute";

    if ($pid =~ /^open3:/) {
        exit 1;
    }

    my $buf;
    while (read(STDIN, $buf, 4096)) {
        print $write $buf;
    }
    close $write;

    my $sel = IO::Select->new();
    $sel->add($read);
    $sel->add($error);

    while (my @ready = $sel->can_read) {
        foreach my $handle (@ready) {
            if ($handle == $error) {
                while (sysread($handle, $buf, 4096)) {
                    # ここは要件に応じて書き換える
                    print STDERR "ERROR: $buf";
                }
            } elsif ($handle == $read) {
                while (sysread($handle, $buf, 4096)) {
                    # ここは要件に応じて書き換える
                    print $buf;
                }
            }
            $sel->remove($handle) if eof($handle);
        }
    }

    waitpid($pid, 0);

    # ここは要件に応じて書き換える
    if ($? != 0) {
        printf "ERROR CODE?: %s\n", ($? >> 8);
    }

    exit(0);

### モジュールチェック

Makefileがあれば

    cpanm --installdeps .

`make test` 出来るようにしようね！

    find lib -type f | sed -e 's|^lib/||g; s|\.pm$||g; s|/|::|g' > modules.lst
    perl -Mlib::xi -e 'eval "use $_";die $@ if $@' -n modules.lst

### 拡張子変換

    find doc -type f | perl -ne 'chomp;$old=$new=$_;$new=~s|txt$|md|g;rename($old,$new)'
