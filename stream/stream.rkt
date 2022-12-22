#lang sicp
(#%provide stream-car
           stream-cdr
           stream-ref
           stream-map
           stream-map-x
           stream-enumerate-interval
           stream-filter
           add-streams
           mul-streams
           scale-stream
           display-stream display-line )


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

(define (stream-map-x proc . argstreams)
  (if (null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map-x
              (cons proc (map stream-cdr argstreams))))))




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

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter
                       pred
                       (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))
(define integers (integers-starting-from 1))

(define (add-streams s1 s2) (stream-map-x + s1 s2))
(define (mul-streams s1 s2) (stream-map-x * s1 s2))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor))
              stream))


(define (display-line x) (newline) (display x) (newline))

(define (display-stream s)
  (stream-for-each display-line s))

;(define s10-20 (stream-enumerate-interval 10 20))

;(display-stream s10-20)
