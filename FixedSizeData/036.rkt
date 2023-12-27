;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |036|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 36. Design the function image-area, which counts the number of pixels in a given image.|#

(require 2htdp/image)

;; image-area : Image -> Natural
(check-expect (image-area (square 10 "solid" "green")) 100)
(check-expect (image-area (rectangle 10 30 "solid" "blue")) 300)

#;
(define (fn-for-image img)                         
  (... img))

(define (image-area img)
  (* (image-width img) (image-height img)))

;; Template rules used:
;; - atomic non-distinct: Image