Class {
	#name : 'PCModelTest',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'PlanetC-Model-Test',
	#package : 'PlanetC-Model-Test'
}

{ #category : 'running' }
PCModelTest >> setUp [

	super setUp.
	model := PCModel new.
	
	model 
		createGridNumberOfRows: 4 
		numberOfColumns: 5 
		neighbourhood: 8 
		closed: true.
]
