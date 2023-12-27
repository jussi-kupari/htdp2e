;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |044|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 44. Formulate the examples as BSL tests. Click RUN and watch them fail.

Note: This program has the full working MouseEvent handler, that follows the
      the failing tests of Ex44.

 Suppose we wish to allow people to move the car through “hyperspace”:

    Sample Problem Design a program that moves a car across the world canvas, from
    left to right, at the rate of three pixels per clock tick. If the mouse is
    clicked anywhere on the canvas, the car is placed at the x-coordinate of that click.

An entry on the wish list covers the first two steps of the design recipe for functions.
Hence, our next step is to develop some functional examples:

    ; WorldState Number Number String -> WorldState
    ; places the car at x-mouse
    ; if the given me is "button-down" 
    ; given: 21 10 20 "enter"
    ; wanted: 21
    ; given: 42 10 20 "button-down"
    ; wanted: 10
    ; given: 42 10 20 "move"
    ; wanted: 42
    (define (hyper x-position-of-car x-mouse y-mouse me)
      x-position-of-car)

|#

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


;; =================
;; Data definitions:

;; WorldState is a Number
;; interp. the x-coordinate of the right-most edge of the car.

#;
(define (fn-for-ws ws)
  (... ws))

;; Template rules used:
;; - atomic non-distinct: Number

;; =================
;; Functions:

;; main : WorldState -> WorldState
;; launches the program from some initial state. Start with (main 0).
(define (main ws)
  (big-bang ws           ; WorldState
    (on-tick   tock)     ; WorldState -> WorldState
    (to-draw   render)   ; WorldState -> Image
    (stop-when end?)     ; WorldState -> Boolean
    (on-mouse  hyper)    ; WorldState Integer Integer MouseEvent -> WorldState
    ;(on-key    ...)     ; WorldState KeyEvent -> WorldState  
    ))    

;; tock : WorldState -> WorldState
;; moves the car by 3 pixels for every clock tick
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(check-expect (tock 50) 53)

(define (tock ws)
  (+ ws 3))

;; render : WorldState -> Image
;; places the image of the car x pixels from the left margin of the BACKGROUND image 
(check-expect (render 0) (place-image CAR (- 0 HALF-CAR-WIDTH) Y-CAR BACKGROUND))
(check-expect (render 78) (place-image CAR (- 78 HALF-CAR-WIDTH) Y-CAR BACKGROUND))

(define (render ws)
  (place-image CAR (- ws HALF-CAR-WIDTH) Y-CAR BACKGROUND))

;; end? : WorldState -> Boolean
;; Produces true after the car has disappeared from the right edge of the scene
(check-expect (end? 0)                                                              #false)
(check-expect (end? (image-width BACKGROUND))                                       #false)
(check-expect (end? (+ (image-width BACKGROUND) (image-width CAR)))                 #false)
(check-expect (end? (+ (image-width BACKGROUND) (image-width CAR) HALF-CAR-WIDTH )) #false)
(check-expect (end? (+ (image-width BACKGROUND) (image-width CAR) HALF-CAR-WIDTH 1)) #true)

(define (end? ws)
  (> (- ws HALF-CAR-WIDTH) (+ (image-width BACKGROUND) (image-width CAR))))

;; hyper : WorldState Number Number MouseEvent -> WorldState
;; Produces a new WorldState at the x-coordinate of the mouse cursor during button press.
(check-expect (hyper 21 10 20 "enter")       21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move")        42)

#;
(define (handle-mouse ws x y me)
  (cond [(mouse=? me "button-down") (... ws x y)]
        [else
         (... ws x y)]))

(define (hyper ws x-mouse y-mouse me) ; I kept the name as ws, not x-position-of-car
  (cond [(mouse=? me "button-down") x-mouse]
        [else ws]))