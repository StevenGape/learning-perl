#! perl -w
use strict;
# 编写功能和mv类似的程序，将命令行的第一个参数重命名为第二个参数（不必
# 实现mv的各种选项或任何额外的参数）。别忘了第二个参数可以是目录。
# 假如它是目录，请在新目录中使用原来的基名。
use File::Basename;
use File::Spec;

my($source, $dest) = @ARGV;

if (-d $dest) {
  my $basename = basename $source;
  $dest = File:Spec->catfile($dest, $basename);
}

rename $source, $dest or die "Can't rename '$source' to '$dest': $!\n";
