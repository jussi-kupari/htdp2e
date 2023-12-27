;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |038|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 38. Design the function string-remove-last, which produces a string like the given one with the last character removed.|#

;; NonEmptyString or NES is a String composed of 1 or more 1String

;; string-remove-last : NonEmptyString -> String
(check-expect (string-remove-last "abc") "ab")
(check-expect (string-remove-last "a") "")

#;
(define (fn-for-nes str) 
  (... str))

(define (string-remove-last str)
  (substring str 0 (- (string-length str) 1)))

;; Template rules used:
;; - atomic non-distinct: String