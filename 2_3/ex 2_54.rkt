#lang sicp
(define (equal? a b)
  (or (and (null? a)
           (null? b))
      (and (number? a)
           (number? b))
      (and (symbol? a)
           (symbol? b)
           (eq? a b))
      (and (pair? a)
           (pair? b)
           (equal? (car a) (car b))
           (equal? (cdr a) (cdr b)))))

(define list_a '(masha ela kashu))
(define list_b '(i sosala sushku))

(define list_c '(1 2 3 4 5))
(define list_d '(1 2 3 4 5))

(equal? list_a list_b)
(equal? list_c list_d)

           
      
           
           