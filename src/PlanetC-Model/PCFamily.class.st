Class {
	#name : 'PCFamily',
	#superclass : 'CMAgentGroup',
	#instVars : [
		'colorSymbol',
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
PCFamily >> cells: aCollection [

	cells := aCollection 
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

	| threeChildren threeCells |
	threeChildren := self children first: 3.
	threeCells := self searchForHighBiomassCells first: 3.
	
	threeChildren withIndexDo: [ :child :index |
		child moveTo: (threeCells at: index) ]
	
]

{ #category : 'accessing' }
PCFamily >> searchForHighBiomassCells [

	^ cells sorted: [ :a :b | a biomass > b biomass ]
]

{ #category : 'accessing' }
PCFamily >> step [

	self idealTactic.
	children
		select: [ :harvester | harvester patch isNotNil ]
		thenDo: [ :childHarvester | childHarvester collectBiomass ].
]
