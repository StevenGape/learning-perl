#! perl -w
use strict;

# 修改上题的程序，让它提示用户键入半径的长度。当用户键入12.5时，出来的计算
# 结果应该和上题相同。

my $r      = <stdin>;
my $pai    = 3.141592654;
my $mianji = 2 * $r * $pai;
print "mianji: $mianji";
