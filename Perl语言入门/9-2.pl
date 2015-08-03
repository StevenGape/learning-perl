#! perl -w
# 写个程序来复制并修改指定的文本文件。在副本里，此程序会把
# 出现字符串Fred（大小写不计）的每一处都换成Larry（也就是
# Manfred Mann换成ManLarry Mann）。输入文件名应该在命
# 令行上指定（不询问用户），输出文件名则是本来的文件名加上.out。
my $in = $ARGV[0];
if ( !defined $in ) {
    die "Usage: $0 filename";
}

my $out = $in;
$out =~ s/(\.\w+)?$/.out/;

if ( !open $in_fh, '<', $in ) {
    die "Can't open '$in': $!";
}

if ( !open $out_fh, '>', $out ) {
    die "Can't write '$out': $!";
}

while (<$in_fh>) {
    s/Fred/Larry/gi;
    print $out_fh $_;
}
