#! perl -w
use strict;

# 写一个程序，计算在半径为12.5时，圆的周长应该是多少。圆周长是半径的长度
# 乘上2π（大约是2乘以3.141592654）。计算结果大约为78.5。

my $r      = 12.5;
my $pai    = 3.141592654;
my $mianji = 2 * $r * $pai;
my @t      = localtime;
print "mianji: $mianji\n";
foreach (@t) {
    print "$_\n";
}
