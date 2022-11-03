#lang sicp
(#%require "functions_2_56.rkt")
(#%provide addend augend sum? make-sum)


(define (addend s) (cadr s))
(define (augend s) (caddr s))


(define (sum? x) (and (pair? x) (eq? (car x) '+)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

