#! perl -w
use strict;

# 使用之前程序中的子程序，计算从1加到1000的总和。
my $allsum = total( 1 .. 1000 );
print "The sum of 1 to 1000 is : $allsum.\n";

sub total {
    my $sum = 0;
    foreach my $num (@_) {
        chomp $num;
        $sum += $num;
    }
    return $sum;
}
