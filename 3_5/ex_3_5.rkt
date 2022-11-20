#lang sicp

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1)
                 trials-passed))))
  (iter trials 0))

(define (inside? x y)
  (let ((sum1 (* (- x 5) (- x 5)))
        (sum2 (* (- y 7) (- y 7))))
  (<= (+ sum1 sum2) (* 3 3))))
      


(define (estimate-integral pred? x1 x2 y1 y2 trials)
  (define (experiment)
     (let ((x (random-in-range x1 x2))
           (y (random-in-range y1 y2)))
       (pred? x y)))
  (* ( * (- x2 x1) (- y2 y1))
     (monte-carlo trials experiment)))

(/ (exact->inexact (estimate-integral inside? 2.0 8.0 4.0 10.0 1000000)) 9)
