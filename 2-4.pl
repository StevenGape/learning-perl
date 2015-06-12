#! perl -w
use strict;
# 写一个程序，提示用户键入两个数字（分两行键入），然后输出两者的乘积。
print "input std1:";
my $std1=<stdin>;
print "input std2:";
my $std2=<stdin>;
print "output std1*std2:";
print $std1*$std2;
