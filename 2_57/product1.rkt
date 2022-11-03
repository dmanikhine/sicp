#lang sicp
(#%require "../tools/functions.rkt")
(#%require "functions_2_57.rkt")

(#%provide product? multiplier multiplicand make-product)

(define (product? x) (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))
(define (multiplicand p)  
   (accumulate make-product 1 (cddr  p)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))