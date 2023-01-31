;problem 3

(deftemplate student
  (slot name)
  (multislot grades)
)


(defrule read-input 
	(declare (salience 30))
  =>
    (open "input.dat" file "r")
    (bind ?name (read file))
    (while (neq ?name EOF)
		(bind ?c1 (read file))
		(bind ?c2 (read file))
		(bind ?c3 (read file))
		(bind ?c4 (read file))
		(assert (student(name ?name)(grades ?c1 ?c2 ?c3 ?c4)))
        (bind ?name (read file))
	)
    (close file)
)



(defrule grades-gpa 
  (declare (salience 20))
  (student (name ?name) (grades $?grades))
  => 
  (bind ?gpa (/ (+ (expand$ ?grades)) 4))
  (open "output.dat" file "a")
  (printout file ?name "    " $?grades "  " ?gpa " " crlf)
  (close file)
  
)

;(reset)
;(run)