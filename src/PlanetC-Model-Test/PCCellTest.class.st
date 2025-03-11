Class {
	#name : 'PCCellTest',
	#superclass : 'TestCase',
	#instVars : [
		'model',
		'cell',
		'harvester',
		'harvester2',
		'harvester3'
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
	harvester2 := model newEntity: PCHarvester.
	harvester3 := model newEntity: PCHarvester.
]

{ #category : 'tests' }
PCCellTest >> tearDown [

	harvester initialize.
	harvester2 initialize.
	harvester3 initialize.
	super tearDown.
]

{ #category : 'tests' }
PCCellTest >> testBiomass [ 
	
	cell biomass: 2.
	
	self assert: cell biomass equals: 2.
]

{ #category : 'tests' }
PCCellTest >> testCollectingOfOneBiomass [

	cell biomass: 1.
	harvester moveTo: cell.
	harvester collectBiomass.
	self assert: harvester harvestedBiomass equals: 1.
]

{ #category : 'tests' }
PCCellTest >> testCollectingOfOneBiomassThreeHarvesters [

	cell biomass: 1.
	harvester moveTo: cell.
	harvester2 moveTo: cell.
	harvester3 moveTo: cell.
	harvester collectBiomass.
	harvester2 collectBiomass.
	harvester3 collectBiomass.

	self assert: harvester harvestedBiomass equals: 1.
	self assert: harvester2 harvestedBiomass equals: 0.
	self assert: harvester3 harvestedBiomass equals: 0.
]

{ #category : 'tests' }
PCCellTest >> testCollectingOfOneBiomassTwoHarvesters [

	cell biomass: 1.
	harvester moveTo: cell.
	harvester2 moveTo: cell.
	harvester collectBiomass.
	harvester2 collectBiomass.

	self assert: harvester harvestedBiomass equals: 1.
	self assert: harvester2 harvestedBiomass equals: 0.
]

{ #category : 'tests' }
PCCellTest >> testCollectingOfThreeBiomass [

	cell biomass: 3.
	harvester moveTo: cell.
	harvester collectBiomass.
	self assert: harvester harvestedBiomass equals: 2.
]

{ #category : 'tests' }
PCCellTest >> testCollectingOfThreeBiomassThreeHarvesters [

	cell biomass: 3.
	harvester moveTo: cell.
	harvester2 moveTo: cell.
	harvester3 moveTo: cell.
	harvester collectBiomass.
	harvester2 collectBiomass.
	harvester3 collectBiomass.

	self assert: harvester harvestedBiomass equals: 2.
	self assert: harvester2 harvestedBiomass equals: 1.
	self assert: harvester3 harvestedBiomass equals: 0.
]

{ #category : 'tests' }
PCCellTest >> testCollectingOfThreeBiomassTwoHarvesters [

	cell biomass: 3.
	harvester moveTo: cell.
	harvester2 moveTo: cell.
	harvester collectBiomass.
	harvester2 collectBiomass.

	self assert: harvester harvestedBiomass equals: 2.
	self assert: harvester2 harvestedBiomass equals: 1.
]

{ #category : 'tests' }
PCCellTest >> testCollectingOfTwoBiomass [

	cell biomass: 2.
	harvester moveTo: cell.
	harvester collectBiomass.
	self assert: harvester harvestedBiomass equals: 2.
]

{ #category : 'tests' }
PCCellTest >> testCollectingOfTwoBiomassThreeHarvesters [

	cell biomass: 2.
	harvester moveTo: cell.
	harvester2 moveTo: cell.
	harvester3 moveTo: cell.
	harvester collectBiomass.
	harvester2 collectBiomass.
	harvester3 collectBiomass.

	self assert: harvester harvestedBiomass equals: 2.
	self assert: harvester2 harvestedBiomass equals: 0.
	self assert: harvester3 harvestedBiomass equals: 0.
]

{ #category : 'tests' }
PCCellTest >> testCollectingOfTwoBiomassTwoHarvesters [

	cell biomass: 2.
	harvester moveTo: cell.
	harvester2 moveTo: cell.
	harvester collectBiomass.
	harvester2 collectBiomass.

	self assert: harvester harvestedBiomass equals: 2.
	self assert: harvester2 harvestedBiomass equals: 0.
]

{ #category : 'tests' }
PCCellTest >> testCollectingOfZeroBiomass [

	cell biomass: 0.
	harvester moveTo: cell.
	harvester collectBiomass.
	self assert: harvester harvestedBiomass equals: 0.
]

{ #category : 'tests' }
PCCellTest >> testCollectingOfZeroBiomassThreeHarvesters [

	cell biomass: 0.
	harvester moveTo: cell.
	harvester2 moveTo: cell.
	harvester3 moveTo: cell.
	harvester collectBiomass.
	harvester2 collectBiomass.
	harvester3 collectBiomass.

	self assert: harvester harvestedBiomass equals: 0.
	self assert: harvester2 harvestedBiomass equals: 0.
	self assert: harvester3 harvestedBiomass equals: 0.
]

{ #category : 'tests' }
PCCellTest >> testCollectingOfZeroBiomassTwoHarvesters [

	cell biomass: 0.
	harvester moveTo: cell.
	harvester2 moveTo: cell.
	harvester collectBiomass.
	harvester2 collectBiomass.
	self assert: harvester harvestedBiomass equals: 0.
	self assert: harvester2 harvestedBiomass equals: 0.
]

{ #category : 'tests' }
PCCellTest >> testDoubleStep [

	cell
		biomass: 3;
		step;
		step.
	self
		assert: cell biomass equals: 3;
		assert: cell numberOfNewborns equals: 2;
		assert: cell unvisitedCounter equals: 2
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
PCCellTest >> testProgressionOfThreeBiomass [

	cell biomass: 3.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassAndOneHarvester [
	
	harvester moveTo: cell.
	cell biomass: 3.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassAndOneHarvesterDoubleStep [
	
	harvester moveTo: cell.
	cell biomass: 3.
	cell step.
	cell step.

	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassAndOneHarvesterQuadrupleStep [
	
	harvester moveTo: cell.
	cell biomass: 3.
	cell step.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassAndOneHarvesterQuintupleStep [
	
	harvester moveTo: cell.
	cell biomass: 3.
	5 timesRepeat: [ cell step ].
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassAndOneHarvesterTripleStep [

	harvester moveTo: cell.
	cell biomass: 3.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassAndTwoHarvester [

	harvester moveTo: cell.
	harvester2 moveTo: cell.
	cell biomass: 3.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassAndTwoHarvesterDoubleStep [

	harvester moveTo: cell.
	harvester2 moveTo: cell.
	cell biomass: 3.
	cell step.
	cell step.

	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassAndTwoHarvesterQuadrupleStep [

	harvester moveTo: cell.
	harvester2 moveTo: cell.
	cell biomass: 3.
	cell step.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassAndTwoHarvesterQuintupleStep [

	harvester moveTo: cell.
	harvester2 moveTo: cell.
	cell biomass: 3.
	5 timesRepeat: [ cell step ].
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassAndTwoHarvesterTripleStep [

	harvester moveTo: cell.
	harvester2 moveTo: cell.
	cell biomass: 3.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassDoubleStep [

	cell biomass: 3.
	cell step.
	cell step.

	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassQuadrupleStep [

	cell biomass: 3.
	cell step.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 1
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassQuintupleStep [

	cell biomass: 3.
	5 timesRepeat: [ cell step ].
	self assert: cell biomass equals: 0
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfThreeBiomassTripleStep [

	cell biomass: 3.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 2
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfTwoBiomass [

	cell biomass: 2.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfTwoBiomassAndOneHarvester [

	harvester moveTo: cell.
	cell biomass: 2.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfTwoBiomassAndOneHarvesterDoubleStep [

	harvester moveTo: cell.
	cell biomass: 2.
	cell step.
	cell step.

	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfTwoBiomassAndOneHarvesterQuadrupleStep [

	harvester moveTo: cell.
	cell biomass: 2.
	cell step.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfTwoBiomassAndOneHarvesterQuintupleStep [

	harvester moveTo: cell.
	cell biomass: 2.
	5 timesRepeat: [ cell step ].
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfTwoBiomassAndOneHarvesterTripleStep [

	harvester moveTo: cell.
	cell biomass: 2.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfTwoBiomassDoubleStep [

	cell biomass: 2.
	cell step.
	cell step.

	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfTwoBiomassQuadrupleStep [

	cell biomass: 2.
	cell step.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 1
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfTwoBiomassQuintupleStep [

	cell biomass: 2.
	5 timesRepeat: [ cell step ].
	self assert: cell biomass equals: 0
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfTwoBiomassTripleStep [

	cell biomass: 2.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 2
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfZeroBiomass [

	cell biomass: 0.
	cell step.
	self assert: cell biomass equals: 1
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfZeroBiomassAndOneHarvester [
	
	harvester moveTo: cell.
	cell biomass: 0.
	cell step.
	self assert: cell biomass equals: 1
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfZeroBiomassAndOneHarvesterDoubleStep [

	harvester moveTo: cell.
	cell biomass: 0.
	cell step.
	cell step.

	self assert: cell biomass equals: 2
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfZeroBiomassAndOneHarvesterTripleStep [
	
	harvester moveTo: cell.
	cell biomass: 0.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfZeroBiomassDoubleStep [

	cell biomass: 0.
	cell step.
	cell step.

	self assert: cell biomass equals: 1
]

{ #category : 'tests' }
PCCellTest >> testProgressionOfZeroBiomassTripleStep [

	cell biomass: 0.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 0
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
	1 to: 5 do: [ :tmp1 | cell step ].
	1.
	self
		assert: cell biomass equals: 3;
		assert: cell numberOfNewborns equals: 0;
		assert: cell unvisitedCounter equals: 0
]

{ #category : 'tests' }
PCCellTest >> testTripleStep [

	cell
		biomass: 3;
		step;
		step;
		step.
	self
		assert: cell biomass equals: 2;
		assert: cell numberOfNewborns equals: 2;
		assert: cell unvisitedCounter equals: 3
]

{ #category : 'tests' }
PCCellTest >> testUpdateNewbornBirdsHighBiomass [

	cell
		biomass: 3;
		updateNewbornBirds.
	self assert: cell numberOfNewborns equals: 2
]

{ #category : 'tests' }
PCCellTest >> testUpdateNewbornBirdsLowBiomass [

	cell
		biomass: 0;
		updateNewbornBirds.
	self assert: cell numberOfNewborns equals: 0
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
