#lang racket

;
; Chapter 10 of The Little Schemer:
; What Is the Value of All This?
;
; Code examples assemled by Qi Tianyuan <qitianyuan@foxmail.com>.
;

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not(null? x)))))

(define build
  (lambda (s1 s2)
    (cons s1 (cons s2 '()))))

(define new-entry build)

(build '(appetizer entree bevarage)
       '(pate boeuf vin))
(build '(appetizer entree bevarage)
       '(beer beer beer))
(build '(bevarage dessert)
       '((food is) (number one with us)))

(define first
  (lambda (p)
    (car p)))

(define second
  (lambda (p)
    (car (cdr p))))

(define third
  (lambda (l)
    (car (cdr (cdr l)))))

(define lookup-in-entry-help
  (lambda (name names values entry-f)
    (cond
      [(null? names) (entry-f name)]
      [(eq?(car names) name)
       (car values)]
      [else (lookup-in-entry-help name
                                  (cdr names)
                                  (cdr values)
                                  entry-f)])))

(define lookup-in-entry
  (lambda (name entry entry-f)
    (lookup-in-entry-help name
                          (first entry)
                          (second entry)
                          entry-f)))

(display "tests of lookup-in-entry \n")
(lookup-in-entry
 'entree
 '((appetizer entree bevarage) (pate boeuf vin))
 (lambda (n) '()))
; ==> 'boeuf

(lookup-in-entry
 'no-such-item
 '((appetizer entree bevarage) (pate boeuf vin))
 (lambda (n) '()))
; ==> '()

(define lookup-in-table
  (lambda (name table table-f)
    (cond
      [(null? table) (table-f name)]
      [else(lookup-in-table name (car table)
                            (lambda (name)
                              (lookup-in-table name
                                               (cdr table)
                                               table-f)))])))

(define expression-to-action
  (lambda (e)
    (cond
      [(atom? e) (atom-to-action e)]
      [else (list-to-action)])))

(define *const
  (lambda (e table)
    (cond
      [(number? e) e]
      [(eq? e #t) #t]
      [(eq? e #f) #f]
      [else (build 'primitive) e])))

(define text-of second)
(define table-of first)
(define formals-of second)
(define body-of third)


(define *quote
  (lambda (e table)
    (text-of e)))

(define initial-table
  (lambda (name)
    (car '())))

(define *identifer
  (lambda (e table)
    (lookup-in-table e table initial-table)))

(define *lambda
  (lambda (e table)
    (build 'non-primitive
           (cons table (cdr e)))))



(define atom-to-action
  (lambda (e)
    (cond
      [(number? e) *const]
      [(eq? e #t) *const]
      [(eq? e 'cons) *const]
      [(eq? e 'car) *const]
      [(eq? e 'cdr) *const]
      [(eq? e 'null?) *const]
      [(eq? e 'eq?) *const]
      [(eq? e 'atom?) *const]
      [(eq? e 'zero?) *const]
      [(eq? e 'add1) *const]
      [(eq? e 'sub1) *const]
      [(eq? e 'number?) *const]
      [else *identifer])))

(define list-to-action
  (lambda (e)
    (cond
      [(atom? (car e))
       (cond
         [(eq? (car e) 'quote) *quote]
         [(eq? (car e) 'lambda) *lambda]
         [(eq? (car e) 'cond) *cond]
         [else *application])]
      [else *application])))

(define meaning
  (lambda (e table)
    (meaning e '())))

(define value
  (lambda (e)
    (meaning e '())))

(define else?
  (lambda (x)
    (cond
      ((atom? x) (eq? x 'else))
      (else #f))))

(define question-of first)
(define answer-of second)

(define evcon
  (lambda (lines table)
    (cond
      ((else? (question-of (car lines)))
       (meaning (answer-of (car lines)) table))
      ((meaning (question-of (car lines)) table))
      (else (evcon (cdr lines) table)))))

(define cond-lines-of cdr)

(define *cond
  (lambda (e table)
    (evcon (cond-lines-of e) table)))

(define evlis
  (lambda (args table)
    (cond
      [(null? args) '()]
      (else
       (cond (meaning (car args) table)
             (evlis (cdr args) table))))))

(define function-of car)
(define arguments-of cdr)

(define *application
  (lambda (e table)
    (apply
     (meaning (function-of e) (table)
              (evlis(arguments-of e) table)))))

(define primitive?
  (lambda (l)
    (eq? (first l) ('non-primitive))))

(define non-primitive?
  (lambda (l)
    (eq? (first l) 'non-primitive)))

(define apply
  (lambda (fun vals)
    (cond
      ((primitive? fun)
       (apply-primitive
        (second fun) vals))
      ((non-primitive? fun)
       (apply-closure
        (second fun) (vals))))))

(define apply-primitive
  (lambda (name vals)
    (cond
      ((eq? name 'cons)
       (cons (first vals) (second vals)))
      ((eq? name 'car)
       (car (first vals)))
      ((eq? name 'cdr)
       (cdr (first vals)))
      ((eq? name 'null?)
       (null? (first vals)))
      ((eq? name 'eq?)
       (eq? (first vals) (second vals)))
      ((eq? name 'atom?)
       (:atom? (first vals)))
      ((eq? name 'zero?)
       (zero? (first vals)))
      ((eq? name 'add1)
       (+ 1 (first vals)))
      ((eq? name 'sub1)
       (- 1 (first vals)))
      ((eq? name 'number?)
       (number? (first vals))))))

(define :atom?
  (lambda (x)
    (cond
      ((atom? x) #t)
      ((null? x) #f)
      ((eq? (car x) 'primitive) #t)
      ((eq? (car x) 'non-primitive) #t)
      (else #f))))

(define extend-table cons)

(define apply-closure
  (lambda (closure vals)
    (meaning
     (body-of closure)
     (extend-table (new-entry
                    (formals-of closure)
                    vals)
                   (table-of closure)))))

;
; Let's try out our brand new Scheme interpreter!
;

(value '(add1 6))                           ; 7
(value '(quote (a b c)))                    ; '(a b c)
(value '(car (quote (a b c))))              ; 'a
(value '(cdr (quote (a b c))))              ; '(b c)
(value
 '((lambda (x)
     (cons x (quote ())))
   (quote (foo bar baz))))                 ; '((foo bar baz))













