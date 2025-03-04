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
PCHarvester >> harvestedBiomes [
	^ harvestedBiomes 
]

{ #category : 'initialization' }
PCHarvester >> initialize [ 
]

{ #category : 'initialization' }
PCHarvester >> pov [
    <pov>
    ^ CMPointOfView
        color: CMColor blue
        shape: #star
        size: 0.6
]
