#! perl -w
use strict;
use 5.010;

# 附加题：修改上一题的程序，使其在定位到以a结尾的单词后，最多再将之后
# 的5个字符（如果有那么多的话）捕获至一个独立的内存变量。修改程序输出，
# 把所有捕获到的这两个内存变量都输出来。假设你输入的字符串是I saw Wilma
# yesterday，那么后面取到5个字符就是“yest”。如果你输入的是I,Wilma!,
# 那么第二个内存变量的内容只会有一个字符。看看你的模式是否还可以成功匹配
# wilma这个简单的字符串？
while (<STDIN>) {
    chomp;
    if (
        m!
			(\b\w*a\b)
			(.{0,5})
		!xs
      )
    {
        print "Matched: |$`<$&>$'|\n";    #特殊捕获变量
        print "'\$1' contains '$1'\n";
        print "'\$2' contains '$2'\n";
    }
    else {
        print "No match: |$_|\n";
    }
}
