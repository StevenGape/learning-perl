#! perl -w
use strict;

while (<>) {
	chomp;
	if (/\s\z/) {
		print "#$_#\n";
	}
}