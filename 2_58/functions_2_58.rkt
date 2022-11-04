#lang sicp

(#%provide variable? same-variable? =number?)

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num) (and (number? exp) (= exp num)))