-- Hannah Gulle
-- Computes the 10 largest collatz sequences from 2 to a given
-- positive integer value.
-- November 27, 2017

-- Implements the Following Features
-- Ada Dynamic Array
-- Ada Typing
-- Ada Records

with Ada.Text_IO; use Ada.Text_IO;


-- Main Program
procedure runCollatz is

-- Retrieve the Highest Integer Starting Value from the User
endval: Integer;

-- C like struct "Collatz" holds the starting position
-- and collatz sequence length
type collatz is record
	start : Integer;
	length : Integer;
end record;
type collatzArr is array ( Natural range <> ) of collatz;

topTen		: collatzArr(1..10);	-- Collatz Struct Array of top 10 Structs
c 		: collatz;	-- Collatz Struct Variable
seqSize 	: Integer;	-- Size of the Current Collatz Sequence
start, top 	: Integer;	-- Initial Position Variable


-- Swap Procedure used during the Sorting of the Collatz Struct Array
procedure swap( x,y : in out collatz) is
	temp: collatz;
begin
	temp := x;
	x := y;
	y := temp;
end swap;


-- Sorts the Collatz Struct Array by Struct Length
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
function sortbyStart( allseq: in out collatzArr; endval: Integer) return collatzArr is
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

-- ******************** MAIN PROGRAM BEGINS *********************** --
begin

-- Retrieve the Size of the Collatz Array of Structs
Put_Line("Input the Hightest Integer Starting Value");
endval := Integer'value(Get_Line);
Put_Line("");

-- Dynamically Allocated Array Determines the Size of the Collatz Array 
-- after Runtime
declare
allseq 		: collatzArr(1..endval);-- Array of ALL Collatz Structs
begin

-- Constructs a collatz object for each starting value from 2 to the highest end value
for i in 2 .. endval loop

	start := i;
	seqSize := 0;

	-- Determine the Collatz Seqeuence for the starting value (start)
	while( start /= 1 ) loop
		if(  start mod 2 = 0 ) then
			start := start / 2;
		else
			start := (3*start)+1;
		end if;
		seqSize := seqSize + 1;
	end loop;
	
	-- Provide the collatz start and sequence size to the collatz
	-- object c for insertion in the collatz array (allseq)
	c.start := i;
	c.length := seqSize;
	allseq( i-1 ) := c; 
end loop;

Put_Line("Top 10 Starting Values After Sorting by Length");

-- Sorts collatz struct array by Length
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
Put_Line("Top 10 Starting Values After Sorting by Start");

-- Sorts collatz struct array by Start
topTen := sortbyStart( topTen, 10 );

-- Prints the top 10 lengths after sorting by start
for i in reverse 1 .. 10 loop
	Put_Line( natural'image(topTen(i).start) & " " & natural'image(topTen(i).length));
end loop;
end;
end runCollatz;
