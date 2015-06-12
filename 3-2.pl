#! perl -w
use strict;
# 写一个程序，读入一些数字（每行一个），直到文件结尾为止。然后，根据每一个数字输出如下名单中相应的人名
# （请将这份名单写在程序里，也就是说，你的程序代码里应该出现这份名单）。比方说，如果输出的数字是1、2、4
# 和2，那么输出的人名将会是fred、betty、dino和betty：
# fred betty barney dino wilma pebbles bamm-bamm
my @users = qw / fred betty barney dino wilma pebbles bamm-bamm /; #数组
print "Please input some num : \n";
chomp(my @inputNum = <STDIN>); #输入数组
print "The names are :\n";
foreach my $index(@inputNum){ #循环数组
	print $users[$index-1]."\n"; #输出数组中相应序号对应的人名
}
