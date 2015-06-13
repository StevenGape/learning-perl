#! perl -w
use strict;
# 修改上题程序，使其在匹配到以a结尾的单词的同时也将其存储在$1里。接着
# 修改程序的输出，让变量的内容出现在单引号中，例如：$1 contains 'Wilma'。
while (<STDIN>) {
	chomp;
	if (/(\b\w*a\b)/) {
		print "Matched: |$`<$&>$'|\n"; #特殊捕获变量
		print "\$1 contains '$1'\n";
	} else {
		print "No match: |$_|\n";
	}
}
