#!/usr/bin/perl -w
use strict;

use User::pwent;
use File::stat;

# 注意：这段代码对那些启用了自动挂载的home目录的机器来说
# 可能是非常重的负担
while ( my $pwent = getpwent() ) {

    # 确保我们操作的目录是真正的目录，而不是符号链接
    my $dirinfo = stat( $pwent->dir . '/.' );
    unless ( defined $dirinfo ) {
        warn 'Unable to stat ' . $pwent->dir . ": $!\n";
        next;
    }
    warn $pwent->name
      . "'s homedir is not owned by the correct uid ("
      . $dirinfo->uid
      . ' instead '
      . $pwent->uid . ")!\n"
      if ( $dirinfo->uid != $pwent->uid );

    # 对于那些设置了 “sticky” 属性(01000)的目录来说，所有人可写入并不是问题
    # 请参考 chmod 命令的手册来了解详细信息
    warn $pwent->name . "'s homedir is world-writable!\n"
      if ( $dirinfo->mode & 022 and ( !$dirinfo->mode & 01000 ) );
}
endpwent();
