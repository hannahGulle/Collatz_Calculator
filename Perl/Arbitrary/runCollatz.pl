#!/usr/bin/perl

use collatz;

my $end = 10000;
my @all = ();
my @seq = ();
my $col;

my @temp = ( 12 );
my @test = getCollatz( 12 , \@temp );
print scalar(@test)-1 . "\n";


for( my $i = 0; $i < scalar(@test)-1; $i++){
	print @test[$i] . "\n";
}

for( my $i = 2; $i < $end; $i++ ){

	@seq = ($i);
	@seq = getCollatz( $i, \@seq );
	$col = new collatz( $i, scalar(@seq)-1 );
	push @all, $col;
	@seq = ();
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
		$start = $start/2;
		push @sequence, $start;
		return getCollatz( $start, \@sequence );
	}
	else{
		$start = ($start * 3)+1;
		push @sequence, $start;
		return getCollatz( $start, \@sequence );
	}
}
