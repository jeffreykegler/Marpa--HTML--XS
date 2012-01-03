#!/usr/bin/perl
# This software is copyright (c) 2011 by Jeffrey Kegler
# This is free software; you can redistribute it and/or modify it
# under the same terms as the Perl 5 programming language system
# itself.

use 5.010;
use strict;
use warnings;
use Carp;
use Fatal qw(open close);
use English qw( -no_match_vars );

use Module::Build;

push @INC, File::Spec->catdir('shim');

my $build = Module::Build->new(
    dist_name     => 'Marpa-HTML-XS',
    module_name   => 'Marpa::HTML::XS',
    dist_author   => 'Jeffrey Kegler',
    dist_abstract => 'XS-only HTML Parsing',
    requires      => {
        perl          => 5.010,
        'Marpa::HTML' => 0.112000,
        'Marpa::XS'   => 1.002000,
    },
    build_requires => { 'Module::Build' => 0.3800 },
    PL_files       => {},             # workaround Module::Build bug
    meta_merge     => {
        resources => {
            repository =>
                'git://github.com/jeffreykegler/Marpa--HTML--XS.git',
        },
    },
    create_readme      => 0,
    create_makefile_pl => 'small',
    test_files         => [ map { glob $_ } qw(t/*.t) ],
);

$build->create_build_script;
