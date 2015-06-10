#! perl -w
use strict;

# 写一个程序，从命令行取得一串文件名，并汇报这额文件是否可读、可写、可执行以及是否确实存在。（提示：如果
# 你可以写一个函数依次做完这些测试会很方便。）如果先对文件做chmod为0，你的程序会汇报什么？（也就是说，
# 如果你使用Unix系统，chmod 0 some_file这样的命令就会把文件标示成不可读、不可写也不可执行。）在大部分
# 的shell下，用星号作为参数，代表当前目录下的所有文件。也就是说，你可以用./ex12-2*这样的命令来向程序
# 一次询问多个要测试文件的属性。

foreach my $file (@ARGV) {
  my $attribs = &attributes($file);
  print "'$file' $attribs.\n"
}

sub attributes {
  #报告某个给定文件的属性
  my $file = shift @_;
  return "Dose not exit" unless -e $file;

  my @attrib;
  push @attrib, "readable" if -r $file;
  push @attrib, "writable" if -w $file;
  push @attrib, "executable" if -x $file;
  return "exists" unless @attrib;
  'is ' . join " and ", @attrib; #返回值
}
