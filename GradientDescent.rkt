#lang racket
(require "AI.rkt")
(require plot)
(require 2htdp/universe)
(require math/matrix)

(define-struct posn(x y) #:transparent)
(define-struct world(theta alop) #:transparent)
;(* (- (apply + (h0 alop)) (apply + aloy)) (apply + alox))))

(define alpha .5)
;create-scene : world -> world
(define (create-scene aworld)
  (local ((define theta0 (first (world-theta aworld)))
          (define theta1 (second (world-theta aworld))))
  (plot (list (axes)
              (points (list (vector 1 1) (vector 2 2) (vector 3 3)))
              (function (lambda(x) (+ (* theta1 x)
                                      theta0)) -10 10)))))
   
;move : world -> world
(define (move aworld)
  (local ((define theta0 (first (world-theta aworld)))
          (define theta1 (second (world-theta aworld)))
          (define alop (world-alop aworld)))
 (make-world  (list (- theta0
                       (* .5(* (/ 1 (length alop))
                               (foldr + 0 (map (lambda(alop-x) (- (+ (* (posn-x x) theta1 theta0) (posn-y x))))
                                               alop))))))
                    (- theta1
                       (* .5(* (/ 1 (length alop))
                               (foldr + 0 (map (lambda(alop-y) (* (posn-x x) (-(+(* (posn-x x) theta1) theta0) (posn-y x))))
                                                alop))))))
              (list alop)))
                                  

(move (make-world (list 1 1) (list (make-posn 1 1) (make-posn 2 2) (make-posn 3 3))))
(move (make-world (list 1 1) (list (make-posn 1 5) (make-posn 5 2) (make-posn 8 3))))



   (big-bang
    (make-world '(1 1) (list (make-posn 1 1) (make-posn 2 2) (make-posn 3 3)))
    (on-draw create-scene)
    (on-tick move))
  

  
