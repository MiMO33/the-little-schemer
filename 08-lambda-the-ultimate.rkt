#lang racket

;
; Chapter 8 of The Little Schemer:
; Lambda the Ultimate
;
; Code examples assemled by Qi Tianyuan<qitianyuan@foxmail.com>.
;

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define rember-f
  (lambda (test? a l)
    (cond
      [(null? l) '()]
      [(test? a (car l)) (rember-f test? a (cdr l))]
      [else (cons (car l) (rember-f test? a (cdr l)))])))

; Examples of rember-f
;
(display "tests of rember-f \n")
(rember-f eq? 2 '(1 2 3 4 5))
; ==> '(1 3 4 5)

(define eq?-c
  (lambda (a)
    (lambda (x)
      (eq? x a))))

; Example of eq?-c
;
(display "tests of eq?-c \n")
((eq?-c 'tuna) 'tuna)       ; #t
((eq?-c 'tuna) 'salad)      ; #f

(define eq?-salad
  (eq?-c 'salad))

(display "(eq?-salad 'salad) \n")
(eq?-salad 'salad)
(eq?-salad 'tuna)

(define rember-f-curry
  (lambda (test?)
    (lambda (a l)
      (cond
        [(null? l) '()]
        [(test? a (car l)) ((rember-f-curry test?) a (cdr l))]
        [else (cons (car l) ((rember-f-curry test?) a (cdr l)))]))))

; Test of rember-f
;
(display "tests of rember-f-curry \n")
((rember-f-curry eq?) 2 '(1 2 3 4 5))
; ==> '(1 3 4 5)

(define insertL-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        [(null? l) '()]
        [(test? (car l) old) (cons new ((insertL-f test?) new old (cdr l)))]
        [else (cons (car l) ((insertL-f test?) new old (cdr l)))]))))

; Test insertR-f
(display "tests of insertL-f \n")
((insertL-f eq?)
  'd
  'e
  '(a b c e f g d h))                  ; '(a b c d e f g d h)

(define insertR-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        [(null? l) '()]
        [(test? (car l) old) (cons old (cons new (cdr l)))]
        [else (cons (car l) ((insertR-f test?) new old (cdr l)))]))))

; Test insertR-f
(display "tests of insertR-f \n")
((insertR-f eq?)
  'e
  'd
  '(a b c d f g d h))                  ; '(a b c d e f g d h)

; different with origin
(define seqL
  (lambda (new old l)
    (cons new l)))

(define seqR
  (lambda (new old l)
    (cons old (cons new (cdr l)))))

(define insert-g
  (lambda (seq)
    (lambda (new old l)
      (cond
        [(null? l) '()]
        [(eq? (car l) old) (seq new old l)]
        [else (cons (car l) ((insert-g seq) new old (cdr l)))]))))

; insertL is now just (insert-g seqL)
;
(define insertL (insert-g seqL))

; insertR is now just (insert-g seqR)
;
(define insertR (insert-g seqR))

; Test insertL
;
(display "tests of insert-g \n")
(insertL
  'd
  'e
  '(a b c e f g d h))                  ; '(a b c d e f g d h)

; Test insertR
(insertR
  'e
  'd
  '(a b c d f g d h))                  ; '(a b c d e f g d h)

; (define insertL
;  (insert-g
;   (lambda (new old l)
;     ( cons new ( cons old l))))) 

(define seqS
  (lambda (new old l)
    (cons new (cdr l))))

(define subst (insert-g seqS))

; Test subst
;
(display "tests of subst \n")
(subst
  'topping
  'fudge
  '(ice cream with fudge for dessert)) ; '(ice cream with topping for dessert)

(define yyy
  (lambda (a l)
    ((insert-g seqrem) #f a l)))

(define seqrem
  (lambda (new old l) (cdr l)))

(yyy
  'sausage
  '(pizza with sausage and bacon))      ; '(pizza with and bacon)

(define atom-to-function
  (lambda(x)
    (cond
      [(eq? x '+) +]
      [(eq? x '*) *]
      [else expt])))

(define operator
  (lambda (aexp)
    (car aexp)))

(atom-to-function (operator '(+ 5 3)))     ; + (function plus)

; The value function rewritten to use abstraction
;
(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      (else
        ((atom-to-function (operator nexp))
         (value (1st-sub-exp nexp))
         (value (2nd-sub-exp nexp)))))))

; value uses 1st-sub-exp
;
(define 1st-sub-exp
  (lambda (aexp)
    (car (cdr aexp))))

; value uses 2nd-sub-exp
(define 2nd-sub-exp
  (lambda (aexp)
    (car (cdr (cdr aexp)))))

; Test value
;
(value 13)                                   ; 13
(value '(o+ 1 3))                            ; 4
(value '(o+ 1 (o^ 3 4)))                     ; 82

(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      (cond
        [(null? lat) '()]
        [(test? a (car lat)) ((multirember-f test?) a (cdr lat))]
        [else (cons (car lat) ((multirember-f test?) a (cdr lat)))]))))

; Test multirember-f
;
(display "test of multirember-f \n")
((multirember-f eq?) 'tuna '(shrimp salad tuna salad and tuna))
; ==> '(shrimp salad salad and)

(define multirember-eq? (multirember-f eq?))

(define multiremberT
  (lambda (test? lat)
    (cond
      [(null? lat) '()]
      [(test? (car lat)) (multiremberT test? (cdr lat))]
      [else (cons (car lat) (multiremberT test? (cdr lat)))])))

(define eq?-tuna
  (eq?-c 'tuna))

; Example of multiremberT
;
(display "tests of multiremberT \n")
(multiremberT
  eq?-tuna
  '(shrimp salad tuna salad and tuna))
; ==> '(shrimp salad salad and)

(define multiremember&co
  (lambda (a lat col)
    (cond
      ((null? lat)
       (col '() '()))
      ((eq? (car lat) a)
       (multiremember&co a (cdr lat)
       (lambda (newlat seen)
         (col newlat (cons (car lat) seen)))))
      (else
        (multiremember&co a (cdr lat)
                          (lambda (newlat seen)
                            (col (cons (car lat) newlat) seen)))))))

(define even?
  (lambda (n)
    (= (* ( / 2) 2) n)))


(define evens-only*&co
  (lambda (l col)
    (cond
      ((null? l)
       (col '() 1 0))
      ((atom? (car l))
       (cond
         ((even? (car l))
          (evens-only*&co (cdr l)
                          (lambda (newl p s)
                            (col (cons (car l) newl) (* (car l) p) s))))
         (else
           (evens-only*&co (cdr l)
                           (lambda (newl p s)
                             (col newl p (+ (car l) s)))))))
      (else
        (evens-only*&co (car l)
                        (lambda (al ap as)
                          (evens-only*&co (cdr l)
                                          (lambda (dl dp ds)
                                            (col (cons al dl)
                                                 (* ap dp)
                                                 (+ as ds))))))))))






















