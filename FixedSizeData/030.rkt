;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |030|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
#|Exercise 30. Define constants for the price optimization program at the movie theater so that
the price sensitivity of attendance (15 people for every 10 cents) becomes a computed constant.|#

;; Constants
(define BASE-ATTENDANCE 120)
(define BASE-PRICE 5.0)
(define ATTENDANCE-CHANGE 15)
(define PRICE-CHANGE 0.1)
(define VARIABLE-COST 1.5)
(define PRICE-SENSITIVITY (/ ATTENDANCE-CHANGE PRICE-CHANGE))

;; Functions

;; attendees
(define (attendees ticket-price)
  (- BASE-ATTENDANCE
     (* (- ticket-price BASE-PRICE)
        PRICE-SENSITIVITY)))

;; revenue
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

;; cost
(define (cost ticket-price)
  (* VARIABLE-COST (attendees ticket-price)))

;; profit
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 3) ; ==> 630
(profit 4) ; ==> 675
(profit 5) ; ==> 420