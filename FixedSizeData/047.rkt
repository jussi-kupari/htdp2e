;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |047|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 47. Design a world program that maintains and displays a “happiness gauge.” Let’s call it
gauge-prog, and let’s agree that happiness is a number between 0 and 100 (inclusive).

The gauge-prog program consumes the current level of happiness. With each clock tick, the happiness
level decreases by 0.1; it never falls below 0 though. Every time the down arrow key is pressed, happiness
decreases by 1/5; every time the up arrow is pressed, happiness jumps by 1/3.

To show the level of happiness, we use a scene with a solid, red rectangle with a black frame.
For a happiness level of 0, the red bar should be gone; for the maximum happiness level of H, the
bar should go all the way across the scene.

Note: When you know enough, we will explain how to combine the gauge program with the solution
of exercise 45. Then we will be able to help the cat because as long as you ignore it, it becomes
less happy. If you pet the cat, it becomes happier. If you feed the cat, it becomes much, much happier.
So you can see why you want to know a lot more about designing world programs than these first three
chapters can tell you.|#

(require 2htdp/image)
(require 2htdp/universe)

;; Program that displays a "happiness gauge".

;; =================
;; Constants:

(define WIDTH  200)
(define HEIGHT 20)
(define FRAME (empty-scene WIDTH HEIGHT))
(define BAR-HEIGHT (* HEIGHT 0.8))

;; 80% happiness bar for testing
(define TEST-BAR (rectangle (* WIDTH 0.7) BAR-HEIGHT "solid" "red"))

;; 80% happiness gauge for testing
(define TEST-GAUGE
  (overlay/align "left" "middle"
                 TEST-BAR
                 FRAME))


;; =================
;; Data definitions:

;; HappinessGauge is a Number[0, 100]
;; interp. the happiness level of an individual scaling from 0 to 100
(define HG1 0)   ; Most unhappy
(define HG2 50)  ; Moderately happy
(define HG3 100) ; Maximum happiness achieved!!

#;
(define (fn-for-gauge hg)
  (... hg))

;; Template rules used:
;;  - atomic non-distinct: Number[0, 100]


;; =================
;; Functions:

;; gauge-prog : HappinessGauge -> HappinessGauge
;; start the world with (gauge-prog 100)
;; 
(define (gauge-prog hg)
  (big-bang hg           ; HappinessGauge
    (on-tick   tock)     ; HappinessGauge -> HappinessGauge
    (to-draw   render)   ; HappinessGauge -> Image
    ;(stop-when ...)     ; HappinessGauge -> Boolean
    ;(on-mouse  ...)     ; HappinessGauge Integer Integer MouseEvent -> HappinessGauge
    (on-key    adjust))) ; HappinessGauge KeyEvent -> HappinessGauge


;; tock : HappinessGauge -> HappinessGauge
;; Produces the next HappinessGauge by reducing happiness with 0.1
(check-expect (tock 33)   (- 33 0.1))
(check-expect (tock 50)   (- 50 0.1))
(check-expect (tock 0)          0)
(check-expect (tock 0.2) (- 0.2 0.1))
(check-expect (tock 0.1) (- 0.1 0.1))
(check-expect (tock 0.07)       0)

(define (tock hg)
  (if (negative? (- hg 0.1))
      0
      (- hg 0.1)))


;; HappinessGauge -> Image
;; Render an image of the happiness gauge by placing a correct size bar in the frame. 
(check-expect (render 50)
              (overlay/align "left" "middle"
                             (rectangle (* WIDTH 0.5) BAR-HEIGHT "solid" "red")
                             FRAME))
(check-expect (render 10)
              (overlay/align "left" "middle"
                             (rectangle (* WIDTH 0.1) BAR-HEIGHT "solid" "red")
                             FRAME))
(check-expect (render 1)
              (overlay/align "left" "middle"
                             (rectangle (* WIDTH 0.01) BAR-HEIGHT "solid" "red")
                             FRAME))
(define (render hg)
  (overlay/align "left" "middle"
                 (rectangle (* WIDTH (/ hg 100)) BAR-HEIGHT "solid" "red")
                 FRAME))

;; adjust : HappinessGauge KeyEvent -> HappinessGauge
(check-expect (adjust 50 "left")                50)
(check-expect (adjust 50 "down")         (* 0.8 50))
(check-expect (adjust 50 "up")          (* 1.33 50))
(check-expect (adjust  0 "up")          (* 1.33  1))
(check-expect (adjust 90 "up")                 100)

(define (adjust hg ke)
  (cond
    ; Happiness can't go over 100
    [(and (> (* 1.33 hg) 100) (key=? ke "up")) 100]
    ; If happiness is zero, you can still save the cat by fierce petting
    [(and (zero? hg) (key=? ke "up")) (* 1.33 1)]
    [(key=? ke "up") (* 1.33 hg)]
    [(key=? ke "down") (* 0.8 hg)]
    [else hg]))