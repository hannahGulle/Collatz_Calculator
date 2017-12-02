#!/usr/bin/sbcl --script

(defclass collatz ()
	((start :accessor start
		:initform 0
		:initarg :start)
	(size 	:accessor size
		:initform 0
		:initarg :size)))

(defvar top)
(defvar endVal)
(defvar seqSize)
(defvar sequenz)
(defvar allSeq)
(defvar sequenzSize)
(defvar allSize)
(defvar i)

(setf sequenz (make-array 1 :element-type 'integer :adjustable t))
(setf sequenzSize 0)
(setf allSeq (make-array 1 :element-type 'collatz :adjustable t))
(setf allSize 1)

(defun newCollatz (start size)
	(make-instance 'collatz :start start :size size))

(defun getCollatz (start)
	(setf (aref sequenz 0 ) start)
	(loop while (not(eq start 1)) do
		(if (eq (mod start 2) 0)
			(setf start (/ start 2))
			(setf start (+ (* 3 start) 1)))
		(vector-push-extend 1 sequenz)
		(setf sequenzSize (+ sequenzSize 1))
		(setf (aref sequenz sequenzSize) start ))
	(return-from getCollatz sequenz))

(setf endVal 10000)
(setf i 2)

(dotimes (i endVal)
	(setf sequenz getCollatz(i))
	(defvar c newCollatz(i size))
	(vector-push-extend 1 allSeq)
	(setf allSize (+ allSize 1))
	(setf (aref allSeq allSize) c)
)
