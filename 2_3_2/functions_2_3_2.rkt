#lang sicp
(#%provide non-number?)
(#%provide =number?)
(#%provide variable?)
(#%provide same-variable?)

(define (=number? exp num) (and (number? exp) (= exp num)))
(define (non-number? x) (not (number? x)))
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)  (and (variable? v1) (variable? v2) (eq? v1 v2)))