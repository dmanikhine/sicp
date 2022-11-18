#lang sicp
(define (make-accumulator acc)
  (lambda (amount)
    (set! acc (+ acc amount))
          acc))


(define A (make-accumulator 5))
(A 10)
(A 10)
