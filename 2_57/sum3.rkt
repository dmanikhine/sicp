#lang sicp
(#%require "../tools/functions.rkt")
(#%require "functions_2_57.rkt")
(#%provide sum?)
(#%provide addend)
(#%provide augend)
(#%provide make-sum)



(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s)  (augend-pro (cddr s)))

(define (augend-pro seq)
   (let ((vars (filter non-number? seq)) 
        (const (accumulate + 0 (filter number? seq))))
  (cond ((null? vars) const)
        ((and (= 0 const) (null? (cdr vars))) (car vars))
        ((= 0 const) (cons '+ vars) )
        (else (cons '+ (cons const vars)  )))))

 (define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2)))) 

