#lang sicp

(define (make-account balance user-password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  
  (define (dispatch password m)
    (cond
      ((not (eq? password user-password))
       (lambda _ "Incorrect-password"))
      ((eq? m 'withdraw) withdraw)
      ((eq? m 'deposit) deposit)
      (else (error "Unknown request: MAKE-ACCOUNT"
                       m))))
  dispatch)

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)