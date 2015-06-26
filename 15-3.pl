#! perl -w
use strict;
# 用for-when写个程序，要求从命令行遍历某个目录下的文件列表，并
# 报告每个文件是否可读、可写或可执行。不需要使用智能匹配。
use 5.010;

for(@ARGV) {
  say "Processing $_";

  when( ! -e ) {say "\tFile does not exits!"}
  when( -r _ ) {say "\tReadable!"; continue}
  when( -w _ ) {say "\tWritable!"; continue}
  when( -x _ ) {say "\tExecutable!"; continue}
}
