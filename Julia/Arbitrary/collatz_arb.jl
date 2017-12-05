# Hannah Gulle
# Program Computes the

# Collatz Type holds sequence start and sequence size
type Collatz
	start	:: BigInt
	size	:: BigInt
end;

# returns the collatz sequence size
function getCollatz(start::BigInt)
	seq = [start];

	while start != 1 
		if start%2 == 0
			start = start / 2
		else
			start = (3*start)+1
		end
		push!(seq, start)

	end
	return seq
end

# returns the sequence size of a given collatz object
function getSize( c::Collatz)
	return c.size
end

# returns the sequence start of a given collatz object
function getStart( c::Collatz)
	return c.start
end

println("Input the Highest Starting Integer")
endVal = readline()
endVal = parse(Int, endVal)

# create an array of collatz types to hold all
# collatz sequence size and start values
allseq = Collatz[]

# iterate through range to find the 
# collatz sequence size
for i= 2:endVal

	sequenz = getCollatz(BigInt(i))
	size = countnz(sequenz)-1

	c = Collatz(BigInt(i), BigInt(size))
	push!(allseq, c )
	empty!(sequenz)
end

println("")
println("Top 10 Starting Values After Sorting by Length")

# Sort the array of collatz types by seqeunce size
sort!( allseq, by=getSize)

# array to hold top 10 values
top = 1
topTen = Collatz[]

# output top 10 values sorted by size
for i= countnz(allseq):-1:1
	if allseq[i].size > allseq[i-1].size
		push!( topTen, allseq[i] )
		println( allseq[i].start, " ", allseq[i].size)
		top = top+1
	end
	if top > 10
		break
	end
end

println("")
println("Top 10 Starting Values After Sorting by Start")

# sort the top 10 values by start
sort!( topTen, by=getStart )

# output the top 10 values after sorting by start
for i=10:-1:1
	println( topTen[i].start, " ", topTen[i].size )
end
