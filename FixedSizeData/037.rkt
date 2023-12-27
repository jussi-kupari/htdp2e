;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |037|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 37. Design the function string-rest, which produces a string like the given one with the first character removed.|#

;; NonEmptyString or NES is a String composed of 1 or more 1String

;; string-rest : NonEmptyString -> String
(check-expect (string-rest "abc") "bc")
(check-expect (string-rest "a") "")

#;
(define (fn-for-nes str)     
  (... str))

(define (string-rest str)
  (substring str 1))

;; Template rules used:
;; - atomic non-distinct: String