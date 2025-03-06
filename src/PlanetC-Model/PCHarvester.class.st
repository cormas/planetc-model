Class {
	#name : 'PCHarvester',
	#superclass : 'CMAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'harvestedBiomes'
	],
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'accessing' }
PCHarvester >> goToCell: aCell [

	self moveTo: aCell
]

{ #category : 'accessing' }
PCHarvester >> harvestedBiomes [
	^ harvestedBiomes 
]

{ #category : 'initialization' }
PCHarvester >> initialize [ 
	super initialize.
]

{ #category : 'initialization' }
PCHarvester >> move [
	<action>
   
	| theBestCell |
	
	theBestCell := self patch neighbourhoodAndSelf find: [ :cell | cell  ]
]

{ #category : 'initialization' }
PCHarvester >> moveRandomly [
    <action>
    self randomWalkConstrainedBy: [ :cell |
        (cell hasOccupantsOfClass: self class) not ]
]

{ #category : 'pov' }
PCHarvester >> pov [
    <pov>
    ^ CMPointOfView
        color: (PCColor pieces at: self group colorSymbol)
        shape: #circle
        size: 0.3
]

{ #category : 'pov' }
PCHarvester >> povImage [
    <pov>
    ^ CMPointOfView
        image: (PCImages pieces at: self group colorSymbol)
        size: 0.5
]

{ #category : 'initialization' }
PCHarvester >> step [ 
	
	self moveRandomly.
]
