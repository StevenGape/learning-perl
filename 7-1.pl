#! perl -w
use strict;
# 写一个程序，从输入中读取数据，遇到包含fred字符串的行就
# 打印出该行（对于输入中得其他行则不做任何事）。如果输入中
# 的某一行包含字符串Fred、frederick或者Alfred，请问是否
# 会匹配并打印？另外写个文本文件，在里面随意编个“fred filintstone”
# 跟他朋友的故事。然后用这个文件作为输入来测试这一题以及后面
# 几道题。
while (<>) {
	if (/fred/) {
		print;
	}
}
