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

(setf sequenz (make-array 1 :element-type 'integer :adjustable t))
(setf allSeq (make-array 1 :element-type 'collatz :adjustable t))

(defun newCollatz (start size)
	(make-instance 'collatz :start start :size size))

(defun getCollatz (start)
	(setf (aref sequenz 0 ) start)
	(loop (while (start != 1))
		(if ((% start 2) == 0)
			(setf start (/ start 2))
			(setf start (+ (* 3 start) 1)))
		(vector-push-extend 1 sequenz)
