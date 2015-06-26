#! perl -w
use strict;
# 修改上题程序，报告输入数字的奇偶情况，是否是质数（除1和本身外没有其他
# 可整除的数），是否可以被某个你最喜欢的数字整除。还是只能用智能匹配实现。
use 5.010;

say "Checking the number <$ARGV[0]>";

given( $ARGV[0] ) {
  when( ! /\A\d+\Z/ ) { say "Not a number!" }

  my @divisors = divisors( $ARGV[0] );

  when( @divisors ~~ 2 ) {# 如果2在@divisors里面
    say "$_ is even";
    continue;
  }

  when( !( @divisors ~~ 2 ) ) {# 如果2不在@divisiors里面
    say "$_ is odd";
    continue;
  }

  when( @divisors ~~ $favorite ) {
      say "$_ is divisible by my favorite number";
      continue;
  }

  when( $favorite ) { # $_ ~~ $favorite
    say "$_ is my favorite number";
    continue;
  }

  my @empty;
  when( @divisors ~~ @empty ) { say "Number is prime" }

  default { say "$_ is divisible by @divisors" }
}

sub divisors {
  my $number = shift;

  my @divisors = ();
  foreach my $divisor ( 2 .. ( $ARGV[0]/2 + 1 ) ) {
    push @divisors, $divisor unless $number % $divisor;
  }

  return @divisors;
}
