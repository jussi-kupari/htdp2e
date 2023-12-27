;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |040|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#||#

#|Exercise 40. Formulate the examples as BSL tests, that is, using the check-expect form.
Introduce a mistake. Re-run the tests.

; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
(define (tock cw) cw)

; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
; examples: 
;   given: 20, expect 23
;   given: 78, expect 81
(define (tock cw)
  (+ cw 3))

|#

;; Note, I follow a format similar to the 'HTC Simple Data' Design Recipes
;; I keep the names similar to HTDP to make it easy to follow the book

(require 2htdp/image)
(require 2htdp/universe)

;; Car moving across the screen

;; =================
;; Constants:

(define WHEEL-RADIUS 5)

(define WHEEL-BASE (rectangle (* WHEEL-RADIUS 4) 0 "outline" "red"))
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define WHEELS (beside WHEEL WHEEL-BASE WHEEL))
(define CHASSIS
  (rectangle
   (* WHEEL-RADIUS 10) (* WHEEL-RADIUS 2.5) "solid" "red"))

;; Car without cabin
(define CONVERTIBLE
  (overlay/xy
   WHEELS (* WHEEL-RADIUS -1) (* WHEEL-RADIUS -1) CHASSIS))

;; Cabin
(define CABIN
  (rectangle
   (* WHEEL-RADIUS 4) (* WHEEL-RADIUS 2) "solid" "red"))

;; Full car
(define CAR
  (overlay/xy
   CABIN (* WHEEL-RADIUS -1) WHEEL-RADIUS CONVERTIBLE))

;; Background
(define BACKGROUND
  (rectangle
   (* (image-width CAR) 20)
   (* (image-height CAR) 3) "outline" "black"))

;; =================
;; Data definitions:

;; WorldState is a Number
;; interp. the number of pixels between the left border of the scene and the car

#;
(define (fn-for-ws ws)
  (... ws))

;; Template rules used:
;; - atomic non-distinct: Number

;; =================
;; Functions:

;; main : WorldState -> WorldState
;; launches the program from some initial state 
(define (main ws)
  (big-bang ws           ; WorldState
    (on-tick   tock)     ; WorldState -> WorldState
    (to-draw   render)   ; WorldState -> Image
    ;(stop-when ...)     ; WorldState -> Boolean
    ;(on-mouse  ...)     ; WorldState Integer Integer MouseEvent -> WorldState
    ;(on-key    ...)     ; WorldState KeyEvent -> WorldState  
    ))    

;; tock : WorldState -> WorldState
;; moves the car by 3 pixels for every clock tick
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(check-expect (tock 50) 52) ;==> This produces an error, but the error is here in the test...

(define (tock cw)
  (+ cw 3))

;; render : WorldState -> Image
;; places the image of the car x pixels from the left margin of the BACKGROUND image 
;; !!!
(define (render ws) BACKGROUND)