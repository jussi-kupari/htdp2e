;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |009|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 9. Add the following line to the definitions area of DrRacket:

    (define in ...)

Then create an expression that converts the value of in to a non-negative number.
For a String, it determines how long the String is; for an Image, it uses the area;
for a Number, it uses the absolute value; for #true it uses 10 and for #false 20.
Hint Check out cond from the Prologue: How to Program (again).

See exercise 1 for how to create expressions in DrRacket.|#

(require 2htdp/image)

(define in #false)

;; Convert in to non-negative number based on type
(if (string? in)
    (string-length in)
    (if (image? in)
        (* (image-width in) (image-height in))
        (if (number? in)
            (abs in)
            (if (and (boolean? in) (false? in))
                20
                10))))