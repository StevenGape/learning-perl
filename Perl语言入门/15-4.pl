#! perl -w
use strict;

# 使用given和智能匹配写个程序，从命令行得到一个数字，
# 打印出这个数字除了1和它本身以外的因数。比如输入99，
# 你写得程序该报告3、9、11和33这4个数。如果输入的数字
# 就是一个质数，程序要报告说明这是质数。如果输入的不是
# 数字，也应该报告说明输入有误，不会继续计算。虽然可以
# 用if结构和笨拙匹配来实现，不过作为联系，这里请只用
# 智能匹配来实现。
# 作为开始，下面给出一段返回质数的子程序供你使用。它会
# 尝试从2到输入数字$number的一半范围内的数字，看哪些
# 可以被整除：
# sub divisors {
#   my $number = shift;
#
#   my @divisors = ();
#   foreach my $divisor ( 2 .. ( $number/2 ) ) {
#     push @divisors, $divisor unless $number % $divisor;
#   }
#
#   return @divisors;
# }
use 5.010;

say "Checking the number <$ARGV[0]>";

given ( $ARGV[0] ) {
    when ( !/\A\d+\Z/ ) { say "Not a number!" }
    my @divisors = divisors($_);

    my @empty;
    when ( @divisors ~~ @empty ) { say "Number is prime" }

    default { say "$_ is divisible by @divisors" }
}

sub divisors {
    my $number = shift;

    my @divisors = ();
    foreach my $divisor ( 2 .. ( $number / 2 ) ) {
        push @divisors, $divisor unless $number % $divisor;
    }

    return @divisors;
}
