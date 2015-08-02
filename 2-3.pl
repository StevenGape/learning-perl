#! perl -w
use strict;

# 修改上题的程序，当用户键入小于0的半径时，输出0，而不是负数。
my $r      = <stdin>;
my $pai    = 3.141592654;
my $mianji = 2 * $r * $pai;
if ( $r < 0 ) {
    print "mianji: 0";
}
else {
    print "mianji: $mianji";
}
