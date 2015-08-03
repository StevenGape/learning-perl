#! perl -w
use strict;

# 写一个程序，让用户键入一个目录名称并从当前目录却换过去。如果用户键入
# 一行空白符，则以也难怪乎主目录作为默认目录，所以应当会切换到他本人的主目录
# 中。然后输出该目录的内容（不含名称以点号开头的文件）并按照英文字母顺序排
# 列。（提示：用目录句柄还是用文件名通配更容易呢？）如果切换目录失败则应显
# 示警告信息，但不必输出目录内容。

print "Which directory?(Default is your home directory) ";
chomp( my $dir = <STDIN> );
if ( $dir =~ /\A\s*\Z/ ) {
    chdir or die "Can't chdir to your home directory: $!";
}
else {
    chdir $dir or die "Can't chdir to ‘$dir’: $!";
}

my @files = <*>;
foreach (@files) {
    print "$_\n";
}
