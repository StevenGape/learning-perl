#!/usr/bin/perl -w
use File::Find;

my $max;
my $maxlength;

File::Find::find( { wanted => \&wanted }, '.' );

print "max:$max\n";

sub wanted {
    return unless -f $_;
    if ( length($_) > $maxlength ) {
        $max       = $File::Find::name;
        $maxlength = length($_);
    }
    if ( length($File::Find::name) > 200 ) { print $File::Find::name, "\n"; }
}
