#!/usr/bin/python
# Hannah Gulle
# Program computes the top 10 starting numbers whose
# collatz sequence is largest within the user
# specified length

# collatz composite structure holds the sequence
# start and length
class collatz:
	def __init__(self, Start, Length):
		self.Start = Start
		self.Length = Length

# returns the collatz sequence for a given starting value
# non recursively with arbitrary precision
def getCollatz(start):
	sequence = [start]

	while start != 1:
		if start%2 ==0 :
			start = long(start / 2)
		else:
			start = long((3*start)+1)
		sequence.append(start)
	return sequence

# retrieve the highest starting integer from the user
end = long(input("Input the Highest Starting Integer: "))

# array to hold all collatz structures for the range
allseq = []

# array to hold all collatz structures in the top 10 range
topTen = []

# find the collatz sequence structure values for 
# each starting value within the range
for i in range(2,end):
	sequence = getCollatz(i)
	size = len(sequence)-1

	c = collatz(long(i), long(size))
	allseq.append( c )

	sequence[:] = []

print("\nTop 10 Starting Integers After Sorting by Length")
# sort all collatz structures by sequence Length
allseq.sort(key=lambda collatz: collatz.Length)

# output the top 10 by sequence length
# and add to the topTen array
top = int(1);
for i in range( len(allseq)-1 , 1 , -1):
	if allseq[i].Length > allseq[i-1].Length:
		topTen.append( allseq[i] )
		print "%d %d" % (allseq[i].Start, allseq[i].Length)
		top += 1
	if top > 10 :
		break

# sort the top 10 collatz by sequence start
topTen.sort(key=lambda collatz: collatz.Start)

print("\nTop 10 Starting Integers After Sorting by Start")

# output the top 10 by sequence start
for i in range( len(topTen)-1, -1, -1):
	print( "%d %d" % (topTen[i].Start, topTen[i].Length))

