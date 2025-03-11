Class {
	#name : 'PCParkManager',
	#superclass : 'CMAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'as yet unclassified' }
PCParkManager >> pov [
    <pov>
    ^ CMPointOfView
        color: CMColor blue
        shape: #star
        size: 0.6
]

{ #category : 'as yet unclassified' }
PCParkManager >> protectCells [
]
