#! perl -w
use strict;

# 写一个程序，用它解析date命令的输出并判断今天是星期几。
# 如果是工作日，输出get to work，否则输出go play。date
# 命令的输出中，星期一是用Mon来表示的。如果你使用非Unix
# 系统因而没有date命令，那就做一个假的小程序，只要输出像
# date命令的输出结果即可。如果你保证不问下面两行小程序的
# 原理，我们就无偿奉上：
# #! /usr/bin/perl
# print localtime()."\n";
if ( `date` =~ /\AS/ ) {
    print "go play!\n";
}
else {
    print "get to work!\n";
}
