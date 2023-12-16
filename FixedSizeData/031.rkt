;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |031|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 31. Recall the letter program from Composing Functions. Here is how to launch the program
and have it write its output to the interactions area:

    > (write-file
       'stdout
       (letter "Matthew" "Fisler" "Felleisen"))

    Dear Matthew,

     

    We have discovered that all people with the

    last name Fisler have won our lottery. So, 

    Matthew, hurry and pick up your prize.

     

    Sincerely, 

    Felleisen

    'stdout

Of course, programs are useful because you can launch them for many different inputs. Run letter on
three inputs of your choice. Here is a letter-writing batch program that reads names from three files
and writes a letter to one:

    (define (main in-fst in-lst in-signature out)
      (write-file out
                  (letter (read-file in-fst)
                          (read-file in-lst)
                          (read-file in-signature))))

The function consumes four strings: the first three are the names of input files and the last one
serves as an output file. It uses the first three to read one string each from the three named files,
hands these strings to letter, and eventually writes the result of this function call into the file
named by out, the fourth argument to main. Create appropriate files, launch main, and check whether
it delivers the expected letter in a given file.|#

(require 2htdp/batch-io)

;; Functions

;; letter
(define (letter fst lst signature-name)
  (string-append
    (opening fst)
    "\n\n"
    (body fst lst)
    "\n\n"
    (closing signature-name)))
 
(define (opening fst)
  (string-append "Dear " fst ","))
 
(define (body fst lst)
  (string-append
   "We have discovered that all people with the" "\n"
   "last name " lst " have won our lottery. So, " "\n"
   fst ", " "hurry and pick up your prize."))
 
(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

;; main
(define (main in-fst in-lst in-signature out)
      (write-file out
                  (letter (read-file in-fst)
                          (read-file in-lst)
                          (read-file in-signature))))

;; Create files, first check by printing to stdout
(write-file 'stdout "Sydney")
(write-file 'stdout "Brenner")
(write-file 'stdout "Charles Darwin")

;; Write files to disk
(write-file "first.name" "Sydney")
(write-file "last.name" "Brenner")
(write-file "signature.name" "Charles Darwin")


;; Check letter output in stdin
(main "first.name" "last.name" "signature.name" 'stdout)

#|Dear Sydney,

We have discovered that all people with the
last name Brenner have won our lottery. So, 
Sydney, hurry and pick up your prize.

Sincerely,

Charles Darwin|#

;; Write letter to disk
(main "first.name" "last.name" "signature.name" "letter.out")

;; Read letter.out to check results
(write-file 'stdout (read-file "letter.out"))

#|Dear Sydney,

We have discovered that all people with the
last name Brenner have won our lottery. So, 
Sydney, hurry and pick up your prize.

Sincerely,

Charles Darwin'|#