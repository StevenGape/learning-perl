#！ perl -w
use strict;
# 编写程序，让用户不断猜测范围从1到100得秘密数字，直到猜中为止。程序应该以神奇公式int(1+rand100)来
# 随机产生神秘数字。当用户猜错时，程序应该回应“Too hight”或“Too low”。如果用户键入quit或exit等字
# 样，或是键入一个空白行，程序就应该中止。当然,如果用户猜到了，程序也应该中止！

my $secret = int(1 + rand 100);
# 在调试时，可以去掉下面这行注释
# print "Don't tell anyone, but the secret number is $secret.\n";

while (1) {
  print "Please enter a guess from 1 to 100: ";
  chomp (my $guess = <STDIN>);
  if ($guess =~ /quit|exit|\A\s*\z/i) {
    print "Sorry you gave up. The number was $secret.\n";
    last;
  } elsif ($guess < $secret) {
    print "Too small. Try again!\n";
  } elsif ($guess == $secret) {
    print "That was it!$guess\n";
    last;
  } else {
    print "Too large. Try again!\n";
  }
}
