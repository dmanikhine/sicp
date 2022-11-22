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
      ((and (pair? z) (eq? (car z) 'test-password))
       (if (eq? password f-password)
           true
           false))       
      ((and (eq? password f-password) (not (pair? z)))
           f)
      (else (lambda _ "incorrect-password")))))

(define acc-denis
  (make-passworded (make-account 100) 'secret))
(((acc-denis 'secret) 'withdraw) 20)

(define (make-joint acc acc-password joint-password)
  (if (acc acc-password 'test-password) 
      (begin (display "Add new user for main account") (make-passworded (acc acc-password) joint-password))
      (display "Can't add new user, incorrect password for main account!")))

(define acc-aisha
  (make-joint acc-denis 'secret 'aisha-secret))
(newline)

(((acc-aisha 'aisha-secret) 'deposit) 100)

(((acc-denis 'secret) 'deposit) 20)

(((acc-aisha 'aisha-secret) 'deposit) 100)

(define acc-oxana
  (make-joint acc-denis 'oxana 'oxana-secret))

(newline)

(define acc-victoria
  (make-joint acc-aisha 'aisha-secret 'victoria-secret))
(newline)

(((acc-victoria 'victoria-secret) 'withdraw) 200)

(((acc-denis 'secret) 'deposit) 0)
