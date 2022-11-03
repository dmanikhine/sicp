#lang sicp
(#%require "../tools/functions.rkt")
(#%require "functions_2_57.rkt")

(#%provide product? multiplier multiplicand make-product)

(define (product? x) (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))
(define (multiplicand p) (make-product-list (cddr p)))

(define (make-product-list seq)
  (if (null? (cdr seq))
      (car seq)
      (cons '* seq)))

(define (make-product . seq) 
  (let ((vars (filter non-number? seq)) 
        (const (accumulate * 1 (filter number? seq)))) 
    (cond ((null? vars) const) 
          ((= 0 const) 0) 
          ((= 1 const) (make-product-list vars)) 
          (else (make-product-list (cons const vars))))))