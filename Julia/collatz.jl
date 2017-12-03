
type Collatz
	start	:: Int
	size	:: Int
end;


function getCollatz(start::Int)
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

function getSize( c::Collatz)
	return c.size
end


endVal = 10000
allseq = Collatz[]

for i= 2:endVal

	sequenz = getCollatz(i)
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
