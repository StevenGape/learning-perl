#! perl -w
use strict;

# 编程读取一系列单词，每行一个，直到文件中止，然后打印一份列出每
# 个单词出现次数的列表。（提示：别忘了，把未定义值当成数字使用时，
# Perl会自动将它转换成0。回头去看看前面计算总和的习题，可能会有
# 所帮助。）这样，如果输入单词为fred、barney、fred、dino、
# wilma、fred，每个词一行，输出应该告诉我们fred出现了3次。
# 附加题：根据ASCII编码排序输出报表。
my ( @words, $word, %count );
chomp( @words = <STDIN> );

foreach $word (@words) {
    $count{$word} += 1;
}

foreach $word ( keys %count ) {
    print "$word was seen $count{$word} times.\n";
}
