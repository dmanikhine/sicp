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
  
  
 (define (make-passworded f) 
   (lambda (password) 
     (define (correct-pass? attempt) (eq? password attempt))
     (define (test-pass? command) (eq? command 'check-pass))
     (define (dispatch attempt x) 
         (cond ((test-pass? x) (if (correct-pass? attempt)
                                   'ok
                                   'incorrect))
               ((correct-pass? attempt) (lambda (x) (f x)) )
               (else (lambda _ "incorrect")))) 
       dispatch))) 

(define (make-joint acc acc-pass joint-pass)
  (if ( eq? (acc acc-pass 'check-pass) 'ok)
      (make-passworded (lambda () (acc acc-pass))
      (display "incorrect password")))

  
 (define passworded-make-account 
   (make-passworded make-account)
   )
(define ac ((passworded-make-account 'secret-password) 50))

(define j-acc (make-joint ac 'secret-password 'super-secret))

(j-acc 'super-secret
