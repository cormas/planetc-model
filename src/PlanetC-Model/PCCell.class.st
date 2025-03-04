Class {
	#name : 'PCCell',
	#superclass : 'CMSpatialEntityElement',
	#instVars : [
		'biomass',
		'isProtected',
		'unvisitedCounter',
		'numberOfNewborns',
		'image'
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
	^ CMPointOfView color: (PCColor biomassColors at: biomass + 1)
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
PCCell >> povBoard [
	<pov>
	^ CMPointOfView image: image
]

{ #category : 'accessing' }
PCCell >> step [
	self updateUnvisitedCounter.
	self updateBiomass.
	self updateNewbornBirds.
]

{ #category : 'accessing' }
PCCell >> unvisitedCounter [

	^ unvisitedCounter 
]

{ #category : 'accessing' }
PCCell >> updateBiomass [

	| harvesters sumOfHBiomes |
	harvesters := self occupantsOfClass: PCHarvester.
	sumOfHBiomes := 0.
	harvesters isEmpty ifTrue: [
		self unvisitedCounter = 1 ifTrue: [ biomass := 3 min: biomass + 1 ].
		self unvisitedCounter >= 3 ifTrue: [ biomass := 0 max: biomass - 1 ] ].
	harvesters size = 1 ifTrue: [ "to implement" ].

	harvesters size > 1 ifFalse: [ ^ self ].
	sumOfHBiomes := harvesters sum: [ :harvester |
		                harvester harvestedBiomes ].
	sumOfHBiomes = 3 ifTrue: [ biomass := biomass + 1 ]
]

{ #category : 'accessing' }
PCCell >> updateNewbornBirds [
	
	| occupationProportion numberOfUnoccupiedNeighbours |
	
	self hasHarvesters ifTrue: [ ^ self ].
	self biomass < 2 ifTrue: [ ^ self ].
	
	numberOfUnoccupiedNeighbours := self neighbourhood count: [ :cell | cell hasHarvesters not ]. 
	
	occupationProportion := numberOfUnoccupiedNeighbours / self neighbourhood size.
	
	
	
]

{ #category : 'accessing' }
PCCell >> updateUnvisitedCounter [

	unvisitedCounter := self hasHarvesters
		                    ifTrue: [ 0 ]
		                    ifFalse: [ unvisitedCounter + 1 ].
]

{ #category : 'as yet unclassified' }
PCCell >> useImage: aForm [

	image := aForm
]
