#lang sicp
(#%require "stream.rkt")


(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))

(define s1-10 (stream-enumerate-interval 1 10))
(define s11-20 (stream-enumerate-interval 11 20))

;(add-streams s1-10 s11-20)
;(mul-streams s1-10 s11-20)

(define factorials
  (cons-stream 1 (mul-streams factorials (stream-cdr integers))))

(stream-ref factorials 1)
(stream-ref factorials 2)
(stream-ref factorials 3)
