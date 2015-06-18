#! perl -w
use strict;
# 修改前题程序，让它输出所有文件，包括名称以点号开头的文件。
print "Which directory?(Default is your home directory)";

chomp(my $dir = <STDIN>);
if ($dir =~ /\A\s*\Z/) {
  chdir or die "Can't chdir to your home directory:$!";
} else {
  chdir $dir or die "Can't chdir to '$dir': $!";
}

my @files = <.* *>;
foreach (sort @files) {
  print "$_\n";
}
