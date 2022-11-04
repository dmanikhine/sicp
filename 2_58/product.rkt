#lang sicp
(#%require "functions_2_58.rkt" "../tools/functions.rkt")
(#%provide multiplier multiplicand product? make-product)


(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))


(define (product? x)
  (pair?
   (filter
    (lambda(i) (eq? i '*))
    x))) 

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list 'm1 '* m2))))
