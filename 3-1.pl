#! perl -w
print "input string:";
chomp(@lines=<STDIN>);
@relines=reverse @lines;
foreach (@relines){
	print $_."\n";
}
