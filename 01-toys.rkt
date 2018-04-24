#lang racket
;
; Chapter 1 of The Little Schemer:
; Toys
;
; Code examples assemled by Qi Tianyuan <qitianyuan@foxmail.com>.
;

;Examples of atom
;
'atom
'turkey
1942
'u
'*abc$

;Examples of list and scheme expressions
;
'(atom)
(quote (atom))
'(atom turkey or)
'((atom turkey) or)
'xyz
'(x y z)
'((x y z))
'(how are you doing so far)
'(((how) are) ((you) (doing so)) far)
'()
'(() () () ())

; Examples of function car
;
(car '(a b c))                ; 'a
(car '((a b c) x y z))        ; '(a b c)

; Examples of not-applicable car
;
; (car 'hotdog)     ; 'hotdog is not a list
; (car '())         ; '() is an empty list

(car '(((hotdogs)) (and) (pickle) relish))  ; '((hotdogs))
(car (car '(((hotdogs)) (and))))            ; '(hotdogs)

; Examples of cdr
;
(cdr '(a b c))              ; '(b c)
(cdr '((a b c) x y z))      ; '(x y z)
(cdr '(hamburger))          ; '()
(cdr '((x) t r))            ; '(t r)

; Examples of car and cdr
;
(car (cdr '((b) (x y) ((c)))))      ; '(x y)
(cdr (cdr '((b) (x y) ((c)))))      ; '(((c)))

; Examples of cons
;
(cons 'peanut '(butter and jelly))                  ; '(peanut butter and jelly)
(cons '(banana and) '(peanut butter and jelly))     ; '((banana and) peanut butter and jelly)
(cons '((help) this) '(is very ((hard) to learn)))  ; '(((help) this) is very ((hard) to learn))
(cons '(a b (c)) '())                               ; '((a b (c)))
(cons 'a '())                                       ; '(a)

; Examples of not-applicable cons
;
; (cons '((a b c)) 'b)  ; not-applicable because 'b is not a list
; (cons 'a 'b)          ; not-applicable because 'b is not a list

; Examples of cons, car and cdr
;
(cons 'a (car '((b) c d)))     ; (a b)
(cons 'a (cdr '((b) c d)))     ; (a c d)

; Example of the null-list
;
'()

; Examples of null?
;
(null? '())         ; true
(null? '(a b c))    ; false

; Define atom? 
;
(define atom?
 (lambda (x)
    (and (not (pair? x)) (not (null? x)))))  
  
; Examples of atom?
;
(atom? 'Harry)                          ; true
(atom? '(Harry had a heap of apples))   ; false

; Examples of atom?, car and cdr
;
(atom? (car '(Harry had a heap of apples)))         ; true
(atom? (cdr '(Harry had a heap of apples)))         ; false
(atom? (cdr '(Harry)))                              ; false
(atom? (car (cdr '(swing low sweet cherry oat))))   ; true
(atom? (car (cdr '(swing (low sweet) cherry oat)))) ; false

; Examples of eq?
;
(eq? 'Harry 'Harry)         ; true
(eq? 'margarine 'butter)    ; false

; Examples of eq?, car and cdr
;
(eq? (car '(Mary had a little lamb chop)) 'Mary)        ; true
(eq? (car '(beans beans)) (car (cdr '(beans beans))))   ; true