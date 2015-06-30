#! perl -w
use strict;
# （仅限于Unix系统）写一个无限循环程序，让它能捕获信号并
# 报告之前收到过该信号的次数。如果收到INT信号就退出程序。
# 如果可以在命令行使用kill命令，可以像下面这样发送特定
# 信号：
#     $ kill -USR1 12345
# 如果你没法使用命令行工具kill，那就写一个辅助程序发送信号。
# 实际上用Perl的单行程序就能做到：
#     $ perl -e 'kill HUP => 12345'
use 5.010;

sub my_hup_handler    { state $n; say 'Caught HUP: ',  ++$n }
sub my_usr1_handler   { state $n; say 'Caught USR1: ', ++$n }
sub my_usr2_handler   { state $n; say 'Caught USR2: ', ++$n }
sub my_usr2_handler   { say 'Caught INT. Exiting.'; exit }

say "I am $$";

foreach my $signal ( qw(int hup usr1 usr2 ) ) {
  $SIG{ uc $signal } = "my_${signal}_handler";
}

while(1) { sleep 1 };
