#lang sicp
(#%require "functions_2_69.rkt")
(#%provide sample-tree sample-message sample-set)
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                   (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree
                     (make-leaf 'D 1)
                     (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

;(decode sample-message sample-tree)

(define sample-set '((C 1) (D 1) (B 2) (A 4)))

sample-set