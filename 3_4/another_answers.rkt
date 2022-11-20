#lang sicp

(define (make-accumulator acc) 
  (lambda (x)  
    (set! acc (+ acc x)) 
    acc))

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




  
(define (make-monitored f) 
  (define calls (make-accumulator 0))
  (define (mf a) 
    (cond ((equal? a 'how-many-calls?) (calls 0)) 
          ((equal? a 'reset-count) (set! calls (make-accumulator 0)) (calls 0)) 
          (else (calls 1) (f a)))) 
  mf)


(define (make-passworded f) 
   (define (failed-entry x) "incorrect password") 
   (define (call-the-cops x) "weeeoooo weeeeoooo weeeeeoooo")   
   (define (constructor initial password) 
     (define try-pass? (make-monitored (lambda (attempt) (eq? password attempt)))) 
     (define (reset-login-attempts) 
       (try-pass? 'reset-count)) 
     (define (failed-attempts) 
       (try-pass? 'how-many-calls?)) 
  
     (let ((passworded-f (f initial))) 
       (define (dispatch attempt x) 
         (if (try-pass? attempt) 
             (begin (reset-login-attempts) 
                    (passworded-f x)) 
             (if (< 6 (failed-attempts)) 
                 call-the-cops 
                 failed-entry))) 
       dispatch)) 
   constructor) 
  
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