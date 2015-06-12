#! perl -w
use strict;
# 写一个程序，读入一些字符处（每行一个），直到文件结尾为止。然后，请按照ASCII码顺序输出所有字符串。
# 换句话说，假如你键入的是fred、barney、wilma、betty，输出应该显示barney betty fred wilma。
# 所有的字符串可以成一行输出吗？或者分开在不同行输出？你能分别让程序以这两种方式输出吗？
print "Please input some string : \n";
chomp(my @lines = <STDIN>);
@lines = sort @lines;
print "After sort:\n";
foreach (@lines) {
	print $_;
}
print "\n";
print "After sort and change line:\n";
foreach (@lines) {
	print $_."\n";
}
