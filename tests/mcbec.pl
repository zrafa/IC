#!/usr/bin/perl -n
use strict;
use Data::Dumper;

my $DEBUG = 0;

my %vars;
my @prog;
my @consts;
my $lastconst = 0; 

my ($main, $end);

/main()/ and $main = 1;
/^}$/ and $end = 1;

/^\s*int *(\S+\d*) *= *(\d*) *; *$/ and newinit($1, $2);	# int a = 1
/^\s*int *(\S+\d*) *; *$/ and newvar($1);			# int a
/^\s*(\S+\d*) *= *(\d+) *\+ *(\d+) *; *$/ and asg2($1, $2, $3);	# a = 1 + 2;
/^\s*(\S+\d*) *= *(\d+) *; *$/ and asg1($1, $2); 		# a = 1;


sub fatal {
	my $msg = shift;
	print "error: $msg\n";
	exit;
}

sub myprint {
	my @msg = @_;
	print "@msg\n" if $DEBUG;
}

sub asg1 {
	my ($k, $v) = @_;

	if(! testvar($k)) {
		fatal("Variable $k no declarada");
	} 
	
	my $dato = "DATO".$lastconst++;
	push @consts, "$dato:\t$v";
	push @prog, (
		"\tLD $dato",
		sprintf "\tST %s",uc($k)
	);
}

sub asg2 {
	my ($k, $v1, $v2) = @_;

	myprint "ENTRANDO EN ASG2\n";

	if(! testvar($k)) {
		fatal("Variable $k no declarada");
	} 
	
	my $dato1 = "DATO".$lastconst++;
	my $dato2 = "DATO".$lastconst++;

	push @consts, "$dato1:\t$v1";
	push @consts, "$dato2:\t$v2";
	my $seq = sprintf "\tLD %s\n\tADD %s\n;\tST %s\n",
			$dato1, $dato2, uc($k);
	push @prog, (
		"\tLD $dato1",
		"\tADD $dato2",
		sprintf "\tST %s",uc($k)
	);
}
	

sub testvar {
	my $k = shift;
	
	if(defined %vars{$k}) {
		myprint("Encontrado $k con ". %vars{$k});
		return 1;
	} else { return 0; }
}

sub setvar {
	my ($k, $v) = @_;
	$vars{$k} = $v;
	
}

sub newvar {
	my $k = shift;

	if(testvar($k)) {
		fatal("Variable $k redeclarada");
	}
	setvar($k, 0);
}

sub newinit {
	my ($k, $v) = @_;

	if(testvar($k)) {
		fatal("Variable $k redeclarada");
	}
	setvar($k, $v);
}

sub outprog {
	foreach my $i (@prog) {
		print "$i\n";
	}
}

sub outvars {
	while(my ($k,$v) = each %vars) {
		printf "%s:\t%s\n", uc($k), $v;
	}
}

sub outconsts {
	foreach my $i (@consts) {
		print "$i\n";
	}
}


END {
#	$DEBUG=1;
	myprint(Dumper(%vars));
	myprint(Dumper(@prog));
	myprint(Dumper(@consts));
	myprint("-----------");
	outprog;
	outvars;
	outconsts;
	
}		
