#lang racket

;
; Chapter 3 of The Little Schemer:
; Cons the Magnificent
;
; Code examples assemled by Qi Tianyuan <foxmail.com>.
;

; The rember function removes the first occurance of the given atom from the
; given list.
;

(define rember
  (lambda (a lat)
    (cond
      [(null? lat) '()]
      [(eq? a (car lat)) (cons '() (rember a (cdr lat)))]
      [else (cons (car lat) (rember a (cdr lat)))]))) 

; Examples of rember function
;
(display "tests of rember \n")
(rember 'mint '(lamb chops and mint flavored mint jelly)) ; '(lamb chops and flavored mint jelly)
(rember 'toast '(bacon lettuce and tomato))               ; '(bacon lettuce and tomato)
(rember 'cup '(coffee cup tea cup and hick cup))          ; '(coffee tea cup and hick cup)

; import atom?
;
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define firsts
  (lambda (l)
    (cond
      [(null? l) '()]
      [else (cons (car (car l)) (firsts (cdr l)))])))

; Examples of firsts
;
(display "tsets of firsts \n")
(firsts '((apple peach pumpkin)
          (plum pear cherry)
          (grape raisin pea)
          (bean carrot eggplant)))                     ; '(apple plum grape bean)

(firsts '((a b) (c d) (e f)))                          ; '(a c e)
(firsts '((five plums) (four) (eleven green oranges))) ; '(five four eleven)
(firsts '(((five plums) four)
          (eleven green oranges)
          ((no) more)))                                ; '((five plums) eleven (no))

(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)
       (cons old (cons new (cdr lat))))
      (else
        (cons (car lat) (insertR new old (cdr lat)))))))

; Examples of insertR
;
(insertR
  'topping 'fudge
  '(ice cream with fudge for dessert)) ; '(ice cream with fudge topping for dessert)

(insertR
  'jalapeno
  'and
  '(tacos tamales and salsa))          ; '(tacos tamales and jalapeno salsa)

(insertR
  'e
  'd
  '(a b c d f g d h))                  ; '(a b c d e f g d h)

; The insertL function inserts the element new to the left of the first
; occurrence of element old in the list lat
;
(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)
       (cons new (cons old (cdr lat))))
      (else
        (cons (car lat) (insertL new old (cdr lat)))))))

; Example of insertL
;
(insertL
  'd
  'e
  '(a b c e g d h))                    ; '(a b c d e g d h)

(define subst
  (lambda (new old lat)
    (cond
      [(null? lat) '()]
      [(eq? old (car lat)) (cons new (subst new old(cdr lat)))]
      [else (cons (car lat) (subst new old (cdr lat)))])))

; Example of subst
;
(display "tests of subst \n")
(subst
  'topping
  'fudge
  '(ice cream with fudge for dessert)) ; '(ice cream with topping for dessert)

(define subst2
  (lambda (new o1 o2 lat)
    (cond
      ((null? lat) '())
      ((or (eq? (car lat) o1) (eq? (car lat) o2))
       (cons new (cdr lat)))
      (else
        (cons (car lat) (subst new o1 o2 (cdr lat)))))))

; Example of subst2
;
(display "tests of subst2 \n")
(subst2
  'vanilla
  'chocolate
  'banana
  '(banana ice cream with chocolate topping))  ; '(vanilla ice cream with chocolate topping)

(define multirember
  (lambda (a lat)
    (cond
      [(null? lat) '()]
      [(eq? (car lat) a) (multirember a (cdr lat))]
      [else
        (cons (car lat) (multirember a (cdr lat)))])))

; Example of multirember
;
(multirember
  'cup
  '(coffee cup tea cup and hick cup))    ; '(coffee tea and hick)

(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)
       (cons old (cons new (multiinsertR new old (cdr lat)))))
      (else
        (cons (car lat) (multiinsertR new old (cdr lat)))))))

; Example of multiinsertR
;
(display "tests of multiinsertR \n")
(multiinsertR
  'x
  'a
  '(a b c d e a a b))  ; (a x b c d e a x a x b)

(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)
       (cons new (cons old (multiinsertL new old (cdr lat)))))
      (else
        (cons (car lat) (multiinsertL new old (cdr lat)))))))

; Example of multiinsertL
;
(display "tests of multiinsertL \n")
(multiinsertL
  'x
  'a
  '(a b c d e a a b))  ; (x a b c d e x a x a b)

(define multisubst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)
       (cons new (multisubst new old (cdr lat))))
      (else
        (cons (car lat) (multisubst new old (cdr lat)))))))

; Example of multisubst
;
(display "tests of multisubst\n")
(multisubst
  'x
  'a
  '(a b c d e a a b))  ; (x b c d e x x b)


      










  
