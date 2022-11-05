#lang sicp
(#%require "../tools/functions.rkt")
(#%require "functions_2_59.rkt")

(define (f-intersection-set set1 set2)
  (filter (lambda (x) (element-of-set? x set2)) set1)) 
  
 (define (f-union-set set1 set2)
   (accumulate cons set2
               (filter (lambda (x) (not (element-of-set? x set2))) set1))) 

 (define (v1-union-set set1 set2) 
   (accumulate adjoin-set set2 set1)) 
