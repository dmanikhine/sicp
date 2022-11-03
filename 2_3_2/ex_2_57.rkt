#lang sicp
(#%require "../tools/functions.rkt" "../tools/functions_2_3_2.rkt" "sum.rkt" "product.rkt" "exponent.rkt")


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

(define test '(+ x 3 y 5 7))

(deriv '(* x (+ x 3)) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(** y 5) 'x)