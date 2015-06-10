#! perl -w
use strict;

while (<STDIN>) {
	chomp;
	if (/(\b\w*a\b)/) {
		print "Matched: |$`<$&>$'|\n"; #特殊捕获变量
		print "\$1 contains '$1'\n";
	} else {
		print "No match: |$_|\n";
	}
}