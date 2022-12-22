#lang sicp
(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    
    (define (s-assoc key-x? key records)
      (cond ((null? records) false)
            ((not (key-x? records)) (s-assoc key-x? key (cdr records)))
            ((same-key? key (caar records)) (car records))
            (else (s-assoc key-x? key (cdr records)))))
    
    (define (key-table? record)
       (pair? (cdr record)))
        
    (define (key-value? record)
         (not (pair? (cdr record))))      
        

(define (rec-lookup i-table key rest-of-keys)
  (let ((subtable (s-assoc key-table? key (cdr i-table))))
    (cond ((null? rest-of-keys) (lookup i-table key))        
        (subtable (rec-lookup subtable (car rest-of-keys) (cdr rest-of-keys)))
        (else false))))
    
    (define (lookup i-table key)
      (let ((record (s-assoc key-value? key (cdr i-table))))
        (if record
            (cdr record)
            false)))           
    
    (define (rec-insert! i-table value key rest-of-keys )
      (let ((subtable (s-assoc key-table? key (cdr i-table))))
        (cond ((null? rest-of-keys) (insert! i-table key value))
            (subtable  (rec-insert! (cdr subtable)
                                    value
                                    (car rest-of-keys)
                                    (cdr rest-of-keys)))
            (else (begin (set-cdr! i-table
                                   (cons (list key)
                                         (cdr i-table)))
                       (rec-insert! (cadr i-table)
                                    value
                                    (car rest-of-keys)
                                    (cdr rest-of-keys))))))
      'ok)

    (define (insert! i-table key value)      
        (let ((record (s-assoc key-value? key (cdr i-table))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! i-table (cons (cons key value)
                                           (cdr i-table)))))            
      'ok)  
          
          
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc)
             (lambda (key . key-list) (rec-lookup local-table
                                                  key key-list ))) 
            ((eq? m 'insert-proc!)
             (lambda (value key . key-list) (rec-insert! local-table
                                                         value
                                                         key
                                                         key-list )))            
            (else (error "Unknown operation: TABLE" m))))
    dispatch))

(define (predicat? test-key tbl-key)
  (= test-key tbl-key))



(define tbl (make-table predicat?))

((tbl 'insert-proc!) 155 21)
((tbl 'lookup-proc) 21)
((tbl 'insert-proc!) 255 21 21)
((tbl 'lookup-proc) 21 21)
((tbl 'lookup-proc) 21)
((tbl 'insert-proc!) 355 21)
((tbl 'lookup-proc) 21 21)
((tbl 'insert-proc!) 355 21)
((tbl 'lookup-proc) 21)
((tbl 'lookup-proc) 22)
((tbl 'lookup-proc) 22 22)
((tbl 'insert-proc!) 455 22 22)
((tbl 'lookup-proc) 22 22)
((tbl 'insert-proc!) 555 22 22)
((tbl 'lookup-proc) 22 22)



