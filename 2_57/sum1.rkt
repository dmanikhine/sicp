#lang sicp
(#%require "../tools/functions.rkt")
(#%require "functions_2_57.rkt")
(#%provide addend)
(#%provide augend)
(#%provide make-sum sum?)


(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s)    
   (accumulate make-sum 0 (cddr s))) 


(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
