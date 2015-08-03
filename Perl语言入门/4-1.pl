#! perl -w
use strict;

# 写一个名为total的子程序，它可以返回给定列表中数字相加的总和。提示：该子程序不需要执行任何I/O，它只
# 需要按要求处理它的参数并给调用者返回一个值就行了。用下面这个程序来检验一下你写完的子程序，第一次调用
# 时返回的列表中数字的总和应该是25.

my @fred       = qw{ 1 3 5 7 9 };
my $fred_total = total(@fred);
print "The total of \@fred is $fred_total.\n";
print "Enter some numbers on separate lines: ";
my $user_total = total(<STDIN>);
print "The total of those numbers is $user_total.\n";

sub total {
    my $sum = 0;
    foreach my $num (@_) {
        chomp $num;
        $sum += $num;
    }
    return $sum;
}
