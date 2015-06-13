#! perl -w
use strict;
# 利用模式测试程序，写个模式，使它能匹配match这个字符串。你可以测一下
# 字符串beforematchafter，看是否会正确显示匹配到的部分以及前后的部分？
while (<>) {
	chomp;
	if (/match/) {
		print "Matched: |$`<$&>$'|\n"; #特殊捕获变量
	} else {
		print "No match: |$_|\n";
	}
}
