#!/usr/bin/ruby
# Hannah Gulle
# Program computes the top 10 starting values whose collatz sequence
# lengths are highest for a user given range

# collatz object holds sequence start and length
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

# returns the sequence for a given starting value
# unrecursively
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

# retrieve the highest starting integer from the user
print "Input the Highest Starting Integer\n"
endVal = gets.to_i

# array holds all collatz objects for the range
allseq = []

# array holds collatz objects in the top 10 range
topTen = []

# finds the collatz sequence structure values for
# each starting value within the range
2.step(endVal,1) do |i|
	sequence = getCollatz(i)
	size = sequence.length - 1

	c = Collatz.new(i, size)
	allseq.push( c )

	sequence.clear
end

print "\nTop 10 Starting Integers After Sorting by Length\n"
# sorts all collatz structures by sequence length
allseq = allseq.sort_by &:length

# outputs the top 10 by seqeucne length
# and adds to the topTen array
top = 1

(allseq.length-1).step(1, -1) do |i|
	if allseq[i].length > allseq[i-1].length then
		topTen.push( allseq[i] )
		puts "#{ allseq[i].start } #{ allseq[i].length }"
		top = top + 1
	end
	if top > 10 then
		break
	end
end

print "\nTop 10 Starting Integers After Sorting by Start\n"
# sorts top 10 collatz structures by seqeunce start
topTen = topTen.sort_by &:start

(topTen.length-1).step(0,-1) do |i|
	puts "#{ topTen[i].start} #{ topTen[i].length }"
end




