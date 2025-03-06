Class {
	#name : 'PCFamily',
	#superclass : 'CMAgentGroup',
	#instVars : [
		'colorSymbol',
		'childrenHarvesters',
		'cells'
	],
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'as yet unclassified' }
PCFamily class >> availableColors [

	^ { #red . #green . #blue . #yellow . #pink }
]

{ #category : 'accessing' }
PCFamily >> cells [
	^ cells
]

{ #category : 'accessing' }
PCFamily >> colorSymbol [

	^ colorSymbol
]

{ #category : 'accessing' }
PCFamily >> colorSymbol: aSymbol [

	colorSymbol := aSymbol
]

{ #category : 'accessing' }
PCFamily >> idealTactic [
	
	| threeChildren threeCells|
	
	threeChildren := self children first: 3.
	threeCells := self searchForHighBiomassCells first: 3.
	
	threeChildren withIndexDo: [ 
		:child :index | child goToCell: (threeCells at: index).
		].
]

{ #category : 'accessing' }
PCFamily >> initialize [

	super initialize.
	childrenHarvesters := self children.
"	cells := PCModel cells
	
	Add cells"
]

{ #category : 'accessing' }
PCFamily >> searchForHighBiomassCells [

	| sortedCells |
	sortedCells := cells sort: [ :a :b | a biomass > b biomass ].

	^ sortedCells
]

{ #category : 'accessing' }
PCFamily >> step [

	self idealTactic.
	childrenHarvesters do: [ :childHarvester |
		childHarvester collectBiomass ]
]
