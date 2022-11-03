#lang sicp
(#%provide product?)
(#%provide non-number?)
(#%provide =number?)
(#%provide variable?)
(#%provide same-variable?)

(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (=number? exp num) (and (number? exp) (= exp num)))
(define (non-number? x) (not (number? x)))
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(non-number? '(+ x 3))

