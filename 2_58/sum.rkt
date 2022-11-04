#lang sicp
(#%require "functions_2_58.rkt" "../tools/functions.rkt")
(#%provide addend augend sum? make-sum)


(define (addend x)
  (define (iter result tail)
    (if (eq? '+ (car tail))
        (if (null? (cdr result)) (car result)
            result)
        (iter (append result (list (car tail))) (cdr tail))))   
  (iter '() x))


(define (augend x)
  (let ((tail (memq '+ x)))
  (if (null? (cddr tail)) (cadr tail)
      (cdr tail))))
             


  ;(if (eq? '+ (car x))
  ;     (if (null? (cddr x)) (cadr x)
  ;          (cdr x))       
  ;    (augend (cdr x))))


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

