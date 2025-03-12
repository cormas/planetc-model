Class {
	#name : 'PCRegularModelTest',
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
PCRegularModelTest >> setUp [

	| fixture |
	super setUp.

	fixture := PCFiveFamiliesModelFixture new.

	model := fixture model.
	cell := fixture cell.
	harvester := fixture harvester1.
	harvester2 := fixture harvester2.
	harvester3 := fixture harvester3
]

{ #category : 'tests' }
PCRegularModelTest >> testBiomass [ 
	
	cell biomass: 2.
	
	self assert: cell biomass equals: 2.
]

{ #category : 'tests' }
PCRegularModelTest >> testCollectBiomassInCorrectOrder [

	cell biomass: 3.

	model step.

	self assert: harvester harvestedBiomass equals: 2.
	self assert: harvester2 harvestedBiomass equals: 1
]

{ #category : 'tests' }
PCRegularModelTest >> testCollectingOfOneBiomass [

	cell biomass: 1.
	harvester moveTo: cell.
	harvester collectBiomass.
	self assert: harvester harvestedBiomass equals: 1.
]

{ #category : 'tests' }
PCRegularModelTest >> testCollectingOfOneBiomassThreeHarvesters [

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
PCRegularModelTest >> testCollectingOfOneBiomassTwoHarvesters [

	cell biomass: 1.
	harvester moveTo: cell.
	harvester2 moveTo: cell.
	harvester collectBiomass.
	harvester2 collectBiomass.

	self assert: harvester harvestedBiomass equals: 1.
	self assert: harvester2 harvestedBiomass equals: 0.
]

{ #category : 'tests' }
PCRegularModelTest >> testCollectingOfThreeBiomass [

	cell biomass: 3.
	harvester moveTo: cell.
	harvester collectBiomass.
	self assert: harvester harvestedBiomass equals: 2.
]

{ #category : 'tests' }
PCRegularModelTest >> testCollectingOfThreeBiomassThreeHarvesters [

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
PCRegularModelTest >> testCollectingOfThreeBiomassTwoHarvesters [

	cell biomass: 3.
	harvester moveTo: cell.
	harvester2 moveTo: cell.
	harvester collectBiomass.
	harvester2 collectBiomass.

	self assert: harvester harvestedBiomass equals: 2.
	self assert: harvester2 harvestedBiomass equals: 1.
]

{ #category : 'tests' }
PCRegularModelTest >> testCollectingOfTwoBiomass [

	cell biomass: 2.
	harvester moveTo: cell.
	harvester collectBiomass.
	self assert: harvester harvestedBiomass equals: 2.
]

{ #category : 'tests' }
PCRegularModelTest >> testCollectingOfTwoBiomassThreeHarvesters [

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
PCRegularModelTest >> testCollectingOfTwoBiomassTwoHarvesters [

	cell biomass: 2.
	harvester moveTo: cell.
	harvester2 moveTo: cell.
	harvester collectBiomass.
	harvester2 collectBiomass.

	self assert: harvester harvestedBiomass equals: 2.
	self assert: harvester2 harvestedBiomass equals: 0.
]

{ #category : 'tests' }
PCRegularModelTest >> testCollectingOfZeroBiomass [

	cell biomass: 0.
	harvester moveTo: cell.
	harvester collectBiomass.
	self assert: harvester harvestedBiomass equals: 0.
]

{ #category : 'tests' }
PCRegularModelTest >> testCollectingOfZeroBiomassThreeHarvesters [

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
PCRegularModelTest >> testCollectingOfZeroBiomassTwoHarvesters [

	cell biomass: 0.
	harvester moveTo: cell.
	harvester2 moveTo: cell.
	harvester collectBiomass.
	harvester2 collectBiomass.
	self assert: harvester harvestedBiomass equals: 0.
	self assert: harvester2 harvestedBiomass equals: 0.
]

{ #category : 'tests' }
PCRegularModelTest >> testDoubleStep [

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
PCRegularModelTest >> testInitialTotalBiomassIs30 [

	self assert: model totalBiomass equals: 30
]

{ #category : 'tests' }
PCRegularModelTest >> testInitialize [

	self assert: ((cell biomass >= 0) and: (cell biomass <= 3)).
	self assert: cell numberOfNewborns equals: 0.
	self assert: cell unvisitedCounter equals: 0.
	
]

{ #category : 'tests' }
PCRegularModelTest >> testNumberOfNewborns [

	self assert: cell numberOfNewborns equals: 0.
	
]

{ #category : 'tests' }
PCRegularModelTest >> testPov [ 

	self assert: cell pov class equals: CMPointOfView 
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomass [

	cell biomass: 3.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassAndOneHarvester [
	
	harvester moveTo: cell.
	cell biomass: 3.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassAndOneHarvesterDoubleStep [
	
	harvester moveTo: cell.
	cell biomass: 3.
	cell step.
	cell step.

	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassAndOneHarvesterQuadrupleStep [
	
	harvester moveTo: cell.
	cell biomass: 3.
	cell step.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassAndOneHarvesterQuintupleStep [
	
	harvester moveTo: cell.
	cell biomass: 3.
	5 timesRepeat: [ cell step ].
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassAndOneHarvesterTripleStep [

	harvester moveTo: cell.
	cell biomass: 3.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassAndTwoHarvester [

	harvester moveTo: cell.
	harvester2 moveTo: cell.
	cell biomass: 3.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassAndTwoHarvesterDoubleStep [

	harvester moveTo: cell.
	harvester2 moveTo: cell.
	cell biomass: 3.
	cell step.
	cell step.

	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassAndTwoHarvesterQuadrupleStep [

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
PCRegularModelTest >> testProgressionOfThreeBiomassAndTwoHarvesterQuintupleStep [

	harvester moveTo: cell.
	harvester2 moveTo: cell.
	cell biomass: 3.
	5 timesRepeat: [ cell step ].
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassAndTwoHarvesterTripleStep [

	harvester moveTo: cell.
	harvester2 moveTo: cell.
	cell biomass: 3.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassDoubleStep [

	cell biomass: 3.
	cell step.
	cell step.

	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassQuadrupleStep [

	cell biomass: 3.
	cell step.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 1
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassQuintupleStep [

	cell biomass: 3.
	5 timesRepeat: [ cell step ].
	self assert: cell biomass equals: 0
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfThreeBiomassTripleStep [

	cell biomass: 3.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 2
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfTwoBiomass [

	cell biomass: 2.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfTwoBiomassAndOneHarvester [

	harvester moveTo: cell.
	cell biomass: 2.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfTwoBiomassAndOneHarvesterDoubleStep [

	harvester moveTo: cell.
	cell biomass: 2.
	cell step.
	cell step.

	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfTwoBiomassAndOneHarvesterQuadrupleStep [

	harvester moveTo: cell.
	cell biomass: 2.
	cell step.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfTwoBiomassAndOneHarvesterQuintupleStep [

	harvester moveTo: cell.
	cell biomass: 2.
	5 timesRepeat: [ cell step ].
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfTwoBiomassAndOneHarvesterTripleStep [

	harvester moveTo: cell.
	cell biomass: 2.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfTwoBiomassDoubleStep [

	cell biomass: 2.
	cell step.
	cell step.

	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfTwoBiomassQuadrupleStep [

	cell biomass: 2.
	cell step.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 1
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfTwoBiomassQuintupleStep [

	cell biomass: 2.
	5 timesRepeat: [ cell step ].
	self assert: cell biomass equals: 0
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfTwoBiomassTripleStep [

	cell biomass: 2.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 2
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfZeroBiomass [

	cell biomass: 0.
	cell step.
	self assert: cell biomass equals: 1
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfZeroBiomassAndOneHarvester [
	
	harvester moveTo: cell.
	cell biomass: 0.
	cell step.
	self assert: cell biomass equals: 1
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfZeroBiomassAndOneHarvesterDoubleStep [

	harvester moveTo: cell.
	cell biomass: 0.
	cell step.
	cell step.

	self assert: cell biomass equals: 2
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfZeroBiomassAndOneHarvesterTripleStep [
	
	harvester moveTo: cell.
	cell biomass: 0.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 3
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfZeroBiomassDoubleStep [

	cell biomass: 0.
	cell step.
	cell step.

	self assert: cell biomass equals: 1
]

{ #category : 'tests' }
PCRegularModelTest >> testProgressionOfZeroBiomassTripleStep [

	cell biomass: 0.
	cell step.
	cell step.
	cell step.
	self assert: cell biomass equals: 0
]

{ #category : 'tests' }
PCRegularModelTest >> testStep [ 
	
	cell biomass: 3.
	cell step.
	
	self assert: cell biomass equals: 3.
	self assert: cell numberOfNewborns equals: 2.
	self assert: cell unvisitedCounter equals: 1.

]

{ #category : 'tests' }
PCRegularModelTest >> testStepWithHarvester [

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
PCRegularModelTest >> testTripleStep [

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
PCRegularModelTest >> testUpdateNewbornBirdsHighBiomass [

	cell
		biomass: 3;
		updateNewbornBirds.
	self assert: cell numberOfNewborns equals: 2
]

{ #category : 'tests' }
PCRegularModelTest >> testUpdateNewbornBirdsLowBiomass [

	cell
		biomass: 0;
		updateNewbornBirds.
	self assert: cell numberOfNewborns equals: 0
]

{ #category : 'tests' }
PCRegularModelTest >> testUpdateNewbornBirdsWithHarvester [
	
	harvester moveTo: cell.
	cell updateNewbornBirds.
	self assert: cell numberOfNewborns equals: 0.
	
]

{ #category : 'tests' }
PCRegularModelTest >> testUpdateUnvisitedCounter [

	cell updateUnvisitedCounter.
	
	self assert: cell unvisitedCounter equals: 1.
]
