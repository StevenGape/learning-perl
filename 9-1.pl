#!perl -w
use strict;

# 建立一个模式，无论$what的值是什么，它都可以匹配三个$what的内容
# 连在一起的字符串。也就是说，如果$what的值是fred，那么你的模式应
# 该匹配fredfredfred；若$what的值为fred|barney，那么你的模式
# 应该匹配fredfredbarney、barneyfredfred、barneybarneybarney
# 或许多其他组合。（提示：你应该在模式测试程序的开头放上类似
# my$what='fred|barney'；这样的语句。）
# my $what = 'fred|barney';

while (<>) {
    chomp;
    if (/($what){3}/) {
        print "$_\n";
    }
}
