Class {
	#name : 'MiddleBiomassStrategy',
	#superclass : 'PCParkManagerStrategy',
	#category : 'PlanetC-Model-Strategies',
	#package : 'PlanetC-Model',
	#tag : 'Strategies'
}

{ #category : 'accessing' }
MiddleBiomassStrategy >> sendParkManager [

	| middleCells selectedCell |
	middleCells := cells select: [ :cell | cell biomass = 2 ].
	middleCells isEmpty ifTrue: [ ^ self ].
	3 timesRepeat: [
		selectedCell := parkManager selectRandomlyFrom: middleCells.
		selectedCell makeProtected ]
]
