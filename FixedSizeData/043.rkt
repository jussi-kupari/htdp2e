;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |043|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 43. Let’s work through the same problem statement with a time-based data definition:

    ; An AnimationState is a Number.
    ; interpretation the number of clock ticks 
    ; since the animation started

Like the original data definition, this one also equates the states of the world with the class
of numbers. Its interpretation, however, explains that the number means something entirely different.

Design the functions tock and render. Then develop a big-bang expression so that once again you get
an animation of a car traveling from left to right across the world’s canvas.

How do you think this program relates to animate from Prologue: How to Program?

Use the data definition to design a program that moves the car according to a sine wave.
(Don’t try to drive like that.) |#

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

(define CONVERTIBLE
  (overlay/xy
   WHEELS (* WHEEL-RADIUS -1) (* WHEEL-RADIUS -1) CHASSIS))

(define CABIN
  (rectangle
   (* WHEEL-RADIUS 4) (* WHEEL-RADIUS 2) "solid" "red"))

(define CAR
  (overlay/xy
   CABIN (* WHEEL-RADIUS -1) WHEEL-RADIUS CONVERTIBLE))

(define TREE
      (underlay/xy (circle 10 "solid" "green")
                   9 15
                   (rectangle 2 20 "solid" "brown")))

(define SCENE
  (rectangle
   (* (image-width CAR) 20)
   (* (image-height CAR) 3) "outline" "white"))

(define Y-CAR (* 0.82 (image-height SCENE)))

(define BACKGROUND
  (place-image TREE (* 0.75 (image-width SCENE)) Y-CAR SCENE))

(define HALF-CAR-WIDTH (/ (image-width CAR) 2))

(define SPEED 3)

;; =================
;; Data definitions:

;; An AnimationState is a Number.
;; interpretation the number of clock ticks since the animation started
(define AS1 0)   ; Program has yet to advance
(define AS2 99)  ; Program has advanced 99 clock ticks

#;
(define (fn-for-as as)
  (... as))

;; Template rules used:
;; - atomic non-distinct: Number

;; =================
;; Functions:

;; main : AnimationState -> AnimationState
;; launches the program from some initial state. Start with (main 0).
(define (main as)
  (big-bang as           ; AnimationState
    (on-tick   tock)     ; AnimationState -> AnimationState
    (to-draw   render)   ; AnimationState -> AnimationState
    ;(stop-when ...)     ; AnimationState -> Boolean
    ;(on-mouse  ...)     ; AnimationState Integer Integer MouseEvent -> AnimationState
    ;(on-key    ...)     ; AnimationState KeyEvent -> AnimationState  
    ))    

;; tock : AnimationState -> AnimationState
;; Advances the time from the beginning of the program by one clock tick
(check-expect (tock 20) 21)
(check-expect (tock 78) 79)
(check-expect (tock 50) 51)

(define (tock as)
  (add1 as))

;; render : AnimationState -> Image
;; places the image of the car on the BACKGROUND image based on SPEED and passed time. 
(check-expect (render 0) (place-image CAR (* 0 SPEED) Y-CAR BACKGROUND))
(check-expect (render 10) (place-image CAR (* 10 SPEED) Y-CAR BACKGROUND))
(check-expect (render 230) (place-image CAR (* 230 SPEED) Y-CAR BACKGROUND))

(define (render as) (place-image CAR (* as SPEED) Y-CAR BACKGROUND))