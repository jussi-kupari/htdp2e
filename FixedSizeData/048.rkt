;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |048|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 48. Enter the definition of reward followed by (reward 18) into the definitions area of DrRacket
and use the stepper to find out how DrRacket evaluates applications of the function.|#

;; Reward is a Number[1, ]

;; reward : Reward -> Color
;; Given a reward, produces the corresponding color.
(define (reward s)
  (cond
    [(<= 0 s 10) "bronze"]
    [(and (< 10 s) (<= s 20)) "silver"]
    [else "gold"]))

;; Step 1
(reward 18)
;; Step 2
(cond
    [(<= 0 18 10) "bronze"]
    [(and (< 10 18) (<= 18 20)) "silver"]
    [else "gold"])
;; Step 3
(cond
    [#false "bronze"]
    [(and (< 10 18) (<= 18 20)) "silver"]
    [else "gold"])
;; Step 4
(cond
    [(and (< 10 18) (<= 18 20)) "silver"]
    [else "gold"])
;; Step 5
(cond
    [(and #true (<= 18 20)) "silver"]
    [else "gold"])
;; Step 6
(cond
    [(and #true #true) "silver"]
    [else "gold"])
;; Step 7
(cond
    [#true "silver"]
    [else "gold"])
;; Step 8
"silver"