#! perl -w
use strict;

my %last_name = qw{
	fred flintstone
	barney rubble
	wilma flintstone
};
print "Please enter a first name: ";
chomp(my $name = <STDIN>);
print "That's $name $last_name{$name}";
