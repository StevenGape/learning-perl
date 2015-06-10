#! perl -w 
use strict;

my(@words, $word, %count);
chomp( @words = <STDIN>);

foreach $word (@words) {
	$count{$word} += 1;
}

foreach $word (keys %count) {
	print "$word was seen $count{$word} times.\n";
}