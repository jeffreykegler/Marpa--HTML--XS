# This software is copyright (c) 2011 by Jeffrey Kegler
# This is free software; you can redistribute it and/or modify it
# under the same terms as the Perl 5 programming language system
# itself.

# This is a shim.  It forces the load of the
# Marpa::HTML library to do it via Marpa::HTML::XS
package Marpa::HTML;

use 5.010;
use strict;
use warnings;
use Carp;

use Marpa::HTML::XS 0.001_000;
say STDERR "Loaded Marpa::XS ", Marpa::XS::VERSION;
say STDERR "Loaded Marpa::HTML ", Marpa::HTML::VERSION;
Carp::croak("Marpa::HTML did not load Marpa::XS")
    if Marpa::HTML::MARPA_MODULE ne 'Marpa::XS';

1;
