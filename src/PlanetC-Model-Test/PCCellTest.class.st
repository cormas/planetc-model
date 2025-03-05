Class {
	#name : 'PCCellTest',
	#superclass : 'TestCase',
	#instVars : [
		'model',
		'cell',
		'harvester'
	],
	#category : 'PlanetC-Model-Test',
	#package : 'PlanetC-Model-Test'
}

{ #category : 'running' }
PCCellTest >> setUp [

	super setUp.
	model := PCModel new.
	model randomSeed: 13.
	model 
		createGridNumberOfRows: 4 
		numberOfColumns: 5 
		neighbourhood: 8 
		closed: true.
		
	cell := model cellAt: 2 at: 3.
	harvester := model newEntity: PCHarvester.

	
	
]

{ #category : 'tests' }
PCCellTest >> tearDown [ 

	super tearDown. 
]

{ #category : 'tests' }
PCCellTest >> testBiomass [ 
	
	cell biomass: 2.
	
	self assert: cell biomass equals: 2.
]

{ #category : 'tests' }
PCCellTest >> testDoubleStep [ 
	
	cell biomass: 3.
	cell step.
	cell step.
	
	self assert: cell biomass equals: 3.
	self assert: cell numberOfNewborns equals: 2.
	self assert: cell unvisitedCounter equals: 2.

]

{ #category : 'tests' }
PCCellTest >> testInitialize [

	self assert: ((cell biomass >= 0) and: (cell biomass <= 3)).
	self assert: cell numberOfNewborns equals: 0.
	self assert: cell unvisitedCounter equals: 0.
	
]

{ #category : 'tests' }
PCCellTest >> testNumberOfNewborns [

	self assert: cell numberOfNewborns equals: 0.
	
]

{ #category : 'tests' }
PCCellTest >> testPov [ 

	self assert: cell pov class equals: CMPointOfView 
]

{ #category : 'tests' }
PCCellTest >> testStep [ 
	
	cell biomass: 3.
	cell step.
	
	self assert: cell biomass equals: 3.
	self assert: cell numberOfNewborns equals: 2.
	self assert: cell unvisitedCounter equals: 1.

]

{ #category : 'tests' }
PCCellTest >> testStepWithHarvester [
	
	harvester moveTo: cell.
	cell biomass: 3.
	5 timesRepeat: [cell step].

	self assert: cell biomass equals: 3.
	self assert: cell numberOfNewborns equals: 0.
	self assert: cell unvisitedCounter equals: 0.

]

{ #category : 'tests' }
PCCellTest >> testTripleStep [ 
	
	cell biomass: 3.
	cell step.
	cell step.
	cell step.
	
	self assert: cell biomass equals: 2.
	self assert: cell numberOfNewborns equals: 2.
	self assert: cell unvisitedCounter equals: 3.

]

{ #category : 'tests' }
PCCellTest >> testUpdateNewbornBirdsHighBiomass [
	
	cell biomass: 3.
	cell updateNewbornBirds.
	self assert: cell numberOfNewborns equals: 2.
	
]

{ #category : 'tests' }
PCCellTest >> testUpdateNewbornBirdsLowBiomass [
	
	cell biomass: 0.
	cell updateNewbornBirds.
	self assert: cell numberOfNewborns equals: 0.
	
]

{ #category : 'tests' }
PCCellTest >> testUpdateNewbornBirdsWithHarvester [
	
	harvester moveTo: cell.
	cell updateNewbornBirds.
	self assert: cell numberOfNewborns equals: 0.
	
]

{ #category : 'tests' }
PCCellTest >> testUpdateUnvisitedCounter [

	cell updateUnvisitedCounter.
	
	self assert: cell unvisitedCounter equals: 1.
]
