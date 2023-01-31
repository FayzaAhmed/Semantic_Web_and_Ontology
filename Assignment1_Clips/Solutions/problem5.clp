;problem 5
(deftemplate square 
	(slot id) 
	(slot side-length)
)

(deftemplate rectangle 
	(slot id)	
	(slot width) 
	(slot length)
)

(deftemplate circle 
	(slot id) 
	(slot radius)
)

(deffacts data
	(square (id A) (side-length 3))
	(square (id B) (side-length 5))
	
	(rectangle (id C) (width 2) (length 5))
	
	(circle (id D) (radius 2))
	(circle (id E) (radius 6))
	
	(sumSquareArea 0)
	(sumRectangleArea 0)
	(sumcircleArea 0)
	
	(sumSquarePerimeters 0)
	(sumRectanglePerimeters 0)
	(sumcirclePerimeters 0)
)
;(reset)

;-------------------Perimeters-----and------Areas-----------------------------

(defrule sum-rectangles
	(declare (salience 30))
	?f1 <-(rectangle (id ?id) (width ?w) (length ?l))
	?f2 <-(sumRectangleArea ?sumA)
	?f3 <-(sumRectanglePerimeters ?sumP)
=>
	(retract ?f1 ?f2 ?f3)
	(assert (sumRectangleArea (+ ?sumA (* ?w ?l))))
	(assert (sumRectanglePerimeters (+ ?sumP (* (+ ?w ?l) 2))))
)

(defrule sum-squares
	(declare (salience 30))
	?f1 <-(square (id ?id) (side-length ?sl))
	?f2 <-(sumSquareArea ?sumA)
	?f3 <-(sumSquarePerimeters ?sumP)
=>
	(retract ?f1 ?f2 ?f3)
	(assert (sumSquareArea (+ ?sumA (* ?sl ?sl))))
	(assert (sumSquarePerimeters (+ ?sumP (* ?sl 4))))
)

(defrule sum-circles
	(declare (salience 30))
	?f1 <-(circle (id ?id) (radius ?r))
	?f2 <-(sumcircleArea ?sumA)
	?f3 <-(sumcirclePerimeters ?sumP)
=>
	(retract ?f1 ?f2 ?f3)
	(assert (sumcircleArea (+ ?sumA (* 3.14 ?r ?r))))
	(assert (sumcirclePerimeters (+ ?sumP (* 2 3.14 ?r ))))
)

(defrule totalAreas
	(declare (salience 10))
	(sumcircleArea ?sc)
	(sumSquareArea ?ss)
	(sumRectangleArea ?sr)
=>
	(assert (totalArea = (+ ?sc ?ss ?sr)))
)

(defrule totalPerimeters
	(declare (salience 10))
	(sumcirclePerimeters ?sc)
	(sumSquarePerimeters ?ss)
	(sumRectanglePerimeters ?sr)
=>
	(assert (totalPerimeters = (+ ?sc ?ss ?sr)))
)

(defrule printTotalAreas
	(declare (salience 1))
	(totalArea ?total)
=>
	(printout t "Total Sum Of Areas = " ?total crlf)
)

(defrule printTotalPerimeters
	(declare (salience 1))
	(totalPerimeters ?total)
=>
	(printout t "Total Sum Of Perimeters = " ?total crlf)
)

;(reset)
;(run)