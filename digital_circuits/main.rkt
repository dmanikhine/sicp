#lang sicp
(#%require "agenda.rkt")
(#%require "wire.rkt")
(#%require "components.rkt")



(define (after-delay delay action)
  (add-to-agenda! (+ delay (current-time the-agenda))
                  action
                  the-agenda))

(define (probe name wire)
  (add-action! wire
               (lambda ()
                 (newline)
                 (display name) (display "")
                 (display (current-time the-agenda))
                 (display " New-value = ")
                 (display (get-signal wire)))))

(define (propogate)
  (if (empty-agenda? the-agenda)
      (display 'done)
      (let ((first-item (first-agenda-item the-agenda)))
        (first-item)
        (remove-first-agenda-item! the-agenda)
        (propogate))))

(define input-1 (make-wire))
(define input-2 (make-wire))
(define sum (make-wire))
(define carry (make-wire))

(probe 'sum sum)
(probe 'carry carry)

(half-adder input-1 input-2 sum carry)

(set-signal! input-1 1)

(propogate)








