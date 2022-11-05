#lang sicp

(#%require "functions_2_60.rkt")

(define tset (list 2 3 2 1 3 2 2))

(element-of-set? 1 tset)
(element-of-set? 0 tset)

(element-of-set? 7 (adjoin-set 7 tset))

(define tset1 (list 1 2 3 4 5 1 2 3 4 5))
(define tset2 (list 4 5 6 7 8 4 5 6 7 8))

(intersection-set tset1 tset2)
(union-set tset1 tset2)