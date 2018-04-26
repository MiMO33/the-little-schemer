#lang racket

;
;Chapter 2 of The Little Schemer:
; Do It, Do It Again, and Again, and Again ...
;
; Code examples assemled by Qi Tianyuan <qitianyuan@foxmail.com>.
;

;import atom?
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define lat?
  (lambda (l)
    (cond
      [(null? l) #t]
      [(atom? (car l)) (lat? (cdr l))]
      [else #f])))

(display "tests of <lat?> \n")
; Examples of lats:
;
(lat? '(Jack Sprat could eat no chicken fat))
(lat? '())
(lat? '(bacon and eggs))

; Examples of not-lats:
;
(lat? '((Jack) Sprat could eat no chicken fat)) ; not-lat because (car l) is a list
(lat? '(Jack (Sprat could) eat no chicken fat)) ; not-lat because l contains a list
(lat? '(bacon (and eggs)))                      ; not-lat because '(and eggs) is a list

; Examples of or:
;
(display "tests of <or> \n")
(or (null? '()) (atom? '(d e f g)))             ; #t
(or (null? '(a b c)) (null? '()))               ; #t
(or (null? '(a b c)) (null? '(atom)))           ; #f

(define member?
  (lambda (a lat)
    (cond
      [(null? lat) #f]
      [else (or (eq? a (car lat))
                (member? a (cdr lat)))])))

(display "tests of member? \n")
; Examples of member? succeeding
;
(member? 'meat '(mashed potatoes and meat gravy))
(member? 'meat '(potatoes and meat gravy))
(member? 'meat '(and meat gravy))
(member? 'meat '(meat gravy))

; Examples of member? failing
(member? 'liver '(bagels and lox))