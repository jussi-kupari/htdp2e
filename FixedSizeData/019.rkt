;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |019|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
#|Exercise 19. Define the function string-insert, which consumes a string str plus a number i and inserts "_" at the ith position of str.
Assume i is a number between 0 and the length of the given string (inclusive). See exercise 3 for ideas.
Ponder how string-insert copes with "". |#

;; string-insert
(define (string-insert str i)
  (string-append
   (substring str 0 i) "_"
   (substring str i)))

(define STRING "helloworld")
(define INDX 5)

;; Test with known results
(string-insert STRING INDX) ; ==> "hello_world"

(string-insert "" 0) ; ==> "_"

#| For the empty string, "", the only valid index is 0

(string-insert "" 2)
substring: ending index is out of range
  ending index: 2
  valid range: [0, 0]
  string: ""

|#