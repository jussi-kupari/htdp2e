;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |021|) (read-case-sensitive #true) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#true constructor repeating-decimal #false #true none #false ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #false)))
#|Exercise 21. Use DrRacket’s stepper to evaluate (ff (ff 1)) step-by-step. Also try (+ (ff 1) (ff 1)).
Does DrRacket’s stepper reuse the results of computations?|#

;; ff
(define (ff a)
  (* 10 a))

;; Evaluation steps for (ff (ff 1))
(ff (ff 1))
(ff (* 10 1))
(ff 10)
(* 10 10)
100

;; Evaluation steps for (+ (ff 1) (ff 1))
(+ (ff 1) (ff 1))
(+ (* 10 1) (ff 1))
(+ 10 (ff 1))
(+ 10 (* 10 1))
(+ 10 10)
20