; problem 2

(deftemplate table
	(slot Country)
	(multislot Flag-Color) 
)

(deffacts data
	(table 
	     (Country Egypt)
	     (Flag-Color red white black)
	)
	(table 
	     (Country United-states)
	     (Flag-Color red white blue)
	)
	(table 
	     (Country Belgium)
	     (Flag-Color black yellow red)
	)
	(table 
	     (Country Sweden)
	     (Flag-Color yellow blue)
	)
	(table 
	     (Country Italy)
	     (Flag-Color green white red)
	)
	(table 
	     (Country Ireland)
	     (Flag-Color green white orange)
	)
	(table 
	     (Country Greece)
	     (Flag-Color blue white)
	)
)


(defrule read-input 
=>
	(printout t "Enter the color value " crlf)
	(assert (color (read)))
	(printout t crlf)
	(printout t "The countries with flag that contains this color: " crlf)
)

(defrule getCountry
	(color ?col)
	(table (Country ?country) (Flag-Color $?flag-Color))
	(test (member$ ?col ?flag-Color))
=>
	(printout t ?country crlf)
)

;(reset)
;(run)
