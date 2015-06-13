#! perl -w
use strict;
use 5.010;
# 修改上题程序，使用命名捕获而不是$1这样的老办法。接着修改程序输出，
# 让标签名字出现在结果中，例如：'word' contains ' Wilma'。
while (<STDIN>) {
	chomp;
	if (/(?<word>\b\w*a\b)/) {
		print "Matched: |$`<$&>$'|\n"; #特殊捕获变量
		print "'word' contains '$+{word}'\n";
	} else {
		print "No match: |$_|\n";
	}
}
