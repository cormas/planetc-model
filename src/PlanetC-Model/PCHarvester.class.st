Class {
	#name : 'PCHarvester',
	#superclass : 'CMAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'harvestedBiomass'
	],
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'initialization' }
PCHarvester >> collectBiomass [
	"change logic a little bit acording to the rules"

	<action>
	| biomass |
	biomass := self patch biomass.
	biomass = 0 ifTrue: [ ^ self ].

	(biomass = 1 or: [ biomass = 2 ]) ifTrue: [
		harvestedBiomass := biomass.
		self patch biomass: self patch biomass - biomass.
		^ self ].
	harvestedBiomass := harvestedBiomass + 2.
	self patch biomass: self patch biomass - 2
]

{ #category : 'accessing' }
PCHarvester >> harvestedBiomass [
	^ harvestedBiomass 
]

{ #category : 'initialization' }
PCHarvester >> initialize [

	super initialize.

	harvestedBiomass := 0.
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
        shape: #star
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

	self collectBiomass.
]
