#lang sicp
(#%require "functions_2_68.rkt" "sample_68.rkt" "../tools/functions.rkt" )


(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (h-encode-symbol res symbol current-brunch)
    (cond ((leaf? current-brunch) res)
          ((element-of-set? symbol(symbols (left-branch current-brunch)))
           (h-encode-symbol (append res (list 0)) symbol (left-branch current-brunch)))
          (else (h-encode-symbol (append res (list 1)) symbol (right-branch current-brunch)))))
  (if (element-of-set? symbol (symbols tree))
       (h-encode-symbol '() symbol tree) 
       (error "uknown symbol:"  symbol)))

;(encode-symbol 'D sample-tree)
(encode '(A D A B B C A) sample-tree)