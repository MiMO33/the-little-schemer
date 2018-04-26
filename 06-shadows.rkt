#lang racket

;
; Charpter 6 of The Little Schemer
; Shadows
; Code examples assemled by Qi Tianyuan <qitianyyuan@foxmail.com>
;

; The atom? primitive
;
(define atom?
 (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

'(+)
'(*)


; The numbered? function determines whether a representation of an arithmetic
; expression contains only numbers besides the o+, ox and o^ (for +, * and exp).
;
(define numbered?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      ((eq? (car (cdr aexp)) 'o+)
       (and (numbered? (car aexp))              
            (numbered? (car (cdr (cdr aexp))))))
      ((eq? (car (cdr aexp)) 'ox)
       (and (numbered? (car aexp))
            (numbered? (car (cdr (cdr aexp))))))
      ((eq? (car (cdr aexp)) 'o^)
       (and (numbered? (car aexp))
            (numbered? (car (cdr (cdr aexp))))))
      (else #f))))
      
; Examples of numbered?
;
(display numbered?)(newline)
(numbered? '5)                               ; #t
(numbered? '(5 o+ 5))                        ; #t
(numbered? '(5 o+ a))                        ; #f
(numbered? '(5 ox (3 o^ 2)))                 ; #t
(numbered? '(5 ox (3 'foo 2)))               ; #f
(numbered? '((5 o+ 2) ox (3 o^ 2)))          ; #t

; Assuming aexp is a numeric expression, numbered? can be simplified
;
(define numbered2?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      (else
        (and (numbered2? (car aexp)))
             (numbered2? (car (cdr (cdr aexp))))))))

; Tests of numbered?
;
(display numbered2?)(newline)
(numbered2? '5)                               ; #t
(numbered2? '(5 o+ 5))                        ; #t
(numbered2? '(5 ox (3 o^ 2)))                 ; #t
(numbered2? '((5 o+ 2) ox (3 o^ 2)))          ; #t

; !!!!!!
; The value function determines the value of an arithmetic expression
;
(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      ((eq? (car (cdr nexp)) 'o+)
       (+ (value (car nexp))
          (value (car (cdr (cdr nexp))))))
      ((eq? (car (cdr nexp)) 'o*)
       (* (value (car nexp))
          (value (car (cdr (cdr nexp))))))
      ((eq? (car (cdr nexp)) 'o^)
       (expt (value (car nexp))
             (value (car (cdr (cdr nexp))))))
      (else #f))))

; Examples of value
;
(value 13)                                   ; 13
(value '(1 o+ 3))                            ; 4
(value '(1 o+ (3 o^ 4)))                     ; 82

; Redefine helper functions for infix notation
;
(define 1st-sub-exp
  (lambda (aexp)
    (car aexp)))

(define 2nd-sub-exp
  (lambda (aexp)
    (car (cdr (cdr aexp)))))

(define operator
  (lambda (aexp)
      (car aexp)))