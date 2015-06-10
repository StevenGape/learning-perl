#! perl -w
use strict;

print "What column width would you like?";
chomp(my $width=<STDIN>);

print "Enter some lines. then press Ctrl-D:\n"; #或是Ctrl-Z
chomp(my @lines = <STDIN>);

print "1234567890" x (($width+9)/10), "\n"; #长度按需变化的标尺行

foreach (@lines) {
	printf "%${width}s\n", $_;
}