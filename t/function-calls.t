#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use File::Which;
use Test::More;

my $script = 'bin/systray-mdstat';
if (exists($ENV{ADTTMP}) or
    exists($ENV{AUTOPKGTEST_TMP})) {
    $script = which('systray-mdstat');
}

ok(-r $script, "Script $script exists and is readable");
require_ok("./$script");

foreach my $basename (qw(
    error harddrivefail harddriveok harddrivespare harddrivewarn
)) {
    is(find_icon_path($basename), "share/$basename.png",
       "Found $basename.png");
}

my @ok = read_and_parse_mdstat('t/proc/mdstat.ok');
is($ok[0], "md2: OK; md1: OK; md0: OK",
   "read_and_parse_mdstat return correct text for ok-ish mdstat");
is($ok[1], 1,
   "read_and_parse_mdstat return correct state for ok-ish mdstat");

my @warning = read_and_parse_mdstat('t/proc/mdstat.check');
is($warning[0], "md2: OK; md1: OK (check); md0: OK",
   "read_and_parse_mdstat return correct text for warning-ish mdstat");
is($warning[1], 2,
   "read_and_parse_mdstat return correct state for warning-ish mdstat");

my @degraded = read_and_parse_mdstat('t/proc/mdstat.degraded');
is($degraded[0], "md2: <b>DEGRADED</b>; md1: OK; md0: OK",
   "read_and_parse_mdstat return correct text for degraded-ish mdstat");
is($degraded[1], 3,
   "read_and_parse_mdstat return correct state for degraded-ish mdstat");

my @nonexistent = read_and_parse_mdstat('t/proc/mdstat.nonexistent');
is($nonexistent[0], "No t/proc/mdstat.nonexistent found",
   "read_and_parse_mdstat return correct text for nonexistent mdstat");
is($nonexistent[1], 0,
   "read_and_parse_mdstat return correct state for nonexistent mdstat");

done_testing();
