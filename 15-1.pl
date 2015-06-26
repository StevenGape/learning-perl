#! perl -w
use strict;
# 重写第十章中的第一道习题，也就是猜数字的那题，使用given结构来实现。
# 想想看该如何处理非数值的输入？这里不需要用智能匹配。
use 5.010;

my $Verbose = $ENV{VERBOSE} // 1;

my $secret = int(1 + rand 100);

print "Don't tell anyone, but the secret number is $secret.\n" if $Verbose;

LOOP: {
  print "Please enter a guess from 1 to 100: ";
  chomp(my $guess = <STDIN>);
  my $found_it = 0;

  given($guess) {
    when(! /\A\d+\Z/)   {say "Not a number!"}
    when($_ > $secret)  {say "Too high!"    }
    when($_ < $secret)  {say "Too low!"     }
    default             {say "Just right!"; $found_it++}
  }

  last LOOP if $found_it;
  redo LOOP;
}
