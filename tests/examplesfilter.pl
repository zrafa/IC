#!/usr/bin/env perl

# https://metacpan.org/source/VOJ/Pandoc-Elements-0.37/examples

use strict;

use Pandoc::Filter;
use Pandoc::Elements;

sub latex { RawBlock latex => shift }

pandoc_filter 'Div.ejemplo' => sub {
	my ($e, $f, $m) = @_;


	if($f eq 'latex') {
		return [

			latex("\\example{"),
			@{$e->content},
			latex("}")
		];
	}

	return;

};
