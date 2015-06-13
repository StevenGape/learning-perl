#! perl -w
use strict;
# 写个程序，打印那些有两个相连且相同的非空格字符的行。应该能匹配包括
# 如Mississippi、Bamm-Bamm或者llama等词的行。
while (<>) {
	if (/(\S)\1/) {
		print;
	}
}
