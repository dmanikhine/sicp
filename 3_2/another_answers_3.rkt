#lang sicp
;http://community.schemewiki.org/?sicp-ex-3.2

(define (xtwice x)
  (+ x x))


(define (make-accumulator acc) 
  (lambda (x)  
    (set! acc (+ acc x)) 
    acc))   
  
(define (make-monitored f) 
  (define calls (make-accumulator 0))
  (define (mf a) 
    (cond ((equal? a 'how-many-calls?) (calls 0)) 
          ((equal? a 'reset-count) (set! calls (make-accumulator 0)) (calls 0)) 
          (else (calls 1) (f a)))) 
  mf)

(define s (make-monitored xtwice))
(s 10)
(s 20)
(s 'how-many-calls?)
(s 'reset-count)
(s 5)
(s 'how-many-calls?)