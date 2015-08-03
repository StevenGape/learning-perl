#!/usr/bin/perl -w

use Cwd;    # 用于定位当前工作目录的模块
$| = 1;     # 关闭I/O缓冲机制

sub ScanDirectory {
    my $workdir = shift;

    my $startdir = cwd;    # 开始前先保存当前目录

    chdir $workdir or die "Unable to enter dir $workdir: $!\n";

    opendir my $DIR, '.' or die "Unable to open $workdir: $!\n";
    my @names = readdir $DIR;
    closedir $DIR;

    foreach my $name (@names) {
        next if ( $name eq '.' );
        next if ( $name eq '..' );

        if ( -d $name ) {    # 这是目录吗?
            ScanDirectory($name);
            next;
        }
        CheckFile($name) or print cwd. '/' . $name . "\n";  # 打印坏文件名
    }
    chdir $startdir or die "Unable to change to dir $startdir: $!\n";
}

sub CheckFile {
    my $name = shift;
    print STDERR 'Scanning ' . cwd . '/' . $name . "\n";

    # 尝试读取此文件的目录信息
    my @stat = stat($name);
    if ( !$stat[4] && !$stat[5] && !$stat[6] && !$stat[7] && !$stat[8] ) {
        return 0;
    }

    # 尝试打开此文件
    open my $T, '<', "$name" or return 0;

    # 一次一个字节地读取文件， 把读出的数据存入$discard
    for ( my $i = 0 ; $i < $stat[7] ; $i++ ) {
        my $r = sysread( $T, $discard, 1 );
        if ( $r != 1 ) {
            close $T;
            return 0;
        }
    }
    close $T;
    return 1;
}

ScanDirectory('.');
