;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |029|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 29. After studying the costs of a show, the owner discovered several ways of lowering the cost.
As a result of these improvements, there is no longer a fixed cost; a variable cost of $1.50 per attendee remains.

Modify both programs to reflect this change. When the programs are modified, test them again with ticketprices of
$3, $4, and $5 and compare the results.|#

;; Constants
(define BASE-ATTENDANCE 120)
(define BASE-PRICE 5.0)
(define ATTENDANCE-CHANGE 15)
(define PRICE-CHANGE 0.1)
(define VARIABLE-COST 1.5)

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
  (* VARIABLE-COST (attendees ticket-price)))

;; profit
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;; profit-alt
(define (profit-alt price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
        (* 1.5
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price))))))

(profit 3) ; ==> 630
(profit 4) ; ==> 675
(profit 5) ; ==> 420

(profit-alt 3) ; ==> 630
(profit-alt 4) ; ==> 675
(profit-alt 5) ; ==> 420