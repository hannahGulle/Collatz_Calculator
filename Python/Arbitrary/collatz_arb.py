#!/usr/bin/python

class collatz:
	def __init__(self, Start, Length):
		self.Start = Start
		self.Length = Length


def getCollatz(start):
	sequence = [start]

	while start != 1:
		if start%2 ==0 :
			start = long(start / 2)
		else:
			start = long((3*start)+1)
		sequence.append(start)
	return sequence


end = long(10000)
allseq = []
for i in range(2,end):
	sequence = getCollatz(i)
	size = len(sequence)-1

	c = collatz(long(i), long(size))
	allseq.append( c )

	sequence[:] = []

allseq.sort(key=lambda collatz: collatz.Length)

top = int(1);
for i in range( len(allseq)-1 , 1 , -1):
	if allseq[i].Length > allseq[i-1].Length:
		print "%d %d" % (allseq[i].Start, allseq[i].Length)
		top += 1
	if top > 10 :
		break
