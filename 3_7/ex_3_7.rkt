#lang sicp

(define (make-account balance) 
   (define (withdraw amount) 
     (if (>= balance amount) 
         (begin (set! balance (- balance amount)) 
                balance) 
         "Insufficient funds")) 
   (define (deposit amount) 
     (set! balance (+ balance amount)) 
     balance) 
   (define (dispatch m) 
     (cond  ((eq? m 'withdraw) withdraw) 
            ((eq? m 'deposit) deposit)            
            (else (error "Unknown request -- MAKE-ACCOUNT" 
                         m)))) 
   dispatch) 


(define (make-passworded f f-password)
  (lambda (password . z)
    (cond
      ((null? z) (eq? password f-password))
      ((eq? password f-password) (f (car z)))
      (else (lambda _ "incorrect-password")))))

(define (make-passworded-acc balance password)
  (make-passworded (make-account balance) password))

(define acc-denis ( make-passworded-acc 1000 'denis-secret))

((acc-denis 'denis-secret 'withdraw) 20)
((acc-denis 'denis-secret 'withdraw) 20)

(define (make-joint main-acc main-password joint-password)
  (if (main-acc main-password) 
      (make-passworded (lambda (x) (main-acc main-password x)) joint-password)
      (display "incorrect password for main account ")))

(define acc-aisha (make-joint acc-denis 'denis-secret 'aisha-secret))

((acc-aisha 'aisha-secret 'deposit) 500)

(define acc-victoria (make-joint acc-aisha 'aisha-secret 'victoria-secret))

((acc-victoria 'victoria-secret 'deposit) 400)

(define acc-oxana (make-joint acc-denis 'oxana-secret 'oxana-secret))
