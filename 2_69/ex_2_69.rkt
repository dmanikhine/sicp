#lang sicp
(#%require "functions_2_69.rkt" "sample_2_69.rkt")
(define (generate-huffman-tree pairs)
(successive-merge (make-leaf-set pairs)))

(define (successive-merge tree)
  (if (null? (cdr tree))
      (car tree)
      (successive-merge (adjoin-set (make-code-tree (car tree)
                                                     (cadr tree))
                                     (cddr tree)))))

(generate-huffman-tree sample-set)
sample-tree
