#lang sicp
(#%require "../tools/functions.rkt")

;(define (non-number? x) (not (number? x)))
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (product? x) (and (pair? x) (eq? (car x) '*)))
  

(define (=number? exp num) (and (number? exp) (= exp num)))

(define (accumulate op initial sequence)
(if (null? sequence)
initial
(op (car sequence)
(accumulate op initial (cdr sequence)))))


(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (make-sum . seq)
  (let ((vars (filter non-number? seq)) 
        (const (accumulate + 0 (filter number? seq)))) 
    (cond ((null? vars) const) 
          ((= 0 const) (make-sum-list vars)) 
          (else (make-sum-list (cons const vars))))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
         
  
(define (addend s) (cadr s))
(define (augend s)
  (make-sum-list (cddr s)))

(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))


(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (exponent exp)
          (make-product
           (make-exponentiation (base exp)
                                (- (exponent exp) 1))
           (deriv (base exp) var))))
        (else
         (error "unknown expression type: DERIV" exp))))

(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))
(define (base e) (cadr e))
(define (exponent e) (caddr e))
(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        (else (list '** base exponent))))


(define (make-sum-list seq)
  (if (null? (cdr seq))
      (car seq)
      (cons '+ seq)))

(define test '(+ x 3 y 5 7))

;(make-sum 'x 'y 3 6 7)
;(non-number? '(+ x 3))

;(deriv '(* x (+ x 3)) 'x)
;(deriv '(* x y) 'x)
;(deriv '(* (* x y) (+ x 3)) 'x)
;(deriv '(** y 5) 'x)

(testtest test)




