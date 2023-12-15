;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |018|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
#|Exercise 18. Define the function string-join, which consumes two strings and appends them with "_" in between. See exercise 2 for ideas.|#

;; string-join
(define (string-join prefix suffix)
  (string-append prefix "_" suffix))

(define STRING1 "hello")
(define STRING2 "world")

;; Test with known results
(string-join STRING1 STRING2) ; ==> "hello_world"