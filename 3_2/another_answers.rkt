;http://community.schemewiki.org/?sicp-ex-3.2
#lang sicp

(define (xtwice x)
  (+ x x))

(define make-monitored 
   (let ((count 0)) 
         (lambda (f) 
           (lambda (arg) 
                 (cond ((eq? arg 'how-many-calls?) count) 
                           ((eq? arg 'reset-count) 
                            (set! count 0) 
                            count) 
                           (else (set! count (+ count 1)) 
                                         (f arg)))))))

(define s (make-monitored xtwice))
(s 10)
(s 20)
(s 'how-many-calls?)
(s 'reset-count)
(s 5)
(s 'how-many-calls?)