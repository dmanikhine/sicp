#lang sicp

(define (make-account balance password) 
    (define (auth-layer pw . m) 
     (cond ((null? m) (eq? pw password)) 
           ((eq? pw password) (+ (car m) balance)) 
           (else (display "else")))) 
   auth-layer)

(define acc (make-account 20 'secret))

(acc 'secret)
(acc 'falsh-secret)

(acc 'secret 120)