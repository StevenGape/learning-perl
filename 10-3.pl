#! perl -w
use strict;
use 5.010;
# 10-3 修改第六章的习题3中得程序（环境变量列表程序），打印出那些未定义的环境变量（显示为undefined
# value）。可以在程序中设定新的环境变量，来测试程序是否正确打印那些具有假值得变量。如果在使用Perl5.10
# 或更新的版本，可以使用//操作符，否则请使用条件操作符。

$ENV{ZERO}      = 0;
$ENV{EMPTY}     = '';
$ENV{UNDEFINED} = undef;

my $longest = 0;
foreach my $key (keys %ENV) {
  my $key_length = length($key);
  $lngest = $key_length if $key_length > $longest;
}

foreach my $key (sort keys %ENV) {
  printf "%-${longest}s %s\n", $key, $ENV{$key} // "(undefined)";
}
