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

{ #category : 'tests' }
PCModelTest >> testCells [
	
	self assert: model cells class equals: OrderedCollection.
]

{ #category : 'tests' }
PCModelTest >> testHarvesters [
	
	self assert: model harvesters class equals: OrderedCollection.
]

{ #category : 'tests' }
PCModelTest >> testInitialize [ 

	 self assert: model cells isNotEmpty.
   self assert: model harvesters isEmpty.
	"fix isEmpty"
]
