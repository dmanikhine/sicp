#lang sicp
(#%require "../tools/functions.rkt" "functions_2_57.rkt")
(#%provide sum?)
(#%provide addend)
(#%provide augend)
(#%provide make-sum)



(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s)  (make-sum-list (cddr s)))

(define (make-sum-list seq)
  (if (null? (cdr seq))
      (car seq)
      (cons '+ seq)))

(define (make-sum . seq)
  (let ((vars (filter non-number? seq)) 
        (const (accumulate + 0 (filter number? seq)))) 
    (cond ((null? vars) const) 
          ((= 0 const) (make-sum-list vars)) 
          (else (make-sum-list (cons const vars))))))

