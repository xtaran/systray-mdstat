#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use File::Which;
use Test::More;

# Needed to avoid warning "Too late to run INIT block at
# /usr/lib/…/perl5/…/Glib/Object/Introspection.pm" on STDERR.
use Glib::Object::Introspection;

my $script = './bin/systray-mdstat';
if (exists($ENV{ADTTMP}) or
    exists($ENV{AUTOPKGTEST_TMP})) {
    $script = which('systray-mdstat');
}

ok(-r $script, "Script $script exists and is readable");
require_ok("$script");

# No testable return value
populate_icon_dirs();

foreach my $basename (qw(
    error harddrivefail harddriveok harddrivespare harddrivewarn
)) {
    like(find_icon_path($basename), qr(/${basename}\.png$),
       "Found $basename.png");
}

my @ok = read_and_parse_mdstat('t/proc/mdstat.ok');
is($ok[0], "md2: OK\nmd1: OK\nmd0: OK",
   "read_and_parse_mdstat return correct text for ok-ish mdstat");
is($ok[1], 1,
   "read_and_parse_mdstat return correct state for ok-ish mdstat");

my @okcheck = read_and_parse_mdstat('t/proc/mdstat.check');
is($okcheck[0], "md2: OK\nmd1: OK (check)\nmd0: OK",
   "read_and_parse_mdstat return correct text for ok-ish mdstat");
is($okcheck[1], 1,
   "read_and_parse_mdstat return correct state for ok-ish mdstat");

my @resync = read_and_parse_mdstat('t/proc/mdstat.resync');
is($resync[0], "md2: OK\nmd1: OK (resync)\nmd0: OK",
   "read_and_parse_mdstat return correct text for warning-ish mdstat");
is($resync[1], 2,
   "read_and_parse_mdstat return correct state for warning-ish mdstat");

my @degraded = read_and_parse_mdstat('t/proc/mdstat.degraded');
is($degraded[0], "md2: <b>DEGRADED</b>\nmd1: OK\nmd0: OK",
   "read_and_parse_mdstat return correct text for degraded-ish mdstat");
is($degraded[1], 3,
   "read_and_parse_mdstat return correct state for degraded-ish mdstat");

my @nonexistent = read_and_parse_mdstat('t/proc/mdstat.nonexistent');
is($nonexistent[0], "No t/proc/mdstat.nonexistent found",
   "read_and_parse_mdstat return correct text for nonexistent mdstat");
is($nonexistent[1], 0,
   "read_and_parse_mdstat return correct state for nonexistent mdstat");

my @degraded4d = read_and_parse_mdstat('t/proc/mdstat.raid1-4disks');
is($degraded4d[0], "md0: <b>DEGRADED</b>",
   "read_and_parse_mdstat return correct text for degraded-ish mdstat");
is($degraded4d[1], 3,
   "read_and_parse_mdstat return correct state for degraded-ish mdstat");

done_testing();
