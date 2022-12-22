#lang sicp
(#%require "stream.rkt")

(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))

;(define (partial-sums s)
;  (define iter-s
;    (cons-stream (stream-car s)
;               (add-streams iter-s (stream-cdr s))))
;  iter-s)

(define (partial-sums-v1 s)
    (cons-stream (stream-car s)
               (add-streams (partial-sums-v1 s) (stream-cdr s))))






(define stream-test (partial-sums-v1 integers))

(stream-ref stream-test 0)
(stream-ref stream-test 1)
(stream-ref stream-test 2)
(stream-ref stream-test 3)
(stream-ref stream-test 4)

