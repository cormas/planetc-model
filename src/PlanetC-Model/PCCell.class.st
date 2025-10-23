Class {
	#name : 'PCCell',
	#superclass : 'CMCell',
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

{ #category : 'private' }
PCCell >> decrementBiomass [

	biomass := 0 max: biomass - 1
]

{ #category : 'testing' }
PCCell >> hasHarvesters [
	
	^ self hasOccupantsOfClass: PCHarvester.
]

{ #category : 'private' }
PCCell >> incrementBiomass [

	biomass := 3 min: biomass + 1
]

{ #category : 'initialization' }
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

{ #category : 'accessing' }
PCCell >> makeNotProtected [

	isProtected := false.
]

{ #category : 'accessing' }
PCCell >> makeProtected [

	isProtected := true.
]

{ #category : 'accessing' }
PCCell >> numberOfNewborns [
	^ numberOfNewborns 
]

{ #category : 'pov' }
PCCell >> pov [ 
	<pov>
	^ CMPointOfView new
		color: (PCColor biomassColors at: biomass + 1);
		borderWidth: 0;
		yourself
]

{ #category : 'pov' }
PCCell >> povBirds [
	<pov>
	| color | 
	color := self colorAttribute: #numberOfNewborns min: 0  max: 2 color: CMColor gold. 
	
	^ CMPointOfView new
		color: color;
		borderWidth: 0;
		yourself
]

{ #category : 'pov' }
PCCell >> povBoard [
	<pov>
	^ CMPointOfView new
		tile: image;
		borderWidth: 0;
		yourself
]

{ #category : 'pov' }
PCCell >> povProtected [

	<pov>
	self isProtected ifFalse: [ ^ self pov ].

	^ CMPointOfView new
		color: CMColor red;
		borderWidth: 0;
		yourself
]

{ #category : 'step' }
PCCell >> step [
	self updateUnvisitedCounter.
	self updateBiomass.
	self updateNewbornBirds.
]

{ #category : 'accessing' }
PCCell >> unvisitedCounter [

	^ unvisitedCounter 
]

{ #category : 'step' }
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

{ #category : 'step' }
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

{ #category : 'step' }
PCCell >> updateUnvisitedCounter [

	unvisitedCounter := self hasHarvesters
		                    ifTrue: [ 0 ]
		                    ifFalse: [ unvisitedCounter + 1 ].
]

{ #category : 'image' }
PCCell >> useImage: aForm [

	image := aForm
]
