#lang sicp

 (define (rand-update x) 
   (let ((a 27) (b 26) (m 127)) 
     (modulo (+ (* a x) b) m)))

; (define x1 (rand-update 0)) 
; (define x2 (rand-update x1)) 
; (define x3 (rand-update x2)) 
; (define x4 (rand-update x3)) 
; (define x5 (rand-update x4)) 
; x1 
; x2 
; x3 
; x4 
; x5

 (define rand 
   (let ((seed 0)) 
     (define (dispatch m) 
       (cond ((eq? m 'reset) (lambda (x)(set! seed x))) 
             ((eq? m 'generate) (begin (set! seed (rand-update seed)) 
                                       seed)) 
             (else error "invalid operation"))) 
     dispatch))


(rand 'generate) 
(rand 'generate) 
(rand 'generate)

(newline) (display "reset 0") (newline)
((rand 'reset) 0)

(rand 'generate) 
(rand 'generate) 
(rand 'generate)

(newline) (display "reset 42") (newline)
((rand 'reset) 42)
((rand 'reset) 42)

(rand 'generate) 
(rand 'generate) 
(rand 'generate)

(newline) (display "reset 42") (newline)
((rand 'reset) 42)

(rand 'generate) 
(rand 'generate) 
(rand 'generate)

(newline) (display "reset 0") (newline)
((rand 'reset) 0)

(rand 'generate) 
(rand 'generate) 
(rand 'generate)
