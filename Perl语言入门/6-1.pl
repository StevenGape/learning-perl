#! perl -w
use strict;

# 编程读入用户指定的名字并汇报相应的姓。拿熟人的姓和名测试，如果你太专注于计算机以至于一个人也不认识
# 的话，也可以使用下面这个列表：
# 表6-1：数据样本
# 输入		输出
# fred	 flintstone
# barney rubble
# wilma	 flintstone
my %last_name = qw{
  fred flintstone
  barney rubble
  wilma flintstone
};
print "Please enter a first name: ";
chomp( my $name = <STDIN> );
print "That's $name $last_name{$name}";
