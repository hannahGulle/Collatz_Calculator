#!/usr/bin/python

class collatz:
	def __init__(self, Start, Length):
		self.Start = Start
		self.Length = Length


def getCollatz(sequence, start):

	if start == 1:
		return sequence
	elif start % 2 == 0:
		sequence.append( start/2 )
		return getCollatz( sequence, start/2 )
	else:
		sequence.append( (3*start)+1 )
		return getCollatz( sequence, (3*start)+1 )


end = int(10000)
allseq = []
for i in range(2,end):

	sequence = [i]
	sequence = getCollatz(sequence, i)
	size = len(sequence)-1

	c = collatz(int(i), int(size))
	allseq.append( c )

	sequence[:] = []

allseq.sort(key=lambda collatz: collatz.Length)

top = int(1);
for i in range( len(allseq)-1 , 1 , -1):
	if allseq[i].Length > allseq[i-1].Length:
		print( allseq[i].Start, allseq[i].Length )
		top += 1
	if top > 10 :
		break








