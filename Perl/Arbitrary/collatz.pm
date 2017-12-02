#!/usr/bin/perl

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

sub setStart {
	
	my ($self, $start ) = @_;
	$self->{_start} = $start if defined($start);
	return $self->{_start};
}

sub setSize {

	my ($self, $size ) = @_;
	$self->{_size} = $size if defined($size);
	return $self->{_size};
}

sub getStart {

	my( $self ) = @_;
	return $self->{_start};
}

sub getSize {

	my( $self ) = @_;
	return $self->{_size};
}
1;
