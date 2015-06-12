#! perl -w
use 5.010;
# 修改前面这个程序，告诉所有新来的人之前已经迎接了哪些人：
# greet('Fred');
# greet('Barney');
# greet('Wilma');
# greet('Betty');
# 按照语句的顺序，它应该打印出：
# Hi Fred! You are the first one here!
# Hi Barney! I've seen:Fred
# Hi Wilma! I've seen:Fred Barney
# Hi Betty! I've senn:Fred Barney Wilma

greet('Fred');
greet('Barney');
greet('Wilma');
greet('Betty');

sub greet {
	state @persons;

	my $name = shift;

	print "Hi $name! ";

	if (@persons > 0) {
		print "I've seen: @persons\n";
	} else {
		print "You are the first one here!\n";
	}
	push @persons, $name;
}
