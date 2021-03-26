#lang racket
(require math/matrix)

;matrix-rows?: matrix -> n
(define(matrix-rows? m)
  (length (matrix-rows m)))

;matrix-col?: matrix -> n
(define(matrix-cols? m)
  (length (matrix-cols m)))


;cost: matrix(y) matrix(function) -> matrix
(define(cost m1 m2)
  (cond
    ((= (matrix-rows? m1) (matrix-rows? m2))
      (* (/ 1 (* 2 (matrix-rows? m2))) (apply + (matrix->list (matrix-map-rows (lambda (x) (matrix* x x)) (matrix- m2 m1))))))
     
    (not (= (matrix-rows? m1) (matrix-rows? m2))
         #false)))
  
(define h (matrix [[2][4][6][8]]))
(define y (matrix [[2][5][5][8]]))
(cost y h)
