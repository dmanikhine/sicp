#lang sicp
(#%require "wire.rkt")
(#%require "agenda.rkt")

(define inverter-delay 2)
(define and-gate-delay 3)
(define or-gate-delay 5)


(define (after-delay delay action)
  (add-to-agenda! (+ delay (current-time the-agenda))
                  action
                  the-agenda))


(define (inverter input output)
  (define (inverter-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda () (set-signal! output new-value)))))
  (add-action! input inverter-input) 'ok)

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal" s))))


(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) (get-signal a2))))
      (after-delay
       and-gate-delay
       (lambda()(set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)



(define (logical-and a1 a2)
  (cond ((= a1 0) 0)
        ((= a2 0) 0)
        ((and (= a1 1) (= a2 1)) 1)
        (else (error "Invalid signal" a1 a2))))