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

{ #category : 'initialization' }
PCHarvester >> pov [
    <pov>
    ^ CMPointOfView
        color: CMColor blue
        shape: #star
        size: 0.6
]

{ #category : 'initialization' }
PCHarvester >> step [ 
	
	self moveRandomly.
]
