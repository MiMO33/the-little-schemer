#lang racket
;
; Chapter 7 of The Little Schemer:
; Friends and Relations
;
; Code examples assemled by Qi Tianyuan (qitianyuan@foxmail.com).
;


; member function from Chapter 2
;
(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
                (member? a (cdr lat)))))))

; atom? function from Chapter 1
(define atom?
 (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

; The set? function determines if a given lat is a set
;
(define set?
  (lambda (lat)
    (cond
      ((null? lat) #t)
      ((member? (car lat) (cdr lat)) #f)
      (else
        (set? (cdr lat))))))
      

; Examples of set?
;
(display set?)(newline)
(set? '(apples peaches pears plums))            ; #t
(set? '(apple peaches apple plum))              ; #f
(set? '(apple 3 pear 4 9 apple 3 4))            ; #f

; The makeset funciton takes a lat and produces a set
;
(define makeset
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((member? (car lat) (cdr lat))(makeset (cdr lat)))
      (else
         (cons (car lat) (makeset(cdr lat)))))))

; Example of makeset
;
(makeset '(apple peach pear peach plum apple lemon peach))
; ==> '(pear plum apple lemon peach)


; The subset? function determines if set1 is a subset of set2
;
(define subset?
  (lambda (set1 set2)
    (cond
      ((null? set1) #t)
      (else (and (member? (car set1) set2)
                 (subset? (cdr set1) set2))))))

; Examples of subset?
;
(display subset?)(newline)
(subset? '(5 chicken wings)
         '(5 hamburgers 2 pieces fried chicken and light duckling wings))
; ==> #t

(subset? '(4 pounds of horseradish)
         '(four pounds of chicken and 5 ounces of horseradish))
; ==> #f

; The eqset? function determines if two sets are equal
;
(define eqset?
  (lambda (set1 set2)
    (and (subset? set1 set2)
         (subset? set2 set1))))

; Examples of eqset?
;
(display eqset?)(newline)
(eqset? '(a b c) '(c b a))          ; #t
(eqset? '() '())                    ; #t
(eqset? '(a b c) '(a b))            ; #f

; The intersect? function finds if two sets intersect
;
(define intersect?
  (lambda (set1 set2)
    (cond
      ((null? set1) #f)
      ((member? (car set1) set2) #t)
      (else (intersect? (cdr set1) set2)))))

; Examples of intersect?
;
(display intersect?)(newline)
(intersect?
  '(stewed tomatoes and macaroni)
  '(macaroni and cheese))
; ==> #t

(intersect?
  '(a b c)
  '(d e f))
; ==> #f

; The intersect function finds the intersect between two sets
;
(define intersect
  (lambda (set1 set2)
    (cond
      ((null? set1) '())
      ((member? (car set1) set2)
        (cons (car set1) (intersect (cdr set1) set2)))
      (else (intersect (cdr set1) set2)))))
; Example of intersect
;
(display intersect)(newline)
(intersect
  '(stewed tomatoes and macaroni)
  '(macaroni and cheese))
; ==> '(and macaroni)

; The union function finds union of two sets
;
(define union
  (lambda (set1 set2)
    (cond
      ((null? set1) set2)
      ((member? (car set1) set2)
       (union (cdr set1) set2))
      (else (cons (car set1) (union (cdr set1) set2))))))

; Example of union
;
(display union)(newline)
(union
  '(stewed tomatoes and macaroni casserole)
  '(macaroni and cheese))
; ==> '(stewed tomatoes casserole macaroni and cheese)


; !!!!!!
; The xxx function is the set difference function
;
(define xxx
  (lambda (set1 set2)
    (cond
      ((null? set1) '())
      ((member? (car set1) set2)
       (xxx (cdr set1) set2))
      (else
        (cons (car set1) (xxx (cdr set1) set2))))))

; Example of set difference
;
(display xxx)(newline)
(xxx '(a b c) '(a b d e f))     ; '(c)

; The intersectall function finds intersect between multitude of sets
;
(define intersectall
  (lambda (l-set)
    (cond
      ((null? (cdr l-set)) (car l-set))
      (else
        (intersect (car l-set) (intersectall (cdr l-set)))))))

; Examples of intersectall
;
(display intersectall)(newline)
(intersectall '((a b c) (c a d e) (e f g h a b)))       ; '(a)
(intersectall
  '((6 pears and)
    (3 peaches and 6 peppers)
    (8 pears and 6 plums)
    (and 6 prunes with some apples)))                   ; '(6 and)

; Example of pair
(define a-pair?
  (lambda (x)
    (cond
      [(atom? x) #f]
      [(null? x) #f]
      [(null? (cdr x)) #f]
      [(null? (cdr (cdr x))) #t]
      [else #f])))

; Examples of pairs
;
(display "tests of a-pair? \n")
(a-pair? '(pear pear))          ; #t
(a-pair? '(3 7))                ; #t
(a-pair? '((2) (pair)))         ; #t
(a-pair? '(full (house)))       ; #t

; (pair? '(1 2 3))              ; #t
(a-pair? '(1 2 3))              ; #f

; Helper functions for working with pairs
;
(define first
  (lambda (p)
    (car p)))

(define second
  (lambda (p)
    (car (cdr p))))

(define build
  (lambda (s1 s2)
    (cons s1 (cons s2 '()))))

; Just an example of how you'd write third
;
(define third
  (lambda (l)
    (car (cdr (cdr l)))))

(define rel?
  (lambda (l)
    (cond
      [(null? l) #t]
      [(a-pair? (car l)) (rel? (cdr l))]
      [else #f])))

(display "tests of rel \n")
(rel? '((4 3) (4 2) (7 6) (6 2)))       ; #t

; !!!!!!
(define revpair
  (lambda (pair)
    (build (second pair) (first pair))))

(define revrel
  (lambda (rel)
    (cond
      [(null? rel) '()]
      [else (cons (revpair (car rel)) (revrel(cdr rel)))])))

; Example of revrel
;
(display "tests of revrel \n")
(revrel '((8 a) (pumpkin pie) (got sick)))
; ==> '((a 8) (pie pumpkin) (sick got))

; The fullfun? function determines if the given function is full
;
(define fullfun?
  (lambda (fun)
    (set? (seconds fun))))

; It uses seconds helper function
;
(define seconds
  (lambda (l)
    (cond
      ((null? l) '())
      (else
        (cons (second (car l)) (seconds (cdr l)))))))

; Examples of fullfun?
;
(fullfun? '((8 3) (4 2) (7 6) (6 2) (3 4)))     ; #f
(fullfun? '((8 3) (4 8) (7 6) (6 2) (3 4)))     ; #t
(fullfun? '((grape raisin)
            (plum prune)
            (stewed prune)))                    ; #f

; one-to-one? is the same fullfun?
;
(define firsts
  (lambda (l)
    (cond
      ((null? l) '())
      (else
        (cons (car (car l)) (firsts (cdr l)))))))

(define fun?
  (lambda (rel)
    (set? (firsts rel))))


(define one-to-one?
  (lambda (fun)
    (fun? (revrel fun))))

(display "tests of one-to-one \n")
(one-to-one? '((8 3) (4 2) (7 6) (6 2) (3 4)))     ; #f
(one-to-one? '((8 3) (4 8) (7 6) (6 2) (3 4)))     ; #t
(one-to-one? '((grape raisin)
               (plum prune)
               (stewed prune)))                    ; #f

(one-to-one? '((chocolate chip) (doughy cookie)))
; ==> #t and you deserve one now!


