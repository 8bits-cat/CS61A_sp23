(define (substitute s old new) 
    (cond ((null? s) nil)
          ((pair? (car s)) (cons (substitute (car s) old new) (substitute (cdr s) old new)))
          ((equal? (car s) old) (cons new (substitute (cdr s) old new)))
          (else (cons (car s) (substitute (cdr s) old new)))))

; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s)
      nil
      (cons (fn (car s)) (map fn (cdr s)))))

(define (filter fn s)
  (cond 
    ((null? s)    nil)
    ((fn (car s)) (cons (car s) (filter fn (cdr s))))
    (else         (filter fn (cdr s)))))

(define (count x s) 
    (if (null? s)
        0
        (length (filter (lambda (y) (eq? x y)) s))))

(define (unique s) 
    (define (not_equal_to_x x) (lambda (y) (not (eq? x y))))
    (if (null? s)
        nil
        (cons (car s) (unique (filter (not_equal_to_x (car s)) (cdr s))))))

(define (tally names) 
    (let 
        ((name_l (unique names)))
        (map (lambda (y) (cons y (cons (count y names) nil))) name_l)))
