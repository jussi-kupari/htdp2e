;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |005|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
#|Exercise 5. Use the 2htdp/image teachpack to create the image of a simple boat or tree.
Make sure you can easily change the scale of the entire image.|#

;; Scale
(define SCALE 20)

;; Trunk
(define TRUNK
  (rectangle SCALE (* 3 SCALE) "solid" "brown"))

;; Foliage
(define FOLIAGE
  (circle (* 2 SCALE) "solid" "green"))

;; Draw tree
(define TREE (above FOLIAGE TRUNK))

TREE