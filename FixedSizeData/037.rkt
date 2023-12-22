;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |037|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 37. Design the function string-rest, which produces a string like the given one with the first character removed.|#

;; string-rest : String -> String
(check-expect (string-rest "abc") "bc")
(check-expect (string-rest "a") "")

;(define (string-rest str) "") ; the stub

;(define (string-rest str)     ; the template
;  (... str))

(define (string-rest str)
  (substring str 1))

