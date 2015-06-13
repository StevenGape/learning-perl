#! perl -w
use strict;
# 附加题：写个程序，输出在输入数据中同时出现wilma以及fred的每一行。
while (<>) {
	if (/wilma/) {
		if (/fred/) {
			print ;
		}
	}
}
