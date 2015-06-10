#! perl -w
use strict;
use 5.010;
# 修改前一个练习的程序，打印额外的调试信息，例如程序选择的秘密数字。
# 确保修改的部分可以用开关控制，而且调试开关即使关上也不会产生警告信息。
# 如果在使用perl5.10或更新的版本，可以使用//操作符，否则请使用条件操作符

my $Debug = $ENV{DEBUG} // 1;
my $secret = int(1 + rand 100);

print "Don't tell anyone, but the secret number is $secret.\n" if $Debug;

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
