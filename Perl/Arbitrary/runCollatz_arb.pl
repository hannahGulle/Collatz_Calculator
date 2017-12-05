#!/usr/bin/perl

# Hannah Gulle
# Program computes the top 10 starting integers whose collatz
# sequences are the longest

# using collatz object with arbitrary precision
use collatz_arb;
use bignum;

print "Input Highest Starting Integer: ";
my $end = <stdin>;

# array to hold all collatz objects
my @all = ();
my $size = 0;

# array to hold top 10 collatz objects
my @topTen = ();

# retrieves the collatz seqeunce for each
# starting point within the range
for( my $i = 2; $i < $end; $i++ ){

	my @sequence = getCollatz( $i );
	$size = @sequence - 1;
	my $col = new collatz_arb( $i, $size );
	push @all, $col;
	@sequence = ();
}

# sorts all collatz objects by sequence size
print "\nTop 10 Starting Integers After Sorting by Size\n";
@all = sort {
	$a->getSize() <=> $b->getSize(); 
} @all;

# outputs the top 10 starting integers after sorting by size
# and adds each into the topTen array
$top = 1;
for( my $i = @all - 1; $i > 1; $i-- ){

	if( @all[$i]->getSize() > @all[$i-1]->getSize() ){
		push @topTen, @all[$i];
		print @all[$i]->getStart(). " " .@all[$i]->getSize(). "\n";
		$top++;
	}
	if( $top > 10 ){
		last;
	}
}

print "\nTop 10 Starting Integers After Sorting by Start\n";
# sorts top 10 collatz objects by sequence start
@topTen = sort {
	$a->getStart() <=> $b->getStart();
} @topTen;

# outputs top 10 after sorting by start
for( my $i = @topTen - 1; $i > -1; $i-- ){
	print @topTen[$i]->getStart()." ".@topTen[$i]->getSize()."\n";
}
# returns the collatz sequence for a given starting value
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
