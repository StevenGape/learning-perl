#! perl -w
use strict;
# 利用模式测试程序，写个模式，使其能够匹配任何以字母a结尾的单词（以\w组
# 成的单词）。此模式是否能够匹配到wilma？是否无法匹配到barney？此模式
# 是否能够匹配到Mrs.WilmaFlintsone？还有wilma&fred呢？把第七章里
# 的样本文本文件拿到这里测测看（并把这些测试字符串加到该文本文件里）。
while (<>) {
	chomp;
	if (/\b\w*a\b/) {
		print "Matched: |$`<$&>$'|\n"; #特殊捕获变量
	} else {
		print "No match: |$_|\n";
	}
}
