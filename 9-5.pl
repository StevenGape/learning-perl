#! perl -w
use strict;
# 额外附加题：修改前一题程序里的模式，如果文件里已经有版权声明，就不再进行修改。
# 提示：你可能需要知道钻石操作符当前正在读取的文件的名称，
# 可以在$ARGV里找到。
my %do_these;
foreach (@ARGV) {
  $do_these{$_} = 1;
}

while (<>) {
  if (/\A## Copyright/) {
    delete $do_these{@ARGV};
  }
}

@ARGV = sort keys %do_these;
$^I = ".bak"; #制作备份
while (<>) {
  if (/\A#!/) {
    $_ .= "## Copyright (C) 20XX by Yours Steven\n";
  }
  print;
}
