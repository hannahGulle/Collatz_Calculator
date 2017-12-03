
type Collatz
	start	:: Int
	size	:: Int
end;


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

function getSize( c::Collatz)
	return c.size
end


endVal = 10000
allseq = Collatz[]

for i= 2:endVal

	sequenz = [i]
	getCollatz(sequenz, i)
	size = countnz(sequenz)-1

	c = Collatz(i, size)
	push!(allseq, c )
	empty!(sequenz)
end

sort!( allseq, by=getSize)

top = 1

for i= countnz(allseq):-1:1
	if allseq[i].size > allseq[i-1].size
		println( allseq[i].start, " ", allseq[i].size)
		top = top+1
	end
	if top > 10
		break
	end
end
