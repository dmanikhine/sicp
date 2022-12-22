#lang sicp
(#%provide stream-map)
(#%require "stream.rkt")

(define (stream-map proc . argstreams)
  (if (null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

(define s10 (stream-enumerate-interval 1 10))

(define (sum-x . args)
  (define (iter args)
    (cond((null? (cdr args)) (car args))
         (else  (+ (car args) (iter (cdr args))))))
  (iter args))

(define sm (stream-map sum-x s10 s10 s10 s10))


;(display-stream sm)