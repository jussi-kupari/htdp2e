;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |028|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 28. Determine the potential profit for these ticket prices: $1, $2, $3, $4, and $5.
Which price maximizes the profit of the movie theater? Determine the best ticket price to a dime.|#


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

(profit 1) ; ==> 511.2
(profit 2) ; ==> 937.2
(profit 3) ; ==> 1063.2 <-- Max profit from these five prices.
(profit 4) ; ==> 889.2
(profit 5) ; ==> 415.2

(profit 2.7) ; ==> 1056.9
(profit 2.8) ; ==> 1062
(profit 2.9) ; ==> 1064.1 <-- Best price to a dime.