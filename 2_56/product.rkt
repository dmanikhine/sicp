#lang sicp
(#%require "functions_2_56.rkt")
(#%provide multiplier multiplicand product? make-product)


(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))


(define (product? x) (and (pair? x) (eq? (car x) '*)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
