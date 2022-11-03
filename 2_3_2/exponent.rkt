#lang sicp
(#%require "../tools/functions_2_3_2.rkt")
(#%provide exponentiation?)
(#%provide base)
(#%provide exponent)
(#%provide make-exponentiation)


(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))
(define (base e) (cadr e))
(define (exponent e) (caddr e))
(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        (else (list '** base exponent))))
