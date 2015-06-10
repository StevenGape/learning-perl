#! perl -w
use strict;

while (<>) {
	chomp;
	if (/match/) {
		print "Matched: |$`<$&>$'|\n"; #特殊捕获变量
	} else {
		print "No match: |$_|\n";
	}
}