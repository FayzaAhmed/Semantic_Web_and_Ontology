;problem 6

(deftemplate Person
	(multislot full-name)
	(multislot children)
)

(deffacts name
	(Person (full-name Asmaa Refat abd ELmabood)
		    (children yara ahmed noura mohamed)
    )

	(Person (full-name Fayza Ahmed Abo Zied)
		    (children yaseen jasmin)
    ) 
    
    (Person (full-name hasnaa Ahmed Abo Zied)
		    (children hasona rashida bakar cindrella)
    ) 
)
;(reset)


;Define a rule that prints the parents that have more than 3 children

(defrule printParents
	(Person (full-name $?name) (children $?children))
	(test (> (length$ ?children) 3))
=>
	(printout t $?name crlf)
)

;Define a rule that print the parent of a certain child
;The specified child name will be asserted in a fact called (child-name <name>)

;(assert(child-name yaseen))

(defrule parentOfCertainChild
	(child-name ?childName) 
	(Person (full-name $?name) (children $?children))
	(test (member$ ?childName ?children))
=>
	(printout t $?name crlf)
)


;(run)
