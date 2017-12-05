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

# retruns the collatz sequence for a given starting value
# recursively
def getCollatz(sequence, start):

	if start == 1:
		return sequence
	elif start % 2 == 0:
		sequence.append( start/2 )
		return getCollatz( sequence, start/2 )
	else:
		sequence.append( (3*start)+1 )
		return getCollatz( sequence, (3*start)+1 )

# retrieve the highest starting integer from the user
end = int(input("Input the Highest Starting Integer: "))

# array to hold all collatz structures for the range
allseq = []

# array to hold all collatz structures in the topTen
topTen = []

# find the collatz sequence structure values for
# each starting value within the range
for i in range(2,end):

	sequence = [i]
	sequence = getCollatz(sequence, i)
	size = len(sequence)-1

	c = collatz(int(i), int(size))
	allseq.append( c )

	sequence[:] = []

print("\nTop 10 Starting Integers After Sorting By Length\n")
# sort all collatz structures by sequence length
allseq.sort(key=lambda collatz: collatz.Length)

# output the top 10 by sequence length
# and add to the topTen array
top = int(1);
for i in range( len(allseq)-1 , 1 , -1):
	if allseq[i].Length > allseq[i-1].Length:
		topTen.append( allseq[i] )
		print( allseq[i].Start, allseq[i].Length )
		top += 1
	if top > 10 :
		break

# sort the top 10 collatz by sequence start
topTen.sort(key=lambda collatz: collatz.Start)

print("\nTop 10 Starting Integers After Sorting by Start")

# output the top 10 by sequence start
for i in range( len(topTen)-1, -1, -1):
	print( topTen[i].Start, topTen[i].Length)






