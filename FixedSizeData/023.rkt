;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |023|) (read-case-sensitive #true) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#true constructor repeating-decimal #false #true none #false ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #false)))
#|Exercise 23. The first 1String in "hello world" is "h". How does the following function compute this result?

    (define (string-first s)
      (substring s 0 1))

Use the stepper to confirm your ideas.|#

;; string-first
(define (string-first s)
      (substring s 0 1))

;; Evaluation steps for (string-first "hello world")
(string-first "hello world")
(substring "hello world" 0 1)
"h"