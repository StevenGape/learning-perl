#! perl -w
use strict;
# 编写程序，在输入字符串中找出指定子字符串出现的位置并将其输出。例如：
# 输入字符串为“Thisisatest.”，而子字符串是“is”，则程序应该会汇报
# 位置2和5；如果子字符串是“a”，程序应该会汇报8；如果子字符串是“t”,
# 程序将汇报什么？
print "Please enter a string: ";
chomp(my $string = <STDIN>);
print "Please enter a substring: ";
chomp(my $sub = <STDIN>);

my @places;

for (my $pos = -1; ; ) {
  $pos = index($string, $sub, $pos + 1);
  last if $pos == -1;
  push @places, $pos;
}

print "Locations of '$sub' in '$string' were: @places\n";
