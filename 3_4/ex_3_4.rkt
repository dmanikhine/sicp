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

(define (make-accumulator acc) 
  (lambda (x)  
    (set! acc (+ acc x)) 
    acc))   

    
 (define (make-passworded f) 
   (lambda (initial password)
     (define calls (make-accumulator 0))
     (define whatch-dog 7)
     (define (correct-pass? attempt) 
       (eq? password attempt)) 
     (let ((passworded-f (f initial))) 
       (define (dispatch attempt x) 
         (if (correct-pass? attempt) 
             (begin (set! calls (make-accumulator 0)) (passworded-f x)) 
             (begin (calls 1)
                    (if (<= whatch-dog (calls 0))
                        (lambda _ "CALL CALL CALL THE POLICE!")
                        (lambda _ "incorrect password")))
             )) 
       dispatch))) 




 (define passworded-make-account 
   (make-passworded make-account))

(define ac (passworded-make-account 50 'secret-password))

((ac 'some-other-password 'deposit) 50)
((ac 'some-other-password 'deposit) 50)
((ac 'some-other-password 'deposit) 50)
((ac 'some-other-password 'deposit) 50)
((ac 'some-other-password 'deposit) 50)
((ac 'some-other-password 'deposit) 50)
((ac 'some-other-password 'deposit) 50)
((ac 'some-other-password 'deposit) 50)
((ac 'secret-password 'deposit) 50)