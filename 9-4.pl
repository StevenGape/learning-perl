#! perl -w
use strict;

# 附加题：写个程序，把你目前写过的所有程序都加上版权声明，
# 也就是加上一行这样的文字：
#   ## Copyright (C) 20XX by Yours Steven
$^I = ".bak";    #制作备份
while (<>) {
    if (/\A#!/) {
        $_ .= "## Copyright (C) 20XX by Yours Steven\n";
    }
    print;
}
