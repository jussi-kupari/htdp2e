;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |025|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 25. Take a look at this attempt to solve exercise 17:

    (define (image-classify img)
      (cond
        [(>= (image-height img) (image-width img)) "tall"]
        [(= (image-height img) (image-width img)) "square"]
        [(<= (image-height img) (image-width img)) "wide"]))

Does stepping through an application suggest a fix?|#

(require 2htdp/image)

;; image-classify
(define (image-classify img)
  (cond
    [(>= (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(<= (image-height img) (image-width img)) "wide"]))


;; Shapes
(define TALL (rectangle 10 20 "solid" "red"))
(define WIDE (rectangle 20 10 "solid" "red"))
(define SQUARE (rectangle 20 20 "solid" "red"))

;; These two work as they should
(image-classify TALL) ; ==> "tall"
(image-classify WIDE) ; ==> "wide"

;; This fails because the first step is flawed
;; Evaluation steps for (image-classify SQUARE)
(image-classify SQUARE)
(cond
  [(>= (image-height SQUARE) (image-width SQUARE)) "tall"]
  [(= (image-height SQUARE) (image-width SQUARE)) "square"]
  [(<= (image-height SQUARE) (image-width SQUARE)) "wide"])
(cond
  [(>= 20 (image-width SQUARE)) "tall"]
  [(= (image-height SQUARE) (image-width SQUARE)) "square"]
  [(<= (image-height SQUARE) (image-width SQUARE)) "wide"])
(cond
  [(>= 20 20) "tall"] ; This evaluates to #true!
  [(= (image-height SQUARE) (image-width SQUARE)) "square"]
  [(<= (image-height SQUARE) (image-width SQUARE)) "wide"])
"tall"

;; A corrected version of image-classify
(define (image-classify2 img)
  (cond
    [(> (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(< (image-height img) (image-width img)) "wide"]))