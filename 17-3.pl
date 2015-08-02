#! perl -w
use strict;

# 修改上题程序，把时间格式改为YYYY-MM-DD的形式。
# 用map逐个输出，并用localtime通过列表切片提取
# 纪元时间的年、月、日字段。注意localtime文档中
# 对它返回的年份和月份数字的说明。最终输出的结果
# 应该和下面类似：
#   fred.txt    2011-10-15    2011-09-28
#   barney.txt  2011-10-14    2011-08-11
#   betty.txt   2011-10-13    2011-07-24
foreach my $file ( glob('*') ) {
    my ( $atime, $mtime ) = map {
        my ( $year, $month, $day ) = ( localtime($_) )[ 5, 4, 3 ];
        $year  += 1900;
        $month += 1;
        sprintf '%4d-%02d-%02d', $year, $month, $day;
    } ( stat $file )[ 8, 9 ];

    printf "%-20s %10s %10s\n", $file, $atime, $mtime;
}
