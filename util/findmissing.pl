#!/usr/bin/perl -w
## findmissing.pl - script to iterate dex paths and find missing episodes
# use case:
#-rw-r--r-- 1 conor conor 185128960 2011-10-04 02:31 Archer - 01 - 05 - Honeypot.avi
#-rw-r--r-- 1 conor conor 184854528 2011-10-04 02:31 Archer - 01 - 07 - Skytanic.avi

use strict;
use warnings;

use Getopt::Long;

my (%f);

GetOptions(\%f, "help", "verbose:i", "conf:s");
help() if $f{help};

print "foo\n";

exit;

## subs below

sub help {
    print "help not yet implemented\n";
	exit;
}

