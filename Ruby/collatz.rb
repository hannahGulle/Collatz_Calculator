#!/usr/bin/ruby

class Collatz
	# Constructor
	def initialize(start,length)
		@start, @length = start, length
	end

	# Length Getter
	def getLength
		@length
	end

	# Start Getter
	def getStart
		@start
	end
end

def getCollatz(start)
	sequence = [start]
	
	while start != 1 do
		if start%2 == 0 then
			start = start / 2
		else
			start = (3*start)+1
		end
		sequence.push(start)
	end

	return sequence
end

endVal = 10000
allseq = []
2.step(endVal,1) do |i|
	sequence = getCollatz(i)
	size = sequence.length - 1

	c = Collatz.new(i, size)
	allseq.push( c )

	sequence.clear
end

allseq.sort do |a,b| a.getLength <=> b.getLength end

top = 1

(allseq.length-1).step(1, -1) do |i|
	if allseq[i].getLength > allseq[i-1].getLength then
		puts "#{ allseq[i].getStart } #{ allseq[i].getLength }"
		top = top + 1
	end
	if top > 10 then
		break
	end
end






