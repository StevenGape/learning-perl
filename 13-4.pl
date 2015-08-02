#! perl -w
use strict;

# 编写功能和rm类似的程序，删除命令行指定的任何文件（不用
# 支持rm的所有参数）。
unlink @ARGV;

# foreach (@ARGV) {
#   unlink $_ or warn "Can't unlink '$_' : $!,continuing...\n";
# }
