Class {
	#name : 'PCFamily',
	#superclass : 'CMAgentGroup',
	#instVars : [
		'colorSymbol',
		'strategy'
	],
	#category : 'PlanetC-Model-Model',
	#package : 'PlanetC-Model',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
PCFamily class >> availableColors [

	^ { #red . #green . #blue . #yellow . #pink }
]

{ #category : 'accessing' }
PCFamily >> collectBiomass [ 
	
	children
		select: [ :harvester | harvester patch isNotNil ]
		thenDo: [ :childHarvester | childHarvester collectBiomass ]
]

{ #category : 'accessing' }
PCFamily >> colorSymbol [

	^ colorSymbol
]

{ #category : 'accessing' }
PCFamily >> colorSymbol: aSymbol [

	colorSymbol := aSymbol
]

{ #category : 'initialization' }
PCFamily >> initializeCells: aCollection strategyClass: aStrategyClass [

	strategy := aStrategyClass new
		            family: self;
		            cells: aCollection;
		            yourself
]

{ #category : 'accessing' }
PCFamily >> sendHarvesters [ 

	strategy sendHarvesters.
]

{ #category : 'accessing' }
PCFamily >> step [

	self sendHarvesters.
	self collectBiomass.
]
