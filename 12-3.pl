#! perl -w
use strict;
use 5.010;
# 写一个程序，用栈式文件测试操作符列出命令行参数指定的所有文件，看看拥有者是否是你自己，以及它们
# 是否可读、可写。

say "Looking for my files that are readable and writable";
die "No files specified!\n" unless @ARGV;

foreach my $file (@ARGV) {
  say "$file is readable and writable" if -o -r -w $file;
  # print "$file is readable and writable\n" if (-w $file && -r _ && -o _);
}
