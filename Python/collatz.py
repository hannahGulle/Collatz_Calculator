#!/usr/bin/python

class collatz:
	def __init__(self, Start, Length):
		self.Start = Start
		self.Length = Length
	
	def getStart(self):
		return self.Start

	def getLength(self):
		return self.Length


def getCollatz(start):
	sequence = [start]

	while start != 1:
		if start%2 ==0 :
			start = start / 2
		else:
			start = (3*start)+1
		sequence.append(start)
	return sequence


end = int(10000)

all = []

for i in range(2,end):
	sequence = getCollatz(i)
	size = len(sequence)-1

	c = collatz(i, size)
	all.append( c )

	sequence[:] = []

sorted(all, key=lambda collatz: collatz.Length)

top = 1;

for i in range( len(all)-1 , 1 ):
	if all[i].Length > all[i-1].Length:
		print( all[i].Start + ' ' + all[i].Length )
		top = top + 1
	if top > 10 :
		break
