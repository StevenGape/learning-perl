#! perl -w
use strict;
# 写个程序，输出含有要求的单词的行。要求的单词用大写字母开头，但并非全大写。
# 此程序是否匹配含有Fred的行，而不匹配含有fred或FRED的行？
while (<>) {
	if (/[A-Z][a-z]+/) {
		print;
	}
}
