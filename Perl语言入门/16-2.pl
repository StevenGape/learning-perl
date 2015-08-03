#! perl -w
use strict;

# 修改前面的程序，让它将命令的输出送到当前目录下
# 的ls.out文件，错误输出则送到le.err文件。
# （请不必对结果文件为空的情况做任何特别处理。）
open STDOUT, '>', 'ls.out' or die "Can't write to ls.out: $!";
open STDERR, '>', 'ls.err' or die "Can't write to ls.err: $!";
chdir '/' or die "Can't chdir to root directory: $!";
exec 'ls', '-l' or die "Can't exec ls: $!";
