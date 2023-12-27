;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |034|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 34. Design the function string-first, which extracts the first character from a non-empty string.
Don’t worry about empty strings.|#

;; NonEmptyString or NES is a String composed of 1 or more 1String

;; string-first : NonEmptyString -> 1String
;; Produces the first character from the given string.
(check-expect (string-first "abc") "a")
(check-expect (string-first "b") "b")

#; 
(define (fn-for-nes str)
  (... str))

(define (string-first str)
   (string-ith str 0))

;; Template rules used:
;; - atomic non-distinct: String