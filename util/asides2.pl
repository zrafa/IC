#!/usr/bin/perl -n
BEGIN {
	@lines = ();
	$num = 0;
}


if(/^<!-/ ... /-->/) {
	next;
}

/<h1>([^<]*)<\/h1>/ and push @lines, "\n#$1\n";

if(/^<section/) {
	push @lines, "[$num](temp/aaa$num.png)";
	$num++;
}

if(/^<aside/ ... /<\/aside/) {
	s/`//g;
	 s/^<aside.*$//;
	 s/^<\/aside.*$//;
	push @lines, $_;
}

END { print @lines; }
