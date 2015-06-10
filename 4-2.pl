#! perl -w 
use strict;

my $allsum = total(1..1000);
print "The sum of 1 to 1000 is : $allsum.\n";

sub total {
	my $sum = 0;
	foreach my $num(@_) {
		chomp $num;
		$sum += $num;
	}
	return $sum;
}
