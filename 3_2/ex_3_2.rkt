#lang sicp
(define (xtwice x)
  (+ x x))


(define (make-monitored func)
  (let ((call-count 0))
    (lambda (x)
          (if (number? x)
              (begin (set! call-count (+ call-count 1))
                     (func x))
              (cond ((eq? x 'how-many-calls?) call-count)
                    ((eq? x 'reset-count) (set! call-count 0) call-count)
                    (else "unknown command"))))))
           
                
                
                 
                 


(define s (make-monitored xtwice))
(s 10)
(s 20)
(s 'how-many-calls?)
(s 'reset-count)
(s 5)
(s 'how-many-calls)