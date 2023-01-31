;problem 4

(defclass Shape
	(is-a USER)
	(role abstract)
	(slot ID (type SYMBOL))
	(slot color (allowed-values red blue green yellow))
)

;-------------------------------------------------------
(defclass Square
	(is-a Shape)
	(role concrete)
	(slot length)
)

(defmessage-handler Square calcArea ()
	(bind ?length (send ?self get-length))
	(bind ?Area (* ?length ?length))
	(printout t  ?Area crlf)
)

(defmessage-handler Square calcPerimeter ()
	(bind ?length (send ?self get-length))
	(bind ?perimeter (* ?length 4))
	(printout t  ?perimeter crlf)
)

;-------------------------------------------
(defclass Rectangle
	(is-a Shape)
	(role concrete)
	(slot width)
	(slot length)
)

(defmessage-handler Rectangle calcArea ()
	(bind ?length (send ?self get-length))
	(bind ?width (send ?self get-width))
	(bind ?Area (* ?length ?width))
	(printout t  ?Area crlf)
)

(defmessage-handler Rectangle calcPerimeter ()
	(bind ?length (send ?self get-length))
	(bind ?width (send ?self get-width))
	(bind ?perimeter (* (+ ?length ?width) 2))
	(printout t  ?perimeter crlf)
)
;------------------------------------------

(definstances shapes 
	(s1 of Square (ID A)(color blue) (length 3))
	(r1 of Rectangle (ID C) (width 2) (length 5))
)

;(reset)

;(send [s1] calcArea)
;(send [r1] calcArea)

;(send [s1] calcPerimeter)
;(send [r1] calcPerimeter)


;(instances)
