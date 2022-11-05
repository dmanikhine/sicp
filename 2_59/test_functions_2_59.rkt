#lang sicp

(#%require "functions_2_59.rkt")
(#%require "../tools/functions.rkt")

(define tset (list 1 2 3 4 5))

(element-of-set? 1 tset)
(element-of-set? 0 tset)

(element-of-set? 7 (adjoin-set 7 tset))

(define tset1 (list 1 2 3 4 5))
(define tset2 (list 4 5 6 7 8))

(element-of-set? 5 (intersection-set tset1 tset2))
(union-set tset1 tset2)
(f-union-set tset1 tset2)

(f-intersection-set tset1 tset2)


(filter (lambda (x) (not (element-of-set? x tset2))) tset1) 