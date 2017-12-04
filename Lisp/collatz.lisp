#!/usr/bin/sbcl --script

(defstruct collatz 
	(start 0)
	(size 0))

(defvar top)
(defvar endVal)
(defvar allSeq)
(defvar seqSize)
(defvar i)
(defvar j)
(defvar k)
(defvar temp)

(format t "What's the Hightest Value?~%")
(setf endVal (read))
(setf allSeq (make-array endVal))

(setf seqSize 0)

; Returns the size of the collatz sequence
(defun getCollatz (start seqSize)
	(setf seqSize 0)
	(loop while (not(eq start 1)) do
		(if (eq (mod start 2) 0)
			(setf start (/ start 2))
			(setf start (+ (* 3 start) 1))
		)
		(setf seqSize (+ seqSize 1 ))
	)		
	(return-from getCollatz seqSize))

; Find Collatz Sequence for Each number from 2 to the Highest End Value (endVal)
(setf i 2)
(loop
	(setf seqSize (getCollatz i seqSize))
	(setf (aref allSeq (- i 1)) (make-collatz :start i :size seqSize))
	(setf i (+ i 1))
	(when (> i endVal) (return))
)

; Sort Array of Collatz Structs
(setf i 1)
(loop
	(setf j i)
	(setf k (+ i 1))
	(loop		
		(if (< (collatz-size (aref allSeq k)) (collatz-size (aref allSeq j)))
			(setf j k))		
		(setf k (+ k 1))
		(when (>= k endVal) (return))
	)

	(if (not (eq j i))
		(progn
			(setf temp (aref allSeq i))
			(setf (aref allSeq i) (aref allSeq j ))
			(setf (aref allSeq j) temp)
		)
	)
	(setf i (+ i 1))
	(when (>= i (- endVal 1)) (return))
)

(setf top 1)
(setf i (- endVal 1))
(loop
	(if (> (collatz-size (aref allSeq i)) (collatz-size (aref allSeq (- i 1))))
		(progn
			(format t "~D ~D ~%" (collatz-start (aref allSeq i)) (collatz-size (aref allSeq i)))
			(setf top (+ top 1))
		)
	)
	(when (> top 10) (return))

	(setf i (- i 1))
	(when (<= i 2) (return))
)
