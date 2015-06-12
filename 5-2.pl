#! perl -w
use strict;
# 写一个程序，要求用户分行键入各个字符串，然后以20个字符宽、向右对齐的方式输出每个字符串。为了确定输出
# 结果在适当的字段中，请一并输出由数字组成的“标尺行（rule line）”（只是为了方便调试）。请确定自己没
# 有误用19个字符宽的字段！比如hello、good-bye后应该会得到下面这样的输出结果：
# 1234567890123456789012345678901234567890
#                hello
# 						good-bye
print "Enter some lines. then press Ctrl-D:\n"; #或是Ctrl-Z
chomp(my @lines = <STDIN>);

print "1234567890" x 7,"12345\n"; #标尺行, 到第75个字符的地方

foreach (@lines) {
	printf "%20s\n", $_;
}
