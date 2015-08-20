#!/usr/bin/perl -w
use strict;

my $passwd = '/etc/passwd';
open my $PW, '<', $passwd or die "Can't open $passwd: $!\n";

my ( $name, $passwd, $uid, $gid, $gcos, $dir, $shell );
while ( chomp( $_ = <$PW> ) ) {
    ( $name, $passwd, $uid, $gid, $gcos, $dir, $shell ) = split(/:/);
    # edit code

}

close $PW;
