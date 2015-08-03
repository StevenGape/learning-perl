#! perl -w
use strict;

# 修改上一个程序，让用户自行选择字符宽度，因此在键入30的时候，hello、good-bye（在不同行上）应该会
# 向右对齐到第30个字符（提示：关于如何控制变量的内插，请参阅第二章中的“字符串中的变量内插”一节）。
# 附加题：根据用户键入的宽度，自动调整标尺行的宽度。
print "What column width would you like?";
chomp( my $width = <STDIN> );

print "Enter some lines. then press Ctrl-D:\n";    #或是Ctrl-Z
chomp( my @lines = <STDIN> );

print "1234567890" x ( ( $width + 9 ) / 10 ),
  "\n";    #长度按需变化的标尺行

foreach (@lines) {
    printf "%${width}s\n", $_;
}
