#!/usr/bin/perl

use collatz;

my $end = 10000;
my @all = ();
my @sequence = ();
my $col;

for( my $i = 2; $i < $end; $i++ ){

	@sequence = ($i);
	@sequence = getCollatz( $i, \@sequence );
	$col = new collatz( $i, scalar(@sequence)-1 );
	push @all, $col;
	@sequence = ();
}

@all = sort {
	$a->getSize() <=> $b->getSize(); 
} @all;


$top = 1;
for( my $i = @all - 1; $i > 1; $i-- ){

	if( @all[$i]->getSize() > @all[$i-1]->getSize() ){
		print @all[$i]->getStart(). " " .@all[$i]->getSize(). "\n";
		$top++;
	}
	if( $top > 10 ){
		last;
	}
}


sub getCollatz {

	my ($start, $seq) = @_;
	my @sequence = @{ $seq };

	if( $start == 1 ){
		return @sequence;
	}
	elsif( $start % 2 == 0 ){
		push @sequence, $start/2;
		return getCollatz( $start/2, \@sequence );
	}
	else{
		push @seqeuence, (3*$start)+1 ;
		return getCollatz( (3*$start)+1, \@sequence );
	}
}
