Class {
	#name : 'PCHarvesterStrategy',
	#superclass : 'Object',
	#instVars : [
		'cells',
		'family'
	],
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'accessing' }
PCHarvesterStrategy >> cells: aCollection [

	cells := aCollection
]

{ #category : 'accessing' }
PCHarvesterStrategy >> family: aFamily [

	family := aFamily
]

{ #category : 'as yet unclassified' }
PCHarvesterStrategy >> sendHarvesters [

	self subclassResponsibility.
]

{ #category : 'sorting' }
PCHarvesterStrategy >> sortCellsFromHighToLow [

	^ cells sorted: [ :a :b | a biomass > b biomass ]
]
