Class {
	#name : 'PCHarvester',
	#superclass : 'CMAgent',
	#instVars : [
		'harvestedBiomass'
	],
	#category : 'PlanetC-Model-Model',
	#package : 'PlanetC-Model',
	#tag : 'Model'
}

{ #category : 'actions' }
PCHarvester >> collectBiomass [
	"change logic a little bit acording to the rules"

	<action>
	| biomass |
	biomass := self cell biomass.
	biomass = 0 ifTrue: [ ^ self ].

	(biomass = 1 or: [ biomass = 2 ]) ifTrue: [
		harvestedBiomass := biomass.
		self cell biomass: self cell biomass - biomass.
		^ self ].
	harvestedBiomass := harvestedBiomass + 2.
	self cell biomass: self cell biomass - 2
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
        tile: (PCTileset pieces at: self group colorSymbol)
        size: 0.5
]
