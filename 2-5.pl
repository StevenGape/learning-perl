#! perl -w
print "input string:";
my $instr=<stdin>;
print "input num:";
my $innum=<stdin>;
print "output:";
while($innum>0){
	$innum-=1;
	print "$instr";
};