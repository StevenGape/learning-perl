#! perl -w
use strict;

# 如果操作系统支持，写一个程序，让它在当前目录下查找所有符号链接
# 并输出它们的值（和ls-l的格式一样：name->value）。

foreach ( golob('.* *') ) {
    my $dest = readlink $_;
    print "$_ -> $dest\n" if defined $dest;
}
