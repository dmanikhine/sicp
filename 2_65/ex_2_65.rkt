#lang sicp
(#%require "functions_2_65.rkt" "../2_62/functions_2_62.rkt")
(define (intersection-set-tree tree1 tree2)
  (list->tree (intersection-set (tree->list tree1) (tree->list tree2))))

(define (union-set-tree tree1 tree2)
  (list->tree (union-set (tree->list tree1) (tree->list tree2))))

  