#!/usr/bin/perl

use ExtUtils::MakeMaker;
use File::ShareDir::Install;

install_share 'images';

WriteMakefile(
    NAME          => 'App::Systray::Mdstat',
    VERSION_FROM  => 'systray-mdstat', # finds \$VERSION
    AUTHOR        => 'Axel Beckert (abe@deuxchevaux.org)',
    LICENSE       => 'gpl_3',
    ABSTRACT      => 'small system tray icon which shows the state of local md RAIDs',
    EXE_FILES     => [qw[systray-mdstat]],
);

package MY;
use File::ShareDir::Install qw( postamble );
