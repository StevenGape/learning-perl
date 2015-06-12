#! perl -w
use strict;
# 写一个功能跟cat相似的程序，但将各行内容反序后输出（有些操作系统会有一个名为tac的类似工具）。假如用
# ./tac fred barney betty来运行你额程序，它的输出结果应该是betty文件的最后一行到第一行，接着是文
# 件barney与fred，同样是由最后一行到第一行。（如果你将此程序取名为tac，请一定要在运行时加上./，这样
# 才不会运行你的系统中现有同名程序！）
print reverse <>;
