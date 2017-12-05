#!/usr/bin/perl

# Hannah Gulle
# collatz object
package collatz;
sub new {

	my $class = shift;
	my $self = {
		_start => shift,
		_size => shift,
	};

	bless $self, $class;
	return $self;
}

# sets the start value of a given sequence
sub setStart {
	
	my ($self, $start ) = @_;
	$self->{_start} = $start if defined($start);
	return $self->{_start};
}

# sets the size of a given sequence
sub setSize {

	my ($self, $size ) = @_;
	$self->{_size} = $size if defined($size);
	return $self->{_size};
}

# returns the start of a given sequence
sub getStart {

	my( $self ) = @_;
	return $self->{_start};
}

# returns the size of a given sequence
sub getSize {

	my( $self ) = @_;
	return $self->{_size};
}
1;
