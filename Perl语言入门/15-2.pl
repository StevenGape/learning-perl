#! perl -w
use strict;

# 用given-when结构写一个程序，根据输入的数字，如果它能被3整除，就打
# 印“Fizz”；如果它能被5整除，就打印“Bin”；如果它能被7整除，就打印
# “Sausage”。比如输入数字15，程序该打印“Fizz”和“Bin”，因为15可以
# 同时被3和5整除。思考一下，可以让程序输出“Fizz Bin Sausage”的最小
# 数字该是多少？
use 5.010;

for ( 1 .. 105 ) {
    my $what = '';
    given ($_) {
        when ( not $_ % 3 ) { $what .= ' Fizz'; continue }
        when ( not $_ % 5 ) { $what .= ' Buzz'; continue }
        when ( not $_ % 7 ) { $what .= ' Sausage' }
    }
    say "$_%what";
}
