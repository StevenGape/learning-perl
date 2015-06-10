#! perl -w
use strict;
use 5.010;

while (<STDIN>) {
	chomp;
	if (/(?<word>\b\w*a\b)/) {
		print "Matched: |$`<$&>$'|\n"; #特殊捕获变量
		print "'word' contains '$+{word}'\n";
	} else {
		print "No match: |$_|\n";
	}
}