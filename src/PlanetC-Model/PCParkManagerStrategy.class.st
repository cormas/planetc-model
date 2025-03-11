Class {
	#name : 'PCParkManagerStrategy',
	#superclass : 'Object',
	#instVars : [
		'cells',
		'parkManager'
	],
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
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
PCParkManagerStrategy >> sendParkManager [
	
	^ self subclassResponsibility.
]

{ #category : 'accessing' }
PCParkManagerStrategy >> unprotectOldCells [

	| protectedCells |
	protectedCells :=  cells select: [ :cell | cell isProtected = 1 ].
	protectedCells do: [ :cell | cell setProtected: 0 ].
	
]
