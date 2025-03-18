Class {
	#name : 'PCFamilyStrategy',
	#superclass : 'Object',
	#instVars : [
		'cells',
		'family'
	],
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'accessing' }
PCFamilyStrategy >> cells: aCollection [

	cells := aCollection
]

{ #category : 'accessing' }
PCFamilyStrategy >> family: aFamily [

	family := aFamily
]

{ #category : 'as yet unclassified' }
PCFamilyStrategy >> sendHarvesters [

	self subclassResponsibility.
]

{ #category : 'sorting' }
PCFamilyStrategy >> sortCellsFromHighToLow [

	^ cells sorted: [ :a :b | a biomass > b biomass ]
]
