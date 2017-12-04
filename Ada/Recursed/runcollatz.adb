-- Hannah Gulle
-- Computes the 10 largest collatz sequences from 2 to a given
-- positive integer value.
-- November 27, 2017

with Ada.Text_IO; use Ada.Text_IO;



procedure runCollatz is

endval : Integer := 10000;

type collatz is record
	start : Integer;
	length : Integer;
end record;
type collatzArr is array ( 1..endval ) of collatz;


allseq : collatzArr;
c : collatz;
seqSize : Integer;
start, top : Integer;


procedure swap( x,y : in out collatz) is
	temp: collatz;
begin
	temp := x;
	x := y;
	y := temp;
end swap;


function sort( allseq: in out collatzArr; endval: Integer ) return collatzArr is
j : Integer;
begin
	for i in 1 .. endval-1 loop
	j := i;
	for c2 in i+1 .. endval loop
		if( allseq(c2).length < allseq(j).length) then
			j := c2;
		end if;
	end loop;
	if( j /= i ) then
		swap(allseq(i), allseq(j));
	end if;
	end loop;
return allseq;
end sort;
		 

function getCollatz( start: in out Integer; seqSize: in out Integer) return Integer is
begin

	if( start = 1 ) then
		return seqSize;
	elsif (start mod 2 = 0 ) then
		start := start / 2;
		seqSize := seqSize + 1;
		return getCollatz( start, seqSize );		
	else
		start := (3*start)+1;
		seqSize := seqSize + 1;
		return getCollatz( start, seqSize );
	end if;
end getCollatz;


begin

for i in 2 .. 10000 loop

	start := i;
	seqSize := 0;

	while( start /= 1 ) loop
		if(  start mod 2 = 0 ) then
			start := start / 2;
		else
			start := (3*start)+1;
		end if;
		seqSize := seqSize + 1;
	end loop;
	c.start := i;
	c.length := seqSize;
	allseq( i-1 ) := c; 
end loop;

allseq := sort( allseq, endval );

top := 1;
for i in reverse 1 .. 10000 loop

	if( allseq(i).length > allseq(i-1).length ) then
		Put_Line( natural'image(allseq(i).start) & " " & natural'image(allseq(i).length));
		top := top + 1;
	end if;
	if( top > 10 ) then
		exit;
	end if;

end loop;

end runCollatz;
