#lang sicp
(#%require "stream.rkt")

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))


(define (sqrt-stream x)
  (define guesses
    (cons-stream
     1.0
     (stream-map (lambda (guess) (sqrt-improve guess x))
                 guesses)))
  guesses)

;(display-stream (sqrt-stream 2))



(define (stream-limit s tolerance)
  (if (< (abs(- (stream-car s)
                 (stream-car (stream-cdr s))))
         tolerance)
      (stream-car (stream-cdr s))
      (stream-limit (stream-cdr s) tolerance)
      ))
                  

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(sqrt 4 0.001)
