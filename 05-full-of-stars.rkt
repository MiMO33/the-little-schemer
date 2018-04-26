#lang racket
;
; Chapter 5 of The Little Schemer
; "Oh My Gawd": It's Full Of Stars
;
; Code examples assemled by Qi Tianyuan <qitianyuan@foxmail.com>
;

; The atom? primitive
;
(define atom?
 (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

; The add1 primitive
;
(define add1
  (lambda (n) (+ n 1)))

; The rember* function removes all matching atoms from an s-expression
;
(define rember*
  (lambda (a l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
         ((eq? (car l) a)
          (rember* a (cdr l)))
         (else
           (cons (car l) (rember* a (cdr l))))))
      (else
        (cons (rember* a (car l)) (rember* a (cdr l)))))))

; Examples of rember*
;
(display rember*)(newline)
(rember*
  'cup
  '((coffee) cup ((tea) cup) (and (hick)) cup))
;==> '((coffee) ((tea)) (and (hick)))

(rember*
  'sauce
  '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce)))
;==> '(((tomato)) ((bean)) (and ((flying))))

; The insertR* function insers new to the right of all olds in l
;
(define insertR*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond ((eq? old (car l)) (cons old (cons new (insertR* new old (cdr l)))))
             (else (cons (car l) (insertR* new old (cdr l))))))
      (else (cons (insertR* new old (car l)) (insertR* new old (cdr l)))))))

; Example of insertR*
;
(display insertR*)(newline)
(insertR*
  'roast
  'chuck
  '((how much (wood)) could ((a (wood) chuck)) (((chuck)))
    (if (a) ((wood chuck))) could chuck wood))
; ==> ((how much (wood)) could ((a (wood) chuck roast)) (((chuck roast)))
;      (if (a) ((wood chuck roast))) could chuck roast wood)

; The occur* function counts the number of occurances of an atom in l
;

(define occur*
  (lambda (a l)
    (cond ((null? l) 0)
          ((atom? (car l))
           (cond ((eq? a (car l))
                  (+ 1 (occur* a (cdr l))))
                  (else (occur* a (cdr l)))))
          (else
            (+ (occur* a (car l))
               (occur* a (cdr l)))))))

; Example of occur*
;
(display occur*)(newline)
(occur*
  'banana
  '((banana)
    (split ((((banana ice)))
            (cream (banana))
            sherbet))
    (banana)
    (bread)
    (banana brandy)))
;==> 5

; The subst* function substitutes all olds for news in l
;

(define subst*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
         ((eq? old (car l)) (cons new (subst* new old (cdr l))))
         (else (cons (car l) (subst* new old (cdr l))))))
     (else (cons (subst* new old (car l)) (subst* new old (cdr l)))))))

; Example of subst*
;
(display subst*)(newline)
(subst*
  'orange
  'banana
  '((banana)
    (split ((((banana ice)))
            (cream (banana))
            sherbet))
    (banana)
    (bread)
    (banana brandy)))
;==> '((orange)
;      (split ((((orange ice)))
;              (cream (orange))
;              sherbet))
;      (orange)
;      (bread)
;      (orange brandy))

; The insertL* function insers new to the left of all olds in l
;

(define insertL*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
         ((eq? old (car l)) (cons new (cons old (insertL* new old (cdr l)))))
         (else (cons (car l) (insertL* new old (cdr l))))))
      (else
        (cons (insertL* new old (car l)) (insertL* new old (cdr l)))))))

(display insertL*)(newline)
; Example of insertL*
;
(insertL*
  'pecker
  'chuck
  '((how much (wood)) could ((a (wood) chuck)) (((chuck)))
    (if (a) ((wood chuck))) could chuck wood))
; ==> ((how much (wood)) could ((a (wood) chuck pecker)) (((chuck pecker)))
;      (if (a) ((wood chuck pecker))) could chuck pecker wood)

; The member* function determines if element is in a list l of s-exps
;

(define member*
  (lambda (a l)
    (cond
      ((null? l) #f)
      ((atom? (car l))
       (or (eq? (car l) a)
           (member* a (cdr l))))
      (else
        (or (member* a (car l))
            (member* a (cdr l)))))))

; Example of member*
;
(member*
  'chips
  '((potato) (chips ((with) fish) (chips))))    ; #t

; The leftmost function finds the leftmost atom in a non-empty list
; of S-expressions that doesn't contain the empty list
;
(define leftmost
  (lambda (l)
    (cond
      ((atom? (car l)) (car l))
      (else (leftmost (car l))))))
          

; Examples of leftmost
;
(display leftmost)(newline)
(leftmost '((potato) (chips ((with) fish) (chips))))    ; 'potato
(leftmost '(((hot) (tuna (and))) cheese))               ; 'hot

; Examples of not-applicable leftmost
;
; (leftmost '(((() four)) 17 (seventeen))) ; leftmost s-expression is empty
; (leftmost '())                           ; empty list

; The eqlist? function determines if two lists are equal
;
(define eqlist?
  (lambda (l1 l2)
    (cond
      ;case 1: l1 is empty, l2 is empty, atom, list
      ((and (null? l1) (null? l2)) #t)
      ((or (null? l1) (null? l2) #f))
      ;case 2: l1 is atom, l2 is empty, atom, list
      ((and (atom? (car l1)) (atom? (car l2)))
        (and (eq? (car l1) (car l2))
                (eqlist? (cdr l1) (cdr l2))))
      ((or (atom? (car l1)) (atom? (car l2))) #f)
      ;case 3: l1 is list, l2 is empty, atom, list
      (else
       (and (eqlist? (car l1) (car l2))
            (eqlist? (cdr l1) (cdr l2)))))))

; Example of eqlist?
;
(display eqlist?)(newline)
(eqlist?
  '(strawberry ice cream)
  '(strawberry ice cream))                  ; #t

(eqlist?
  '(strawberry ice cream)
  '(strawberry cream ice))                  ; #f

(eqlist?
  '(banan ((split)))
  '((banana) split))                        ; #f

(eqlist?
  '(beef ((sausage)) (and (soda)))
  '(beef ((salami)) (and (soda))))          ; #f

(eqlist?
  '(beef ((sausage)) (and (soda)))
  '(beef ((sausage)) (and (soda))))         ; #t















