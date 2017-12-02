#!/usr/bin/ruby

class Collatz
	# Constructor
	def initialize(start,length)
		@start, @length = start, length
	end

	# Length Getter
	def length
		@length
	end

	# Start Getter
	def start
		@start
	end
end

def getCollatz(sequence, start)

	if start == 1 then
		return sequence
	elsif start % 2 == 0 then
		sequence.push( start/2 )
		return getCollatz(sequence, start/2)
	else
		sequence.push( (3*start)+1 )
		return getCollatz(sequence, (3*start)+1)
	end
end


endVal = 10000
allseq = []
2.step(endVal,1) do |i|
	sequence = [i]
	sequence = getCollatz(sequence, i)
	size = sequence.length - 1

	c = Collatz.new(i, size)
	allseq.push( c )

	sequence.clear
end

allseq = allseq.sort_by &:length

top = 1

(allseq.length-1).step(1, -1) do |i|
	if allseq[i].length > allseq[i-1].length then
		puts "#{ allseq[i].start } #{ allseq[i].length }"
		top = top + 1
	end
	if top > 10 then
		break
	end
end






