#!/usr/bin/perl
# Hannah Gulle

# collatz object
package collatz_arb;
# constructor
sub new {

	my $class = shift;
	my $self = {
		_start => shift,
		_size => shift,
	};

	bless $self, $class;
	return $self;
}

# sets start for seqeunce
sub setStart {
	
	my ($self, $start ) = @_;
	$self->{_start} = $start if defined($start);
	return $self->{_start};
}

# sets size for sequence
sub setSize {

	my ($self, $size ) = @_;
	$self->{_size} = $size if defined($size);
	return $self->{_size};
}

#retrieves start for sequence
sub getStart {

	my( $self ) = @_;
	return $self->{_start};
}

# retrieves size for sequence
sub getSize {

	my( $self ) = @_;
	return $self->{_size};
}
1;
