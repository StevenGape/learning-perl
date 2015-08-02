#! perl -w
use 5.010;

# 写一个名为greet的子程序，当给定一个人名作为参数时，打印出欢迎他得信息，并告诉他前一个来宾的名字。
# greet("Fred");
# greet("Barney");
# 按照语句的顺序，它应该打印出：
# Hi Fred! You are the first one here!
# Hi Barney! Fred is also here!

greet('Fred');
greet('Barney');

sub greet {
    state $last_person;

    my $name = shift;

    print "Hi $name! ";

    if ( defined $last_person ) {
        print "$last_person is also here!\n";
    }
    else {
        print "You are the first one here!\n";
    }

    $last_person = $name;
}
