#! perl -w
use strict;
my $r=12.5;
my $pai=3.141592654;
my $mianji=2*$r*$pai;
my @t = localtime;
print "mianji: $mianji\n";
foreach (@t) {
    print "$_\n";
}
