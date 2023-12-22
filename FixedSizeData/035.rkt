;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |035|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 35. Design the function string-last, which extracts the last character from a non-empty string.|#

;; string-last : String -> 1String
(check-expect (string-last "abc") "c")
(check-expect (string-last "a") "a")

;(define (string-last str) "") ; the stub

;(define (string-last str)     ; the template
;  (... str))

(define (string-last str)
  (string-ith str (- (string-length str) 1)))

