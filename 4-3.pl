#! perl -w
use strict;

my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(should be 6 7 8 9 10)\n";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "(should be just 100)\n";

sub above_average {
	my $sum = 0;
	my @arr;
	foreach my $arry(@_) {
		chomp(my $ary = $arry);
		$sum += $ary;
	}
	my $average = $sum / @_;
	foreach my $num(@_) {
		chomp(my $ar=$num);
		if ($num > $average) {
			push @arr, $num;
		}
	}
	return @arr;
}