#lang sicp
;http://community.schemewiki.org/?sicp-ex-3.2

(define (xtwice x)
  (+ x x))

(define (make-monitored proc) 
   (let ((count 0)) 
     (lambda (first . rest) 
       (cond ((eq? first 'how-many-calls?) count) 
             ((eq? first 'reset-count) (set! count 0)) 
             (else (begin (set! count (+ count 1))  
                          (apply proc (cons first rest)))))))) 

(define s (make-monitored xtwice))
(s 10)
(s 20)
(s 'how-many-calls?)
(s 'reset-count)
(s 5)
(s 'how-many-calls?)