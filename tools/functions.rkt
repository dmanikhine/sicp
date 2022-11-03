#lang sicp
(#%provide non-number?)
(#%provide testtest)

(define (non-number? x) (not (number? x)))
(define (testtest x) (cdr x))
