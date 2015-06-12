#! perl -w
# 写一个程序，读入一些字符串（每行一个），直到文件结尾为止。然后，请按照ASCII码顺序输出所有字符串。换句话
# 说，加入你键入的是fred、barney、wilma、betty，输出应该显示barney betty fred wilma。所有
# 的字符串可以成一行输出吗？或者分开在不同行输出？你能分别让程序以这两种方式输出吗？
print "input string:";
chomp(@lines=<STDIN>);
@relines=reverse @lines;
foreach (@relines){
	print $_."\n";
}
