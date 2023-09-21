(define (ascending? asc-lst) (
    cond ((null? asc-lst) #t)
         ((null? (cdr asc-lst)) #t)
         ((< (car (cdr asc-lst)) (car asc-lst)) #f)
         (else (ascending? (cdr asc-lst)))))

(define (my-filter pred s) (
    cond ((null? s) nil)
         ((pred (car s)) (cons (car s) (my-filter pred (cdr s))))
         (else (my-filter pred (cdr s)))))

(define (interleave lst1 lst2) (
    cond ((null? lst1) lst2)
         ((null? lst2) lst1)
         (else (cons (car lst1)
                     (cons (car lst2)
                           (interleave (cdr lst1) (cdr lst2)))))))

(define (no-repeats lst) 
    (define (not-equal-to-x x)
        (lambda (y) (not (= x y))))
    (if (null? lst)
        lst
        (cons (car lst)
              (no-repeats (my-filter (not-equal-to-x (car lst)) (cdr lst)))))
)
