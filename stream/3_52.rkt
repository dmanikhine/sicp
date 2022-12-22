#lang sicp
(#%require "stream.rkt")
(define sum 0)
(define (accum x) (set! sum (+ x sum)) sum)
(define seq
  (stream-map accum
              (stream-enumerate-interval 1 20)))

;1 2 3 4  5  6  7 8 9 10 11 12 13 14 15 16 17 18 19 20
;1 3 6 10 15 21 28 36 45 55 66 78 91 105 120 136 153 171 190 210

(display-line sum)

(define y (stream-filter even? seq))
(display-line sum)

(define z
  (stream-filter (lambda (x) (= (remainder x 5) 0))
                 seq))

(display-line sum)

(stream-ref y 7)

(display-line sum)

(display-stream z)

(display-line sum)