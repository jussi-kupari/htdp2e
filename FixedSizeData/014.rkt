;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |014|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 14. Define the function string-last, which extracts the last 1String from a non-empty string.|#

;; string-last
(define (string-last str)
  (string-ith str (- (string-length str) 1)))

;; Test with known result
(string-last "abc") ; => "c"
(string-last "a")   ; => "a