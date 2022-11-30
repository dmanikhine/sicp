#lang sicp
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define test3 '(a b c))
(count-pairs test3)

(define p1 (cons 'a 'b))
(define test4 (cons p1 (cons p1 'c)))
(count-pairs test4)

(define p2 (cons p1 p1))
(define test7 (cons p2 p2))
(count-pairs test7)

    
                     