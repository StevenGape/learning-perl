#! perl -w
use strict;

# 编写程序，以不区分大小写的字符顺序把下列的哈希数据按姓氏排序后输出。
# 当姓一样时，再按名排序（还是一样，不区分大小写）。也就是说，输出结果
# 中的第一个名字应该是Fred的，最后一个应该是Betty的。所有姓相同的人
# 应该要排在一起。千万别更改原始数据。这些名字应该以它们原本的大小写形
# 式显示：
# my %last_name = qw{
#   fred flintstone Wilma Flintstone Barney Rubble
#   betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE
# };
#

my %last_name = qw{
  fred flintstone Wilma Flintstone Barney Rubble
  betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE
};

my @keys = sort {
    "\L$last_name{$a}" cmp "\L$last_name{$b}"    #按姓氏排序
      or "\L$a" cmp "\L$b"
} keys %last_name;

foreach (@keys) {
    print "$last_name{$_}, $_\n";
}
