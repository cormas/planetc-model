Class {
	#name : 'MiddleBiomassStrategy',
	#superclass : 'PCParkManagerStrategy',
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'accessing' }
MiddleBiomassStrategy >> sendParkManager [

	| middleCells selectedCell|
	middleCells := cells select: [ :cell | cell biomass = 2 ].
	middleCells isEmpty ifTrue: [ ^self ].
	3 timesRepeat: [
    selectedCell := parkManager selectRandomlyFrom: middleCells.
    parkManager moveTo: selectedCell.
    parkManager patch setProtected: 1.
].
]
