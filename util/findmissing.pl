#!/usr/bin/perl -w
## findmissing.pl - script to iterate dex paths and find missing episodes
# use case:
#-rw-r--r-- 1 conor conor 185128960 2011-10-04 02:31 Archer - 01 - 05 - Honeypot.avi
#-rw-r--r-- 1 conor conor 184854528 2011-10-04 02:31 Archer - 01 - 07 - Skytanic.avi

use strict;
use warnings;

use lib '../lib';
use dex::util;

use File::Find; # should we really be iterating files when dex.sqlite should really contain all of the same information?
use Getopt::Long;

my ($begin, $end, @dirs, %f, %xml);

GetOptions(\%f, "help", "verbose:i", "conf:s");
help() if $f{help};

dprint("initializing.. [" . localtime() . "]");

$dex::util::SETTINGS = (defined $f{conf} and -f $f{conf}) ? $f{conf} : '../conf/conor-dex.xml';


%xml = %{ get_settings() };

# no need to look at the movies.. except maybe the Series folder
@dirs = values %{$xml{general}{dir}{tv}};

for my $dir (@dirs) { 
	dprint("  iterating [$dir]");

    my %contents = get_contents($dir); # abstract the hash population so we can implement in either File::Find or DBD::Sqlite

	print "DBGZ" if 0;
}

dprint("cleaning up..");

$end = time();
print "done in " . ($end - $begin) . "s\n";

exit;

## subs below

sub help {
    print "help not yet implemented\n";
	exit;
}

sub dprint {
	my ($msg) = @_;

	return unless $f{verbose} or $xml{general}{debug};

	print $msg . "\n";

	return;
}

sub get_contents {
    # get_contents($dir) - returns a hash populated based on $dir
	# need to recurse into each directory and return a hash like:
	# @{dir->{show}->{season}->{episodes}}


}
