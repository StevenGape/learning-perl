#!/usr/bin/perl -w
use strict;
use Getopt::Std;
use File::Temp qw(tempfile);

my $edquota = '/usr/sbin/edquota';    # edquota 路径
my $autoedq = '/bin/editquota.pl';    # 此脚本的完全路径

# 这是否是此脚本的首个调用？

# 如果命令行参数操作不止一个，那么就是首个调用
# 这样的话，可以分析所有参数，然后调用edquota程序

if ( @ARGV != 1 ) {

    # 冒号（：）表示该标志可以接受参数
    # $opts{u} = 用户 ID, $opts{f} = 文件系统名称
    # $opts{s} = 软限额大小，$opts{h} = 硬限额大小
    getopt( 'u:f:s:h:', \%opts );

    die "USAGE: $0 -u <uid> -f <fsystem> -s <softq> -h <hardq>\n"
      unless ( exists $opts{u}
        and exists $opts{f}
        and exists $opts{s}
        and exists $opts{h} );

    CallEdquota();
}

# 否则的话，我们就是第二个调用，那么应该执行限额编辑
else {
    EdQuota();
}

sub CallEdquota {
    $ENV{'EDITOR'} = $qutoedq;    # 设置EDITOR变量指向脚本自己

    open my $EPROCESS, '|-', "$edquota $opts{u}"
      or die "Unable to start $edquota: $!\n";

    # 把修改内容送给第二个脚本调用
    print $EPROCESS "$opts{f}|$opts{s}|$opts{h}\n";

    close $EPROCESS;
}

sub EdQuota {
    my $tfile = $ARGV[0];    # 从参数中获得edquota的临时文件的名字

    open my $TEMPFILE, '<', $tfile
      or die "Unable to open temp file $tfile: $!\n";

    my ( $SCRATCH_FH, $scratch_filename ) = tempfile()
      or die "Unable to open scratch file: $!\n";

    # 从首个调用中获得修改信息行，并且移除末尾的换行符
    chomp( my $change = <STDIN> );
    my ( $fs, $soft, $hard ) = split( /\|/, $change );   # 分析出限额的值

# 读取临时文件的每一行，看看其中是否有需要修改的文件系统
# 有的话就修改它的限额并且存入草稿文件
    while ( my $quotaline = <$TEMPFILE> ) {
        if ( $quotaline =~ /^fs \Q$fs\E\s+/ ) {
            $quotaline =~ s/(soft\s*=\s*)\d+(, hard\s*=\s*)\d+/$1$soft$2$hard/;
        }
        print $SCRATCH_FH $quotaline;
    }
    close $TEMPFILE;
    close $SCRATCH_FH;

    # 用草稿文件来替换临时文件
    # 以便 edquota 获得修改后的结果
    rename( $scratch_filename, $tfile )
      or die "Unable to rename $scratch_filename to $tfile: $!\n";
}
