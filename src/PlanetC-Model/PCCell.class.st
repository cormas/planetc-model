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
	#category : 'PlanetC-Model-Model',
	#package : 'PlanetC-Model',
	#tag : 'Model'
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
PCCell >> decrementBiomass [

	biomass := 0 max: biomass - 1
]

{ #category : 'accessing' }
PCCell >> hasHarvesters [
	
	^ self hasOccupantsOfClass: PCHarvester.
]

{ #category : 'accessing' }
PCCell >> incrementBiomass [

	biomass := 3 min: biomass + 1
]

{ #category : 'accessing' }
PCCell >> initialize [

	super initialize.
	unvisitedCounter := 0.
	numberOfNewborns := 0.
	isProtected := false.
]

{ #category : 'accessing' }
PCCell >> isProtected [
	^ isProtected
]

{ #category : 'as yet unclassified' }
PCCell >> makeNotProtected [

	isProtected := false.
]

{ #category : 'as yet unclassified' }
PCCell >> makeProtected [

	isProtected := true.
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
PCCell >> povProtected [

	<pov>
	^self isProtected ifTrue: [ CMPointOfView color: CMColor red ] ifFalse: [self pov].
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

	<action>
	| harvesters sumOfHarvestedBiomass |
	harvesters := self occupantsOfClass: PCHarvester.
	sumOfHarvestedBiomass := 0.
	harvesters isEmpty ifTrue: [
		self unvisitedCounter = 1 ifTrue: [ self incrementBiomass ].
		self unvisitedCounter >= 3 ifTrue: [ self decrementBiomass ] ].
	harvesters size = 1 ifTrue: [ self incrementBiomass ].

	harvesters size > 1 ifFalse: [ ^ self ].
	sumOfHarvestedBiomass := harvesters sum: [ :harvester |
		                         harvester harvestedBiomass ].
	sumOfHarvestedBiomass = 3 ifTrue: [ self incrementBiomass ]
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
		numberOfNewborns := 1 ].
	occupationProportion >= 0.8 ifTrue: [ numberOfNewborns := 2 ].
	
	
	
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
