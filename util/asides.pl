#!/usr/bin/perl -n
BEGIN {
	@lines = ();
	$k = 1;
}

#/<h1>([^<]*)<\/h1>/ and push @lines, "\n#$1\n";

next if(/^<!--/ && /-->$/);

if(/^<!--/ ... /-->/) {
#	print $k, $_; $k++;
	next;
}

if(/noshow/ ... /<\/aside/) {
	next;
}

if(/^<aside/ ... /<\/aside/) {
	#print $k, $_; $k++;
	s/`//g;
	 s/^<aside.*$//;
	 s/^<\/aside.*$//;
	push @lines, $_;
#cutycapt --url=http://localhost:8000/UnidadesDeInformaci%C3%B3n.html#/4 --out=aaa.png
}

END { print @lines; }
