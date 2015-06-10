#! perl -w
use strict;

my @users = qw / fred betty barney dino wilma pebbles bamm-bamm /; #数组
print "Please input some num : \n"; 
chomp(my @inputNum = <STDIN>); #输入数组
print "The names are :\n";
foreach my $index(@inputNum){ #循环数组
	print $users[$index-1]."\n"; #输出数组中相应序号对应的人名
}
