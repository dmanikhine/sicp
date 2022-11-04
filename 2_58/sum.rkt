#lang sicp
(#%require "functions_2_58.rkt" "../tools/functions.rkt")
(#%provide addend augend sum? make-sum)


(define (addend s)
  (let ((before-plus (take-while (lambda (x) ( not (eq? x '+))) s)))
    (remove-parenthesis before-plus)))

(define (augend s)
  (let ((after-plus (cdr (memq '+ s))))
  (remove-parenthesis after-plus)))

  

(define (sum? x)
  (pair?
   (filter
    (lambda(i) (eq? i '+))
    x)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

