#! perl -w
# 修改前一题程序，把所有的Fred换成Wilma并把所有的Wilma换成Fred。
# 如果输入的是fred&wilma，那么正确的输出应是Wilma&Fred。
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
    chomp;
    s/Fred/\n/gi;       # 将所有的FRED替换为临时的占位符
    s/Wilma/Fred/gi;    # 将所有的WILMA替换为FRED
    s/\n/Wilma/g;       # 再讲所有占位符换回为Wilma
    print $out_fh "$_\n";
}
