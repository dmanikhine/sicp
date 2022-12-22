#lang sicp
(#%provide stream-car stream-cdr stream-ref stream-enumerate-interval display-stream display-line )

(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))

(define (stream-for-each proc s)
  (if (stream-null? s)
      (begin (newline) 'done)
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))


(define (display-line x) (newline) (display x) (newline))

(define (display-stream s)
  (stream-for-each display-line s))

;(define s10-20 (stream-enumerate-interval 10 20))

;(display-stream s10-20)
