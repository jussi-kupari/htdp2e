;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |011|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
#|Exercise 11. Define a function that consumes two numbers, x and y, and that computes the distance of point (x,y) to the origin.
In exercise 1 you developed the right-hand side of this function for concrete values of x and y. Now add a header.|#

;; distance-to-origin 
(define (distance-to-origin x y)
  (sqrt (+ (sqr x) (sqr y))))

;; Test with known result (5)
(distance-to-origin 3 4) ; =>