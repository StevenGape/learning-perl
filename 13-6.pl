#! perl -w
use strict;
# 如果你的系统支持，写一个功能和ln类似的程序，建立从第一个参数
# 到第二个参数的硬链接（不必实现ln的各种选项或额外参数）。如果
# 系统不支持硬链接，那只要输出关于它本来会进行的操作的信息就行
# 了。提示：这个程序和前一题有点像，洗完这个提醒可以节省你写程序
# 的时间。
use File::Basename;
use File::Spec;

my($source, $dest) = @ARGV;

if (-d $dest) {
  my $basename = basename $source;
  $dest = File::Spec->catfile($dest, $basename);
}

link $source, $dest
  or die "Can't link '$source' to '$dest': $!\n";
