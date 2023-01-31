; problem 1

(defrule store-data 
=>
	(assert (father Ahmed Mohammed))
	(assert (father Ali Sara))
	(assert (father Hassan Ahmed))
	(assert (mother Mona Ali))
)



(defrule parents
	(or (father ?x ?y) (mother ?x ?y) )
	=> (assert(parent ?x ?y))
)


(defrule grandfather
	(and (father ?x ?y) (parent ?y ?z))
	
	=> (assert(grandfather ?x ?z))
)


(defrule grandmother
	(and (mother ?x ?y) (parent ?y ?z))
	
	=> (assert(grandmother ?x ?z))
)


;(run)
;(facts)
