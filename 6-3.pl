#! perl -w
use strict;

# 编程读取输出%ENV哈希中所有的键-值对，输出按照ASCII编码顺序，
# 分两列打印。附加题:设法让打印结果纵向对齐。注意length函数可以
# 帮助确定第一列的宽度。测试完毕后加入更多新环境变量再次验证程序
# 的输出正确无误。
my $longest = 0;
foreach my $key ( keys %ENV ) {
    my $key_length = length($key);
    $longest = $key_length if $key_length > $longest;
}

foreach my $key ( sort keys %ENV ) {
    printf "%-${longest}s  %s\n", $key, $ENV{$key};
}
