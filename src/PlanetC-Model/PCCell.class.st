Class {
	#name : 'PCCell',
	#superclass : 'CMSpatialEntityElement',
	#instVars : [
		'biomass',
		'isProtected',
		'unvisitedCounter',
		'numberOfNewborns'
	],
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'accessing' }
PCCell >> biomass [
	^ biomass 
]

{ #category : 'accessing' }
PCCell >> biomass: newBiomass [
	biomass := newBiomass.
]

{ #category : 'accessing' }
PCCell >> biomassGrow [

	| harvesters sumOfHBiomes |
	harvesters := self occupantsOfClass: PCHarvester.
	sumOfHBiomes := 0.
	harvesters isEmpty ifTrue: [
		self unvisitedCounter = 1 ifTrue: [ biomass := biomass + 1 ].
		self unvisitedCounter >= 3 ifTrue: [self biomassShrink] ].
	harvesters size = 1 ifTrue: [ "to implement" ].

	harvesters size > 1 ifFalse: [ ^ self ].
	sumOfHBiomes := harvesters sum: [ :harvester |
		                harvester harvestedBiomes ].
	sumOfHBiomes = 3 ifTrue: [ biomass := biomass + 1 ]
]

{ #category : 'accessing' }
PCCell >> biomassShrink [
	<action>
	biomass > 0 
		ifTrue: [biomass := biomass - 1].
]

{ #category : 'accessing' }
PCCell >> hasHarvesters [
	
	^ self hasOccupantsOfClass: PCHarvester.
]

{ #category : 'accessing' }
PCCell >> initialize [ 
	super initialize.
	biomass := (self randomBetween: 0 and: 3) rounded.
	unvisitedCounter := 0.
	numberOfNewborns := 0.
	"zaokruziti biomassu do najblizeg broja"
]

{ #category : 'accessing' }
PCCell >> numberOfNewborns [
	^ numberOfNewborns 
]

{ #category : 'accessing' }
PCCell >> pov [ 
	<pov>
	| color | 
	color := self colorAttribute: #biomass min: 0  max: 3 "add logic behind it" color: CMColor green. 
	^ CMPointOfView 
		color: color
]

{ #category : 'accessing' }
PCCell >> povBirds [
	<pov>
	| color | 
	color := self colorAttribute: #numberOfNewborns min: 0  max: 2 color: CMColor gold. 
	^ CMPointOfView 
		color: color
]

{ #category : 'accessing' }
PCCell >> step [
	self updateUnvisitedCounter.
	self biomassGrow.
	self updateNewbornBirds.
]

{ #category : 'accessing' }
PCCell >> unvisitedCounter [

	^ unvisitedCounter 
]

{ #category : 'accessing' }
PCCell >> updateNewbornBirds [
	
	| occupationProportion numberOfUnoccupiedNeighbours |
	
	self hasHarvesters ifTrue: [ ^ self ].
	self biomass < 2 ifTrue: [ ^ self ].
	
	numberOfUnoccupiedNeighbours := self neighbourhood count: [ :cell | cell hasHarvesters not ]. 
	
	occupationProportion := numberOfUnoccupiedNeighbours / self neighbourhood size.
	
	occupationProportion <= 0.5 ifTrue: [ ^ self ].
	((0.5 < occupationProportion) and: [occupationProportion < 0.8] ) ifTrue: [
		numberOfNewborns := numberOfNewborns + 1 ].
	occupationProportion >= 0.8 ifTrue: [ numberOfNewborns := numberOfNewborns + 2 ].
	
	
	
]

{ #category : 'accessing' }
PCCell >> updateUnvisitedCounter [

	unvisitedCounter := self hasHarvesters
		                    ifTrue: [ 0 ]
		                    ifFalse: [ unvisitedCounter + 1 ].
]
