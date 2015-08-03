#! perl -w
use strict;

# 写一个程序，从命令行参数指定的文件中找出最旧的文件并且以天数汇报它已存在了多久。若列表是空得（也就是
# 命令行中没有提及任何文件），那么它该做什么？

die "No file names supplied!\n" unless @ARGV;
my $oldest_name = shift @ARGV;
my $oldest_age  = -M $oldest_name;

foreach (@ARGV) {
    my $age = -M;
    ( $oldest_name, $oldest_age ) = ( $_, $age ) if $age > $oldest_age;
}

printf "The oldest file was %s, and it was %.1f days old.\n", $oldest_name,
  $oldest_age;
