#lang sicp

(#%provide variable? same-variable? =number? remove-parenthesis take-while)

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num) (and (number? exp) (= exp num)))

(define (remove-parenthesis e)
  (if (null? (cdr e))
      (car e)
      e))

(define (take-while predicat set)
  (define (iter result predicat set)
    (cond ((null? set) result)
          ((predicat (car set)) (iter (append result (list (car set))) predicat (cdr set) ))
          (else result)))
  (iter '() predicat set))