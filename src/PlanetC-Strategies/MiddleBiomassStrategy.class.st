Class {
	#name : 'MiddleBiomassStrategy',
	#superclass : 'PCParkManagerStrategy',
	#category : 'PlanetC-Strategies',
	#package : 'PlanetC-Strategies'
}

{ #category : 'accessing' }
MiddleBiomassStrategy >> protectCells [

	| middleCells selectedCell |
	middleCells := cells select: [ :cell | cell biomass = 2 ].
	middleCells isEmpty ifTrue: [ ^ self ].
	3 timesRepeat: [
		selectedCell := parkManager selectRandomlyFrom: middleCells.
		selectedCell makeProtected ]
]
