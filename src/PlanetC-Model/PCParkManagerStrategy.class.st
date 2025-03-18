Class {
	#name : 'PCParkManagerStrategy',
	#superclass : 'Object',
	#instVars : [
		'cells',
		'parkManager'
	],
	#category : 'PlanetC-Model-Strategies',
	#package : 'PlanetC-Model',
	#tag : 'Strategies'
}

{ #category : 'accessing' }
PCParkManagerStrategy >> cells: aCollection [

	cells := aCollection
]

{ #category : 'accessing' }
PCParkManagerStrategy >> parkManager: aParkManager [

	parkManager := aParkManager.
]

{ #category : 'accessing' }
PCParkManagerStrategy >> protectCells [
	
	^ self subclassResponsibility.
]
