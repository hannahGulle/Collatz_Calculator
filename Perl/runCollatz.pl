#!/usr/bin/perl

# Hannah Gulle
# Program computes the top 10 starting values within the given 
# user input range from collatz sequences

# collatz object
use collatz;

# retrieve highest starting integer from the user
print"Input Highest Starting Integer\n";
my $end = <stdin>;

# array of all collatz objects
my @all = ();
my $size = 0;

# array of top ten collatz objects
my @topTen = ();

# find each collatz object (seqeunce start and size)
# for each integer in the given range
for( my $i = 2; $i < $end; $i++ ){

	my @sequence = getCollatz( $i );
	$size = @sequence - 1;
	my $col = new collatz( $i, $size );
	push @all, $col;
	@sequence = ();
}

# sort all collatz objects by size
@all = sort {
	$a->getSize() <=> $b->getSize(); 
} @all;

# output top 10 after soring by size
print"\nTop 10 Starting Integers After Sorting by Size\n";
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

# sort top 10 collatz objects by start
@topTen = sort {
	$a->getStart() <=> $b->getStart();
} @topTen;

# output top 10 after sorting by start
print"\nTop 10 Starting Integers After Sorting by Start\n";

for( my $i = @topTen - 1; $i > -1; $i-- ){
	print @topTen[$i]->getStart(). " ". @topTen[$i]->getSize(). "\n";
}

# returns the collatz sequence size for a given starting integer
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
