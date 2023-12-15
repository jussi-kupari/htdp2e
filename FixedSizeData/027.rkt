;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |027|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
#|Exercise 27. Our solution to the sample problem contains several constants in the middle of functions.
As One Program, Many Definitions already points out, it is best to give names to such constants so that
future readers understand where these numbers come from. Collect all definitions in DrRacket’s definitions
area and change them so that all magic numbers are refactored into constant definitions.

;; attendees
(define (attendees ticket-price)
  (- 120 (* (- ticket-price 5.0) (/ 15 0.1))))

;; revenue
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

;; cost
(define (cost ticket-price)
  (+ 180 (* 0.04 (attendees ticket-price))))

;; profit
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

|#

;; Constants
(define BASE-ATTENDANCE 120)
(define BASE-PRICE 5.0)
(define ATTENDANCE-CHANGE 15)
(define PRICE-CHANGE 0.1)
(define FIXED-COST 180)
(define VARIABLE-COST 0.04)

;; Functions

;; attendees
(define (attendees ticket-price)
  (- BASE-ATTENDANCE
     (* (- ticket-price BASE-PRICE)
        (/ ATTENDANCE-CHANGE PRICE-CHANGE))))

;; revenue
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

;; cost
(define (cost ticket-price)
  (+ FIXED-COST (* VARIABLE-COST (attendees ticket-price))))

;; profit
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
