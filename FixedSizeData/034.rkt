;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |034|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 34. Design the function string-first, which extracts the first character from a non-empty string.
Don’t worry about empty strings.|#

;; string-first : String -> 1String
;; Produces the first character of a non-empty string.
(check-expect (string-first "abc") "a")
(check-expect (string-first "b") "b")

;(define (string-first str) "") ; the stub

;(define (string-first str)     ; the template
;  (... str))

(define (string-first str)
   (string-ith str 0))
