#! perl -w
use strict;

# 写一个程序，从文件中读取一组字符串（每行一个），然后
# 让用户键入模式以便进行字符串匹配。对每一个模式，程序
# 应该说明文件里共有多少字符串匹配成功，分别是哪些字符
# 串。对于所键入的每个新模式，不应该重新读取文件，应该
# 把这些字符串存放在内存里。文件名可以直接写在程序里。
# 假如某个模式不合法（例如：括号不对称），那么程序应该
# 汇报这些错误，并且让用户继续尝试其他模式。假如用户键
# 入的不是模式而是空白行，那么程序就该停止运行。如果你
# 需要一个充满有趣字符串的文件来进行匹配，那么试试samp
# le_text这个文件吧。你应该已经从O'Reilly的网站下载过
# 这个文件了。下载方式请在本书前言中查找。
my $filename = 'path/to/sample_text';
open my $fh, '<', $filename
  or die "Can't open '$filename': $!";
chomp( my @strings = <FILE> );
while (1) {
    print 'Please enter a pattern: ';
    chomp( my $pattern = <STDIN> );
    last if $pattern =~ /\A\s*\Z/;
    my @matches = eval { grep /$pattern/, @strings; };
    if ($@) {
        print "Error: $@";
    }
    else {
        my $count = @matches;
        print "There were $count matching strings:\n", map "$_\n", @matches;
    }
    print "\n";
}
