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

use Marpa::XS 1.002000;
use Marpa::HTML 1.112000;
Carp::croak("Marpa::HTML did not load Marpa::XS")
    if Marpa::HTML::MARPA_MODULE ne 'Marpa::XS';

1;
