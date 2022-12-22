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

(define (partial-sums-v2 s) 
   (add-streams s (cons-stream 0 (partial-sums-v2 s)))) 


(define stream-test-v1 (partial-sums-v1 integers))

(stream-ref stream-test-v1 0)
(stream-ref stream-test-v1 1)
(stream-ref stream-test-v1 2)
(stream-ref stream-test-v1 3)
(stream-ref stream-test-v1 4)


(define stream-test-v2 (partial-sums-v2 integers))

(stream-ref stream-test-v2 0)
(stream-ref stream-test-v2 1)
(stream-ref stream-test-v2 2)
(stream-ref stream-test-v2 3)
(stream-ref stream-test-v2 4)


