#lang sicp
(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable (cons (cons key-2 value)
                                           (cdr subtable)))))
            (set-cdr! local-table (cons (list key-1 (cons key-2 value))
                                        (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation: TABLE" m))))
    dispatch))

(define tbl (make-table))

;((tbl 'insert-proc!) 'math '+ 43)
;((tbl 'insert-proc!) 'letters 'a 97)

;((tbl 'lookup-proc) 'math '+)
;((tbl 'lookup-proc) 'letters 'a)

((tbl 'insert-proc!) 10 10 43)
((tbl 'insert-proc!) 20 20 97)

((tbl 'lookup-proc) 10 10)
((tbl 'lookup-proc) 20 20)

