#!/usr/bin/perl -n
BEGIN {
	@lines = ();
}

/<h1>([^<]*)<\/h1>/ and push @lines, "\n#$1\n";

if(/^<aside/ ... /<\/aside/) {
	s/`//g;
	 s/^<aside.*$//;
	 s/^<\/aside.*$//;
	push @lines, $_;
}

END { print @lines; }
