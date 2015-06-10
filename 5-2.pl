#! perl -w
use strict;

print "Enter some lines. then press Ctrl-D:\n"; #或是Ctrl-Z
chomp(my @lines = <STDIN>);

print "1234567890" x 7,"12345\n"; #标尺行, 到第75个字符的地方

foreach (@lines) {
	printf "%20s\n", $_;
}