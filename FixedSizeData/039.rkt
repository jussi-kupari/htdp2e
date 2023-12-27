;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |039|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 39. Good programmers ensure that an image such as CAR can be enlarged or reduced via a single change to a constant definition.
Good programmers establish a single point of control for all aspects of their programs, not just the graphical constants.
Several chapters deal with this issue. We started the development of our car image with a single plain definition:

    (define WHEEL-RADIUS 5)

The definition of WHEEL-DISTANCE is based on the wheel’s radius. Hence, changing WHEEL-RADIUS from 5 to 10 doubles the size of the car image.
This kind of program organization is dubbed single point of control, and good design employs this idea as much as possible.

Develop your favorite image of an automobile so that WHEEL-RADIUS remains the single point of control.|#

(require 2htdp/image)

;; The single point of control.
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