Class {
	#name : 'PCStrategy',
	#superclass : 'Object',
	#instVars : [
		'cells',
		'family'
	],
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'accessing' }
PCStrategy >> cells: aCollection [

	cells := aCollection
]

{ #category : 'accessing' }
PCStrategy >> family: aFamily [

	family := aFamily
]

{ #category : 'as yet unclassified' }
PCStrategy >> sendHarvesters [

	self subclassResponsibility.
]

{ #category : 'sorting' }
PCStrategy >> sortCellsFromHighToLow [

	^ cells sorted: [ :a :b | a biomass > b biomass ]
]
