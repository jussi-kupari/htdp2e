;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |017|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 17. Define the function image-classify, which consumes an image and conditionally produces "tall"
if the image is taller than wide, "wide" if it is wider than tall, or "square" if its width and height are the same.
See exercise 8 for ideas.|#

(require 2htdp/image)

;; image-classify
(define (image-classify img)
  (if (< (image-width img)
         (image-height img))
      "tall"
      (if (> (image-width img)
             (image-height img))
          "wide"
          "square")))

;; Shapes
(define TALL (rectangle 10 20 "solid" "red"))
(define WIDE (rectangle 20 10 "solid" "red"))
(define SQUARE (rectangle 20 20 "solid" "red"))

;; Test with known results
(image-classify TALL) ; ==> "tall"
(image-classify WIDE) ; ==> "wide"
(image-classify SQUARE) ; ==> "square"