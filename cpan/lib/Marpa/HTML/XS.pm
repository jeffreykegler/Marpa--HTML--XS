# This software is copyright (c) 2011 by Jeffrey Kegler
# This is free software; you can redistribute it and/or modify it
# under the same terms as the Perl 5 programming language system
# itself.

package Marpa::HTML::XS;

use 5.010;
use strict;
use warnings;
use Carp;

use vars qw( $VERSION $STRING_VERSION );
$VERSION        = '0.001_000';
$STRING_VERSION = $VERSION;
{
## no critic (BuiltinFunctions::ProhibitStringyEval)
## no critic (ValuesAndExpressions::RequireConstantVersion)
    $VERSION = eval $VERSION;
}

use Marpa::HTML::XS::Version;

say join ' ', __FILE__, __LINE__;

use Marpa::XS 1.002000;
use Marpa::HTML 0.112000;
Carp::croak("Marpa::HTML did not load Marpa::XS")
    if $Marpa::HTML::MARPA_MODULE ne 'Marpa::XS';

1;

__END__

=head1 NAME

Marpa::HTML::XS -- XS-only version of Marpa::HTML

=head1 SYNOPSIS

C<use Marpa::HTML::XS;>

=head1 DESCRIPTION

This module uses L<Marpa::HTML> and L<Marpa::XS>.
The documentation is with those two modules.

L<Marpa::HTML> by itself own chooses between L<Marpa::XS> and L<Marpa::PP>.
L<Marpa::HTML> runs L<Marpa::XS> if possible, L<Marpa::PP> otherwise.
This is what users find most convenient, but there is a downside:
since L<Marpa::XS> requires a number of non-Perl dependencies,
the cpantesters almost always run with L<Marpa::PP>.
This makes it difficult for users to determine if
an XS-powered L<Marpa::HTML> has been tested on their system.
The lop-sided testing of L<Marpa::HTML>
is also a major quality assurance for both
L<Marpa::HTML> and L<Marpa::XS>.
This module redresses the balance.

=head1 AUTHOR

Jeffrey Kegler

=head1 COPYRIGHT AND LICENSE

  This software is copyright (c) 2011 by Jeffrey Kegler
  This is free software; you can redistribute it and/or modify it
  under the same terms as the Perl 5 programming language system
  itself.

