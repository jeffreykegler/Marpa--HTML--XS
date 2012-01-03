# This software is copyright (c) 2012 by Jeffrey Kegler
# This is free software; you can redistribute it and/or modify it
# under the same terms as the Perl 5 programming language system
# itself.

build:
	(cd cpan;perl Build.PL)
	(cd cpan;./Build realclean)
	(cd cpan;perl Build.PL)
	(cd cpan;./Build)
	(cd cpan;./Build distmeta)
	(cd cpan;./Build test)
	(cd cpan;./Build disttest)

update:
	(cd cpan;perl Build.PL)
	(cd cpan;./Build)
	(cd cpan;./Build distmeta)
	(cd cpan;./Build dist)
	(cd cpan;perl Build.PL)
