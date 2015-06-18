#! perl -w
use strict;
# 如果操作系统支持，请修改上题程序，让它接受可能出现在
# 其他参数之前的-s选项。此选项表示要建立的是软链接，而
# 非硬链接（即使系统无法使用硬链接，也请用这个程序试试
# 看是否至少能建立软链接）。
use File::Basename;
use File::Spec;

my $symlink = $ARGV[0] eq '-s';
shift @ARGV if $symlink;

my($source, $dest) = @ARGV;
if (-d $dest) {
  my $basename = basename $source;
  $dest = File::Spec->catfile($dest, $basename);
}

if ($symlink) {
  symlink $source, $dest
    or die "Can't make soft link from '$source' to '$dest': $!\n";
} else {
  link $source, $dest
    or die "Can't make hard link from '$source' to '$dest': $!\n";
}
