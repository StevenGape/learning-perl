#! perl -w
use strict;
use DateTime;
# 写一个程序，用DateTime模块计算当前日期和输入日期之间的间隔。输入日期时，在命令行依次键入表示年 月
# 日的数字：
# $ perl duration.pl 1960 9 30
# 50 years, 8 monts, and 2 days

my @t = localtime;

my $now = DateTime->new(
    year    => $t[5] + 1900,
    month   => $t[4] + 1,
    day     => $t[3],
    );

my $then = DateTime->new(
    year    => $ARGV[0],
    month   => $ARGV[1],
    day     => $ARGV[2],
    );

my $duration = $now - $then;

my @units = $duration->in_units(qw(years months days));

printf "%d years, %d months, and %d days\n", @units;
