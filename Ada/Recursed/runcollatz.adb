-- Hannah Gulle
-- Computes the 10 largest collatz sequences from 2 to a given
-- positive integer value.
-- November 27, 2017

with Ada.Text_IO; use Ada.Text_IO;

-- Features Implemented 
-- Ada Dynamic Array
-- Ada Record
-- Aday Typing

-- Main Program
procedure runCollatz is

-- Retrieve the Highest Integer Starting Value from the User
endval : Integer;

-- C like struct "Collatz" holds the starting position
-- and collatz sequence length
type collatz is record
	start : Integer;
	length : Integer;
end record;
type collatzArr is array ( Natural range <> ) of collatz;

topTen: collatzArr(1..10); -- Collatz Struct Array of Top 10 Values
c : collatz;		-- Collatz Struct Variable
seqSize : Integer;	-- Size of the Current Collatz Sequence
start, top : Integer;	-- Initial Position Variable

-- Swap Procedure used during the Sorting of the Collatz Struct Array
procedure swap( x,y : in out collatz) is
	temp: collatz;
begin
	temp := x;
	x := y;
	y := temp;
end swap;

-- Sorts the Collatz Struct Array by Struct Length
-- Using: Selection Sort
function sortbyLength( allseq: in out collatzArr; endval: Integer ) return collatzArr is
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
end sortbyLength;
		 
-- Sorts the Collatz Struct Array by Struct Start
-- Using: Selection Sort
function sortbyStart( allseq: in out collatzArr; endval: Integer ) return collatzArr is
j : Integer;
begin
	for i in 1 .. endval-1 loop
	j := i;
	for c2 in i+1 .. endval loop
		if( allseq(c2).start < allseq(j).start) then
			j := c2;
		end if;
	end loop;
	if( j /= i ) then
		swap(allseq(i), allseq(j));
	end if;
	end loop;
return allseq;
end sortbyStart;

-- Determines the Collatz Sequence for the starting value (start) Recursively
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

-- Retrieve the Size of the Collatz Array of Structs
Put_Line("Input the Highest Integer Starting Value");
endval := Integer'value(Get_Line);
Put_Line("");

-- Dynamically Allocated Array Determines the Size of the Collatz Array
-- after Runtime
declare
allseq		: collatzArr(1..endval); -- Array of ALL Collatz Structs
begin


-- Constructs the collatz object for each starting value from 2 to the highest
-- end value
for i in 2 .. endval loop

	start := i;
	seqSize := 0;
	seqSize := getCollatz( start, seqSize);

	-- Provide the collatz start and sequence size to the collatz
	-- object c for insertion in the collatz array (allseq)	
	c.start := i;
	c.length := seqSize;
	allseq( i-1 ) := c; 
end loop;

Put_Line("Top 10 Starting Values After Sorting by Length");

-- Sorts Collatz struct array by length
allseq := sortbyLength( allseq, endval );

-- Prints the top 10 lengths after sorting by length
top := 1;
for i in reverse 1 .. endval loop

	if( allseq(i).length > allseq(i-1).length ) then
		topTen(top) := allseq(i);
		Put_Line( natural'image(allseq(i).start) & " " & natural'image(allseq(i).length));
		top := top + 1;
	end if;
	if( top > 10 ) then
		exit;
	end if;

end loop;

Put_Line("");
Put_Line("Top 10 Starting Values After Sorting By Start");

-- Sorts Collatz struct array by Start
topTen := sortbyStart( topTen, 10 );

-- Prints the top 10 lengths after sorting by Start
for i in reverse 1 .. 10 loop

	Put_Line( natural'image(topTen(i).start) & " " & natural'image(topTen(i).length));

end loop;

end;
end runCollatz;
