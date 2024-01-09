;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |049|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 49. A cond expression is really just an expression and may therefore show up in
 middle of another expression:

    (- 200 (cond [(> y 200) 0] [else y]))

Use the stepper to evaluate the expression for y as 100 and 210. |#

(define Y1 100)
(define Y2 210)

;; Step 1
(- 200 (cond [(> Y1 200) 0] [else Y1]))
;; Step 2
(- 200 (cond [(> 100 200) 0] [else Y1]))
;; Step 3
(- 200 (cond [#false 0] [else Y1]))
;; Step 4
(- 200 (cond [else Y1]))
;; Step 5
(- 200 Y1)
;; Step 6
(- 200 100)
;; Step 7
100

;; Step 1
(- 200 (cond [(> Y2 200) 0] [else Y2]))
;; Step 2
(- 200 (cond [(> 210 200) 0] [else Y2]))
;; Step 3
(- 200 (cond [#true 0] [else Y2]))
;; Step 4
(- 200 0)
;; Step 5
200