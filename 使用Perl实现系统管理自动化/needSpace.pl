#!/usr/bin/perl -w

use File::Find;
use File::Basename;
use strict;

# 原文件扩展名和衍生文件扩展名的哈希
my %derivations = (
    '.div' => '.tex',
    '.aux' => '.tex',
    '.toc' => '.tex',
    '.o'   => '.c',
);

my %types = (
    'emacs' => 'emacs backup files',
    'tex'   => 'files that can be recreated by running La/Tex',
    'doto'  => 'files that can be recreated by recompiling source',
);

my $targets;     # 搜索的结果会存放在这个哈希中
my %baseseen;    # 用来记录访问过的原文件

my $homedir = ( getpwuid($<) )[7];    # 找到用户的home目录

chdir($homedir) or die "Unable to change to your homedir $homedir: $!\n";

$| = 1;                               #以无缓冲方式打印标准输出

print 'Scanning';
find( \&wanted, '.' );
print "done.\n";

sub wanted {

# 为每一个处理中的目录打印一个点号，这样用户可以看到程序还在运行
    print '.' if ( -d $_ );

    # 我们只关心文件
    return unless -f $_;

    # 检查 core 文件
    $_ eq 'core'
      && ( $targets->{core}{$File::Find::name} = ( stat(_) )[7] )
      && return;

    # 检查 emacs 备份和自动保存文件
    ( /^#.*#$/ || /~$/ )
      && ( $targets->{emacs}{$File::Find::name} = ( stat(_) )[7] )
      && return;

    # 检查可删除的tex衍生文件
    ( /\.dvi$/ || /\.aux$/ || /\.toc$/ )
      && BaseFileExists($File::Find::name)
      && ( $targets->{tex}{$File::Find::name} = ( stat(_) )[7] )
      && return;

    # 检查可删除的.o衍生文件
    /\.o$/
      && BaseFileExists($File::Find::name)
      && ( $targets->{doto}{$File::Find::name} = ( stat(_) )[7] )
      && return;
}

sub BaseFileExists {
    my ( $name, $path, $suffix ) = File::Basename::fileparse( $_[0], '\..*' );

    # 如果我们不知道此文件是从哪个文件衍生的
    return 0 unless ( defined $derivations{$suffix} );

    # 如果我们曾经记录过此文件的基文件
    return 1
      if ( defined $baseseen{ $path . $name . $derivations{$suffix} } );

# 如果文件（或者通过链接来引用的文件）存在而且大小不为零
# 在我们缓存信息后返回成功
    return 1
      if ( -s $name . $derivations{$suffix}
        && ++$baseseen{ $path . $name . $derivations{$suffix} } );
}

foreach my $path ( keys %{ $targets->{core} } ) {
    print 'Found a core file taking up '
      . BytesToMeg( $targets->{core}{$path} )
      . 'MB in '
      . File::Basename::dirname($path) . ".\n";
}

foreach my $kind ( sort keys %types ) {
    ReportDerivFiles( $kind, $types{$kind} );
}

sub ReportDerivFiles {
    my $kind     = shift;    # 正在报告的文件类型
    my $message  = shift;    # 此类文件的描述信息
    my $tempsize = 0;

    return unless exists $targets->{$kind};

    print "\nThe following are most likely $message:\n";

    foreach my $path ( keys %{ $targets->{$kind} } ) {
        $tempsize += $targets->{$kind}{$path};
        $path =~ s|^\./|~/|;    # 修改路径，使得输出更加美观
        print "$path ($targets->{$kind}{$path} bytes)\n";
    }
    print 'These files take up ' . BytesToMeg($tempsize) . "MB total.\n\n";
}

sub BytesToMeg {                # 把字节数转化成 x.xxMB 格式
    return sprintf( "%.2f", ( $_[0] / 1024000 ) );
}
