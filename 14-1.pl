#! perl -w
use strict;
# 编写程序，读入一连串数字并将它们按数值大小排序，将结果以右对齐的格式输出。
# 请用下列数据进行测试：
#   17 1000 04 1.50 3.14159 -10 1.5 4 2001 90210 666

my @numbers;
push @numbers, split while <>
foreach (sort {$a <=> $b} @numbers) {
  printf "%20g\n", $_;
}
