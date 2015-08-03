#! perl -w
use strict;

# 写一个程序，让它进入某个特定（在程序内写死）的目录，
# 比如系统根目录。然后执行ls -l命令获得该目录内的长
# 格式目录列表。（如果你使用非Unix的系统，请使用该系统
# 上相应的命令来取得详细的目录列表。）

chdir '/' or die "Can't chdir to root directory: $!";
exec 'ls', '-l' or die "Can't exec ls: $!";
