;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |016|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 16. Define the function image-area, which counts the number of pixels in a given image.|#

(require 2htdp/image)

;; image-area
(define (image-area img)
  (* (image-width img) (image-height img)))

;; Test with known results
(image-area (square 10 "solid" "green")) ; ==> 100
(image-area (rectangle 10 30 "solid" "blue")) ; ==> 300