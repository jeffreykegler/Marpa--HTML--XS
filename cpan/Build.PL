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

use lib File::Spec->catdir('config');
use Marpa::HTML::Build_Me;
use Marpa::HTML::Config;

my %build_requires =
    map { ( $_, $Marpa::HTML::VERSION_FOR_CONFIG{$_} ) }
    qw( Test::More );
my %configure_requires =
    map { ( $_, $Marpa::HTML::VERSION_FOR_CONFIG{$_} ) }
    qw( Module::Build );
my %requires =
    map { ( $_, $Marpa::HTML::VERSION_FOR_CONFIG{$_} ) }
    qw( Marpa::XS Marpa::HTML );
my %recommends = ();
$requires{perl} = 5.010;

my $build = Marpa::HTML::Build_Me->new(
    dist_name          => 'Marpa-HTML-XS',
    module_name        => 'Marpa::HTML::XS',
    dist_author        => 'Jeffrey Kegler',
    dist_abstract      => 'XS-only HTML Parsing',
    requires           => \%requires,
    recommends         => \%recommends,
    build_requires     => \%build_requires,
    configure_requires => \%configure_requires,
    PL_files   => {},    # workaround Module::Build bug
    meta_merge => {
        resources => {
            repository =>
                'git://github.com/jeffreykegler/Marpa--HTML--XS.git',
        },
    },
        no_index => {
            directory => [qw( config script )],
            namespace => [
                'Marpa::HTML::Internal', 'Marpa::HTML::Test',
            ],
            package => [

                # not public, at least for now
                qw(Marpa::HTML::Offset Marpa::HTML::Test Marpa::HTML::Display ),

                # never intended to see the light of day
                qw(Marpa::HTML::Internal),

            ],
        },
    create_readme      => 0,
    test_files         => [ map { glob $_ } qw(t/*.t) ],
);

$build->create_build_script;
