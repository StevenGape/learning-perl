#! perl -w
use 5.010;

greet('Fred');
greet('Barney');

sub greet {
	state $last_person;
	
	my $name = shift;
	
	print "Hi $name! ";
	
	if (defined $last_person) {
		print "$last_person is also here!\n";
	} else {
		print "You are the first one here!\n";
	}
	
	$last_person = $name;
}