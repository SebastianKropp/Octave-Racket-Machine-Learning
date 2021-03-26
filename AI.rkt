#lang racket


;//---------------Modules

(require plot)


;//---------------Structures

(define-struct posn (x y) #:transparent)

;//---------------Operating Functions

;//"htheta v1"
;htheta: y-int slope x -> n
(define(htheta y-int slope x)
  (+ y-int  (* slope x)))

;total-loss: y htheta -> n
  (define(total-loss alop)
    (foldr + 0 (map (lambda (x y) (- y x)) (map (lambda (x) (posn-y x)) alop)  (map (lambda(x) (htheta -2 1 (posn-x x))) alop))))

;//"theta1"
;theta1: alop -> n
;slope
(define(theta1 alop)
  (local ((define alox (map (lambda (x) (posn-x x)) alop))
             (define aloy (map (lambda (x) (posn-y x)) alop))
             (define m (length alop)))
  (/ (- (* m(apply + (map(lambda(x y) (* x y)) alox aloy)))
         (*(apply + alox) (apply + aloy)))
     (- (* m (apply + (map (lambda(x) (sqr x)) alox))) (sqr (apply + alox))))))

;//"theta0"
;theta0: alop -> n
;y-int
(define (theta0 alop)
(local
            ((define alox (map (lambda (x) (posn-x x)) alop))
             (define aloy (map (lambda (x) (posn-y x)) alop))
             (define m (length alop)))
  (- (* (/ 1 m)  (apply + aloy)) (* (apply + alox) (/ (theta1 alop) m)))))

;//"htheta v2"
;h0 : alop -> aloh0
(define (h0 alop)
  (local ((define alox (map (lambda (x) (posn-x x)) alop))
             (define aloy (map (lambda (x) (posn-y x)) alop))
             (define m (length alop)))
(map (λ(x) (+ (theta0 alop) x)) (map (λ(x) (* x (theta1 alop))) alox))))

;//"j"
;j : alop theta -> n
(define (j alop theta)
   (local ((define alox (map (lambda (x) (posn-x x)) alop))
             (define aloy (map (lambda (x) (posn-y x)) alop))
             (define m (length alop)))
     (* (/ 1 (* 2 m))
     (apply +
            (map (λ (x y) (sqr(- y x))) aloy (map (λ(x) (* x theta)) alox))))))


;//---------------Plot for Parabola

;(plot (list (axes) (points (list (list 10 10) (list -10 -10) (list 0 2.33333333333) (list 1 .58333333333333333) (list 2 0) (list 3 2.333333)))))
;(plot (list (axes)
 ;             (function (λ(x) x)) (points
  ;                      (list
   ;                               (vector 1 1)
    ;                              (vector 2 1)
     ;                             (vector 3 4))))
      ;                  #:x-min 0 #:y-min 0 #:x-max 5 #:y-max 5)
                                  
 
