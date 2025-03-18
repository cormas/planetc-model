Class {
	#name : 'PCParkManager',
	#superclass : 'CMAgent',
	#instVars : [
		'strategy'
	],
	#category : 'PlanetC-Model-Model',
	#package : 'PlanetC-Model',
	#tag : 'Model'
}

{ #category : 'initialization' }
PCParkManager >> initializeCells: aCollection strategyClass: aStrategyClass [

	strategy := aStrategyClass new
		            cells: aCollection;
							parkManager: self;
		            yourself
]

{ #category : 'as yet unclassified' }
PCParkManager >> pov [

	<pov>
	^ CMPointOfView color: CMColor orange shape: #square size: 0.6
]

{ #category : 'accessing' }
PCParkManager >> protectCells [

	strategy protectCells.
]
