#!/usr/bin/perl

use collatz;

my $end = 10000;
my @all = ();
my $size = 0;

for( my $i = 2; $i < $end; $i++ ){

	my @sequence = getCollatz( $i );
	$size = @sequence - 1;
	my $col = new collatz( $i, $size );
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

	my $start = $_[0];
	my @sequence = ( $start );

	while( $start != 1 ){

		if( $start % 2 == 0 ){
			$start = $start / 2;
		}
		else{
			$start = (3 * $start) + 1;
		}
		push @sequence, $start;
	}
	return @sequence;
}
