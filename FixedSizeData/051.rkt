;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |051|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 51. Design a big-bang program that simulates a traffic light for a given duration.
The program renders the state of a traffic light as a solid circle of the appropriate color, and
it changes state on every clock tick. Hint: Read the documentation for big-bang; there is a reason
all these “words” are linked to their documentation. What is the most appropriate initial state?
Ask your engineering friends.|#

(require 2htdp/image)
(require 2htdp/universe)

;; A Traffic Light that changes color after a time interval.

;; =================
;; Constants:

;; Lights
(define OUTLINE (circle 30 "outline" "black"))
(define GREEN (overlay OUTLINE (circle 30 "solid" "green")))
(define RED (overlay OUTLINE (circle 30 "solid" "red")))
(define YELLOW (overlay OUTLINE (circle 30 "solid" "yellow")))

;; Time interval
(define INTERVAL 3)

;; =================
;; Data definitions:

;; A TrafficLight is one of the following Strings:
;; – "red"
;; – "green"
;; – "yellow"
;; interp. the three strings represent the three 
;; possible states that a traffic light may assume

;; Template for TrafficLight
#;
(define (fn-for-tl tl)
  (cond
    [(string=? "red" s)    (...)]
    [(string=? "green" s)  (...)]
    [(string=? "yellow" s) (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: "red"
;;  - atomic distinct: "green"
;;  - atomic distinct: "yellow"

;; =================
;; Functions:

;; main : TrafficLight -> TrafficLight
;; start the world with (main "red")
;; 
(define (main s)
  (big-bang s                                        ; TrafficLight
            (on-tick   traffic-light-next INTERVAL)  ; TrafficLight -> TrafficLight
            (to-draw   render)))                     ; TrafficLight -> Image

;; traffic-light-next : TrafficLight -> TrafficLight
;; yields the next state given current state s
(check-expect (traffic-light-next "red")    "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow")   "red")

(define (traffic-light-next s)
  (cond
    [(string=? "red" s)    "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s)   "red"]))

;; render : TrafficLight -> Image
;; Render the next traffic light
(check-expect (render "red")       (above RED OUTLINE OUTLINE))
(check-expect (render "green")   (above OUTLINE GREEN OUTLINE))
(check-expect (render "yellow") (above OUTLINE OUTLINE YELLOW))

(define (render s)
  (cond
    [(string=? s "red")       (above RED OUTLINE OUTLINE)]
    [(string=? s "green")   (above OUTLINE GREEN OUTLINE)]
    [(string=? s "yellow") (above OUTLINE OUTLINE YELLOW)]))