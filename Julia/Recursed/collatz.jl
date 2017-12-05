# Hannah gulle
# Program computes the top 10 collatz seqeunces for 
# a given starting range

# collatz type holds sequence start and sequence size
type Collatz
	start	:: Int
	size	:: Int
end;

# computes the collatz seqeucne size for a given
# starting integer recursively
function getCollatz(seq, start::Int)

	if start == 1 
		return seq
	elseif start%2 == 0
		push!(seq, Int(start/2))
		return getCollatz( seq, Int(start/2))
	else
		push!(seq, Int((3*start)+1))
		return getCollatz( seq, Int((3*start)+1))
	end
end

# returns the size of a given collatz object
function getSize( c::Collatz)
	return c.size
end

# returns the start of a given collatz object
function getStart( c::Collatz )
	return c.start
end

# request the range upper bound from the user
println("Input the Highest Starting Integer")
endVal = readline()
endVal = parse(Int, endVal)

# create an array of collatz types to hold all
# collatz sequence size and start values
allseq = Collatz[]

# iterate through the range to find the collatz
# seqeunce size
for i= 2:endVal

	sequenz = [i]
	getCollatz(sequenz, i)
	size = countnz(sequenz)-1

	c = Collatz(i, size)
	push!(allseq, c )
	empty!(sequenz)
end

println("")
println("Top 10 Starting Values After Sorting by Length")

# sort the array of collatz types by seqeunce size
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
sort!( topTen, by=getStart)

# output top 10 after sorting by start
for i=10:-1:1
	println( topTen[i].start, " ", topTen[i].size)
end
