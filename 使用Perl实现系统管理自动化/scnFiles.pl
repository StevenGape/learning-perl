#!/usr/bin/perl -s
# 请注意这里使用了-s用于开关(swutch)处理。如果在Windows下缺少perl文件的关联
# 你必须使用perl -s script这样的方式来调用这个脚本。
# 使用-s这样的选项有时也被认为是“复古”-----
# 大多数程序员会加载Getopt::系列模块来完成开关解析。

use Cwd;    #用于定位当前工作目录的模块

# 这个子例程接受某个目录名，并且递归搜索此目录的所有子目录
# 从而发现其中所有名为"core"的文件
sub ScanDirectory {
    my $workdir = shift;

    my $startdir = cwd;    # 开始前先保存当前目录

    chdir $workdir or die "Unable to enter dir $workdir: $!\n";
    opendir my $DIR, '.' or die "Unable to open $workdir: $!\n";
    my @names = readdir $DIR or die "Unable to read $workdir: $!\n";
    closedir $DIR;

    foreach my $name (@names) {
        next if ( $name eq '.' );
        next if ( $name eq '..' );

        if ( -d $name ) {    # 这是一个目录吗？
            ScanDirectory($name);
            next;
        }
        if ( $name eq 'core' ) {    # 这是名为"core"的文件吗？
                # 如果在启动时设置了-r选项，那么执行删除操作
            if ( defined $r ) {
                unlink $name or die "Unable to delete $name: $!\n";
            }
            else {
                print "found one in $workdir!\n";
            }
        }
    }
    chdir $startdir or die "Unable to change to dir $startdir: $!\n";
}

ScanDirectory('.');
