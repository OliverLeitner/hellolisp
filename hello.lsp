; LISP
(setf (readtable-case *readtable*) :invert); make clisp input case sensitive... output exactly whats been inputted

; clear screen...
(defun cls()
  (format t "~A[H~@*~A[J" #\escape))

(defun hello ()
  ;(PRINT (LIST 'HELLO 'WORLD))
  ;(format t "hello world~%") ;~% is a new line
  "hello world~%"
)

(defun hello-switch (value)
    (if (= value 0)
      "hello world first!~%"
      "hello world second!~%")
)

(defun hello-user()
  (princ "please input your username: ")
  (finish-output) ; make sure that output comes before input, lisp is async... to the very core...
  ;(setq myname (read))
  (let ((myname (read)))
  (format t "hello ~a hows it goin?~%" myname)) ; let is actual narrow-scope, so the output needs to happen within let scope
)

;lisp basic class, :reader is readonly return, :initarg keyword is callerkeyword, accessor would be modifiable
;https://courses.cs.northwestern.edu/325/readings/clos.php
(defclass world ()
  ((helloworld :initarg :hellotext
          :reader world-helloworld
  )))

;method on class world
(defmethod printworld ((item world))
  (cls)
  (format t "hello, ~a" (world-helloworld item))
  (terpri)
)

;working on a class, instanciating... and passing init values
(defvar item
   (make-instance 'world
     :hellotext 'inyahyah))

;return the above instanciated value from the object
;(princ (world-helloworld item))
;doing the same as above, but through a class method
(printworld item)
(print (class-of item))
(fresh-line)
(print (type-of item))
(fresh-line)
;(inspect item) ;interactive debugger
;(describe item) ;item description
(print (slot-value item 'helloworld)) ;content of the slot (slot can be seen in inspect...)
(fresh-line)
(print (world-helloworld item)) ; same as above, accessing the reader
(fresh-line)

;(defvar one (hello-switch 0))
;(defvar two (hello-switch 1))
;(format t one)
;(format t two)
;(format t (funcall #'hello-switch 0)) ;direct binding and outputting return val of funtion
;(format t (funcall #'hello-switch 1))
;(dribble "lisp.log") ; logging into files from lisp
;(loop for x in '(1 2 3)
;  do (print x))
;(write (loop for x in '(1 2 3) ;write doesnt add a space in front, while print does
;  collect (* x 10)))
;(terpri) ;terminate print line, wow
;(fresh-line) ;the more "modern" new line
;(write (list-length '(0 1 2 3 4 5 6 7 8 9))) ; couting a list, list has to be quoted
;(fresh-line)
;(dribble) ; log until here
;(format t (hello-user (write name)))
;(cls)
;(hello-user)
