#lang racket

;
; Chapter 9 of The Little Schemer:
; ...and Again, and Again, and Again, ...
;
; Code examples assemled by Qi Tianyun <qitianyuan@gmail.com>.
;



(define pick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (car lat))
      (else
       (pick (sub1 n) (cdr lat))))))

(define keep-looking
  (lambda (a sorn lat)
    (cond
      ((number? sorn)
       (keep-looking a (pick sorn lat) lat))
      (else (eq? sorn a )))))

(define looking
  (lambda (a lat)
    (keep-looking a (pick 1 lat) lat)))

(display "tests of looking \n")
(looking 'caviar '(6 2 4 caviar 5 7 3))         ; #t
(looking 'caviar '(6 2 grits caviar 5 7 3))     ; #f

(define eternity
  (lambda (x)
    (eternity x)))

(define first
  (lambda (p)
    (car p)))

(define second
  (lambda (p)
    (car (cdr p))))

(define build
  (lambda (s1 s2)
    (cons s1 (cons s2 '()))))

(define shift
  (lambda (pair)
    (build (first (first pair))
           (build (second (first pair))
                  (second pair)))))

(display "tests of shift \n")
(shift '((a b) c))
(shift '((a b) (c d)))

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define a-pair?
  (lambda (x)
    (cond
      ((atom? x) #f)
      ((null? x) #f)
      ((null? (cdr x)) #f)
      ((null? (cdr (cdr x))) #t)
      (else #f))))

(define align
  (lambda (pora)
    (cond
      [(atom? pora) pora]
      [(a-pair? (first pora))
       (align (shift pora))]
      [else
       (build (first pora)
              (align (second pora)))])))

(define length*
  (lambda (x)
    (cond
      [(null? x) 0]
      [(atom? x) 1]
      [else (+ (length* (car x)) (length* (cdr x)))])))
                       
(display "tests of length* \n")
(length* '())                              ; 0
(length* '(a b c))                         ; 3
(length* '((a b) (c d)))                   ; 4

(define weight*
  (lambda (pora)
    (cond
      [(atom? pora) 1]
      [else
       (+ (* (weight* (first pora)) 2)
          (weight* (second pora)))])))
      
(display "tests of weight* \n")
(weight* '((a b) c))                   ; 7
(weight* '(a (b c)))                   ; 5

(define revpair
  (lambda (p)
    (build (second p) (first p))))  


(define shuffle
  (lambda (pora)
    (cond
      ((atom? pora) pora)
      ((a-pair? (first pora))
       (shuffle (revpair pora)))
      (else
       (build (first pora)
              (shuffle (second pora)))))))
(display "tests of shuffle \n")
(shuffle '(a b))

; press "Ctrl + K" to stop if you're using DrRacket.
; (shuffle '((a b) (c d)))

; It's the halting problem !

(define one?
  (lambda (x) (= x 1)))

; https://book.douban.com/subject/26873703/
(define C
  (lambda (n)
    (cond
      [(one? n)1]
      [else
       (cond
         [(even? n) (C (/ n 2))]
         [else (C (add1 (* 3 4)))])])))

(define A
  (lambda (n m)
    (cond
      [(zero? n) (add1 m)]
      [(zero? m) (A (sub1 n) 1)]
      [else (A (sub1 n) ( A n (sub1 m)))])))

(display "tsets of function A \n")
(A 1 0)                                     ; 2
(A 1 1)                                     ; 3
(A 2 2)                                     ; 7
; press "Ctrl + K" to stop if you're using DrRacket.
; (A 4 3)

;             _              _             
;            | |_ _   _ _ __(_)_ __   __ _ 
;            | __| | | | '__| | '_ \ / _` |
;            | |_| |_| | |  | | | | | (_| |
;             \__|\__,_|_|  |_|_| |_|\__, |
;                                    |___/ 

(lambda (l)
  (cond
    [(null? l) 0]
    [else (add1 (eternity(cdr l)))]))

(lambda (l)
  (cond
    [(null? l) 0]
    [else (add1 ((lambda (l)
                   (cond ((null? l) 0)
                         (else (add1 eternity(cdr l))))) (cdr l)))]))

((lambda (length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else(add1(length(cdr l)))))))eternity)

(lambda (l)
  (cond
    ((null? l) 0)
    (else
      (add1 (eternity (cdr l))))))

; length<=1
;
(lambda (l)
  (cond
    ((null? l) 0)
    (else
      (add1
        ((lambda(l)
           (cond
             ((null? l) 0)
             (else
               (add1 (eternity (cdr l))))))
         (cdr l))))))

; All these programs contain a function that looks like length.
; Perhaps we should abstract out this function.

; rewrite length0
;
((lambda (length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (add1 (length (cdr l)))))))
 eternity)

; rewrite length<=1
;
((lambda (f)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (add1 (f (cdr l)))))))
 ((lambda (g)
    (lambda (l)
      (cond
        ((null? l) 0)
        (else (add1 (g (cdr l)))))))
  eternity))

; make length
;
(lambda (mk-length)
  (mk-length eternity))

((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else
         (add1
           ((mk-length eternity) (cdr l))))))))

(((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else
         (add1
           ((mk-length mk-length) (cdr l))))))))
 '(1 2 3 4 5))

(define Y
  (lambda (le)
    ((lambda (f) (f f))
     (lambda (f)
       (le (lambda (x) ((f f) x)))))))
