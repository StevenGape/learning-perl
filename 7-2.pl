#! perl -w
use strict;

# 修改上题程序，让它也能接受Fred。那么，当你的输入字符串是Fred、
# frederick或者Alfred时，是否也匹配？（请将包含这些名称的各行
# 加到刚才的文本文件。）
while (<>) {
    if (/[fF]red/) {
        print;
    }
}
