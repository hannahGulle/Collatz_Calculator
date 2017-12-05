#!/usr/bin/sbcl --script

; Hannah Gulle
; ; Program computes the top 10 starting values with the given
; ; user input range for collatz sequences
;
; ; collatz composite structure holds the sequence
; ; start and size values

(defstruct collatz 
	(start 0)
	(size 0))

(defvar top)		; number of top integer values
(defvar endVal)		; highest starting integer
(defvar allSeq)		; array of all collatz structures
(defvar seqSize)	; array of all collatz values in a single sequence
(defvar topTen)		; array of top 10 collatz structures
(defvar i)		; iterative variable
(defvar j)		; iterative variable
(defvar k)		; iterative variable
(defvar temp)		; sorting temporary variable
(defvar start)		; starting integer

; retrieve the highest starting integer from the user
(format t "What's the Hightest Value?~%")
(setf endVal (read))
(setf allSeq (make-array endVal))

; set initial sequence size to zero
(setf seqSize 0)

; make the topTen array to hold 10 elements
(setf topTen (make-array 11))

; Returns the size of the collatz sequence using recursive method
(defun getCollatz (start seqSize)

	(if (eq start 1)
		(return-from getCollatz seqSize)
		(progn; Else start != 1
			(if (eq (mod start 2) 0)
				(progn
					(setf start (/ start 2))
					(setf seqSize (+ seqSize 1))
					(return-from getCollatz (getCollatz start seqSize))
				)
				(progn
					(setf start (+ (* start 3) 1))
					(setf seqSize (+ seqSize 1))
					(return-from getCollatz (getCollatz start seqSize))
				)
			)
		)
	)
)	

; Find Collatz Sequence for Each number from 2 to the Highest End Value (endVal)
; using recursing methods
(setf i 2)
(loop
	(setf seqSize 0)
	(setf start i)
	(setf seqSize (getCollatz start seqSize))
	(setf (aref allSeq (- i 1)) (make-collatz :start i :size seqSize))
	(setf i (+ i 1))
	(when (> i endVal) (return))
)

; Sort Array of Collatz Structs by Size
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

(format t "~%Top 10 Starting Values After Sorting by Size~%")

; output top 10 starting values after sorting by seqeunce size
(setf top 1)
(setf i (- endVal 1))
(loop
	(if (> (collatz-size (aref allSeq i)) (collatz-size (aref allSeq (- i 1))))
		(progn
			; add each top 10 object to the topTen array
			(setf (aref topTen top) (aref allSeq i))
			(format t "~D ~D ~%" (collatz-start (aref allSeq i)) (collatz-size (aref allSeq i)))
			(setf top (+ top 1))
		)
	)
	(when (> top 10) (return))

	(setf i (- i 1))
	(when (<= i 2) (return))
)

; Sort topTen Array of Collatz Structs by start1
(setf i 1)
(loop
 	(setf j i)
	(setf k (+ i 1))
	(loop		
		(if (< (collatz-start (aref topTen k)) (collatz-start (aref topTen j)))
			(setf j k))		
		(setf k (+ k 1))
		(when (>= k 11) (return))
	)
	(if (not (eq j i))
		(progn
			(setf temp (aref topTen i))
			(setf (aref topTen i) (aref topTen j ))
			(setf (aref topTen j) temp)
		)
	)
	(setf i (+ i 1))
	(when (>= i 10) (return))
)

; output top 10 starting values after sorting by start
(format t "~%Top 10 Starting Values After Sorting by Start~%")
(setf i 10)
(loop
	(format t "~D ~D ~%" (collatz-start (aref topTen i)) (collatz-size (aref topTen i)))
	(setf i (- i 1))
	(when (<= i 0) (return))
)
