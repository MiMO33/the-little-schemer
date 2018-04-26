#lang racket

;
; Chapter 4 of The Little Schemer:
; Numbers Games
;
; Code examples assemled by Qi Tianyuan <qitianyuan@foxmail.com>.
;

; import atom?
;
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(atom? 14)
(define n 14) (atom? n)
(number? -3)
(number? -3.14159)

(define add1
  (lambda (n)
    (+ 1 n)))

(display "tests of add1 \n")
(add1 5)

(define sub1
  (lambda (n)
    (- 1 n)))

(zero? 0)
(zero? 1492)

(define o+
  (lambda (n m)
    (cond
      [(zero? n) m]
      [else (add1 (o+ n (sub1 m)))])))

(define o-
  (lambda (n m)
    (cond
      [(zero? m) n]
      [else (sub1 (o- n (sub1 m)))])))


(define tup?
  (lambda (l)
    (cond
      [(null? l) #t]
      [(number? (car l)) (tup? (cdr l))]
      [else #f])))

; Examples of tups
;
(display "tsets of tups? \n")
(tup? '(2 111 3 79 47 6))         ;#t
(tup? '(8 55 5 555))              ;#t
(tup? '())                        ;#t

(tup? '(1 2 8 apple 4 3))         ; not-a-tup because apple is not a number
(tup? '(3 (7 4) 13 9))            ; not-a-tup because (7 4) is a list of numbers, not a number

(define addtup
  (lambda (tup)
    (cond
      [(null? tup) 0]
      [else (+ (car tup) (addtup (cdr tup)))])))
    
; Examples of addtup
;
(display "tests of addtup \n")
(addtup '(3 5 2 8))     ; 18
(addtup '(15 6 7 12 3)) ; 43

(define tup+
  (lambda (tup1 tup2)
    (cond
      [(null? tup1) '()]
      [else (cons (+ (car tup1) (car tup2))
               (tup+ (cdr tup1) (cdr tup2)))])))

; Examples of tup+
;
(display "tests of tup+ \n")
(tup+ '(3 6 9 11 4) '(8 5 2 0 7))   ; '(11 11 11 11 11)
(tup+ '(3 7) '(4 6 8 1))            ; '(7 13 8 1)

(define length
  (lambda (l)
    (cond
      [(null? l) 0]
      [else (+ 1 (length (cdr l)))])))

; Examples of length
;
(display "tests of length \n")
(length '(hotdogs with mustard sauerkraut and pickles))  ;6   ; 6
(length '(ham and cheese on rye))                        ;5

; !!!!!!
; Example of pick
(define pick
  (lambda (n lat)
    (cond
      [(eq? n 1) (car lat)]
      [else (pick (- n 1) (cdr lat))])))

; Example of pick
;
(display "tests of pick \n")
(pick 4 '(lasagna spaghetti ravioli macaroni meatball))     ; 'macaroni  

; Example of rempick
;
(define rempick
  (lambda (n lat)
    (cond
      [(eq? n 1) (cdr lat)]
      [else (cons (car lat) (rempick (- n 1) (cdr lat)))])))

; Example of rempick
;
(display "tests of rempick \n")
(rempick 3 '(hotdogs with hot mustard))     ; '(hotdogs with mustard)

(define no-nums
  (lambda (lat)
    (cond
      [(null? lat) '()]
      [(number? (car lat)) (no-nums(cdr lat))]
      [else (cons (car lat) (no-nums (cdr lat)))])))

; Example of no-nums
;
(display "tests of no-nums \n")
(no-nums '(5 pears 6 prunes 9 dates))       ; '(pears prunes dates)
      
(define all-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat)) (cons (car lat) (all-nums (cdr lat))))
      (else
        (all-nums (cdr lat))))))

; Example of all-nums
;
(display "tests of all-nums \n")
(all-nums '(5 pears 6 prunes 9 dates))       ; '(5 6 9)
       
(define eqan?
  (lambda (a1 a2)
    (cond
      ((and (number? a1) (number? a2)) (= a1 a2))
      ((or  (number? a1) (number? a2)) #f)
      (else
        (eq? a1 a2)))))

; Examples of eqan?
;
(eqan? 3 3)     ; #t
(eqan? 3 4)     ; #f
(eqan? 'a 'a)   ; #t
(eqan? 'a 'b)   ; #f

(define occur
  (lambda (a lat)
    (cond
      [(null? lat) 0]
      [(eq? a (car lat)) (+ 1 (occur a (cdr lat)))]
      [else (occur a (cdr lat))])))

; Example of occur
;
(display "tests of occur \n")
(occur 'x '(a b x x c d x))     ; 3
(occur 'x '())                  ; 0


