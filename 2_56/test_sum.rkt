#lang sicp
(#%require "sum.rkt" "../tools/functions.rkt")

(define a1 '(1 a 3 5))


(accumulate make-sum 0 a1)