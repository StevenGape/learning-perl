#! perl -w
use strict;
# 如果你在前题使用的是目录句柄，那么请以文件名通配重写一次；如果
# 使用的是文件名通配，那么请以目录句柄重写依次。
print 'Which directory? (Default is your home directory) ';
chomp(my $dir = <STDIN>);
if ($dir =~ /\A\s*\Z/) {
  chdir or die "Can't chdir to your home directory: $!";
} else {
  chdir $dir or die "Can't chdir to '$dir': $!";
}

opendir DOT, "." or die "Can't opendir dot: $!";
foreach (sort readdit DOT) {
  # next if /\A\z/; ##如果跳过文件名以点号开头的文件
  print "$_\n";
}
