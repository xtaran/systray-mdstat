#!/usr/bin/perl

use ExtUtils::MakeMaker;
use File::ShareDir::Install;

install_share 'images';

WriteMakefile(
    NAME          => 'App::Systray::Mdstat',
    VERSION_FROM  => 'systray-mdstat', # finds \$VERSION
    AUTHOR        => 'Axel Beckert (abe@deuxchevaux.org)',
    LICENSE       => 'gpl3+',
    ABSTRACT_FROM => 'systray-mdstat',
    EXE_FILES     => [qw[systray-mdstat]],
);

package MY;
use File::ShareDir::Install qw( postamble );
