#! perl -w
use strict;
use 5.010;

while (<STDIN>) {
	chomp;
	if (m!
			(\b\w*a\b)
			(.{0,5})
		!xs) {
		print "Matched: |$`<$&>$'|\n"; #特殊捕获变量
		print "'\$1' contains '$1'\n";
		print "'\$2' contains '$2'\n";
	} else {
		print "No match: |$_|\n";
	}
}