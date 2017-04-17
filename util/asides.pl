#!/usr/bin/perl -n
BEGIN {
	@lines = ();
}

/<h1>([^<]*)<\/h1>/ and push @lines, "\n#$1\n";

if(/^<!--/ ... /-->/) {
	next;
}

if(/^<aside/ ... /<\/aside/) {
	s/`//g;
	 s/^<aside.*$//;
	 s/^<\/aside.*$//;
	push @lines, $_;
#cutycapt --url=http://localhost:8000/UnidadesDeInformaci%C3%B3n.html#/4 --out=aaa.png
}

END { print @lines; }
