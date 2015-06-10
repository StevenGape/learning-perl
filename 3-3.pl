#! perl -w
use strict;

print "Please input some string : \n";
chomp(my @lines = <STDIN>);
@lines = sort @lines;
print "After sort:\n";
foreach (@lines) {
	print $_;
}
print "\n";
print "After sort and change line:\n";
foreach (@lines) {
	print $_."\n";
}
