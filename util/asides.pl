#!/usr/bin/perl -n

/<h1>([^<]*)<\/h1>/ and print "\n#$1\n";


if(/^<aside/ ... /<\/aside/) {
	s/`//g;
	 s/^<aside.*$//;
	 s/^<\/aside.*$//;
	print;
}
