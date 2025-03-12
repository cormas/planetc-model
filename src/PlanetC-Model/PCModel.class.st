Class {
	#name : 'PCModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'cells',
		'harvesters',
		'families',
		'parkManager'
	],
	#classInstVars : [
		'numberOfFamilies'
	],
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'as yet unclassified' }
PCModel class >> aboutThisModel [

	^ ''
]

{ #category : 'as yet unclassified' }
PCModel class >> initialBiomassArray [

	^ #( 
		1 1 2 1 1 
		2 0 2 3 2
		1 3 1 2 1
		1 3 1 0 2 )
]

{ #category : 'as yet unclassified' }
PCModel class >> initializeParameters [ 

	super initializeParameters.
	numberOfFamilies := 5.
]

{ #category : 'accessing' }
PCModel class >> numberOfColumns [

	^ 5
]

{ #category : 'accessing' }
PCModel class >> numberOfFamilies [

	^ numberOfFamilies
]

{ #category : 'accessing' }
PCModel class >> numberOfFamilies: anObject [

	numberOfFamilies := anObject
]

{ #category : 'accessing' }
PCModel class >> numberOfRows [

	^ 4
]

{ #category : 'as yet unclassified' }
PCModel class >> prefix [

	^ 'PC'
]

{ #category : 'initialization' }
PCModel >> cells [ 
	<getterFor: #PCCell >
	^ cells 
]

{ #category : 'initialization' }
PCModel >> families [
	<getterFor: #PCFamily >
	^ families 
]

{ #category : 'initialization' }
PCModel >> harvesters [
	<getterFor: #PCHarvester >
	^ harvesters 
]

{ #category : 'initialization' }
PCModel >> initStandard [

	<init>
	self
		createGridNumberOfRows: self class numberOfRows
		numberOfColumns: self class numberOfColumns
		neighbourhood: 8
		closed: true.
		
	self initializeBiomass.
	self initializeCellImages.
	self initializeFamiliesAndHarvesters.
	self initializeParkManager
]

{ #category : 'initialization' }
PCModel >> initStandardPlusBases [

	<init>
	self
		createGridNumberOfRows: 6
		numberOfColumns: 7
		neighbourhood: 8
		closed: true.

	self initializeCellImages.
	self initializeFamiliesAndHarvesters.
	self initializeParkManager
]

{ #category : 'initialization' }
PCModel >> initialize [

	super initialize.
	cells := OrderedCollection new.
	harvesters := OrderedCollection new.
	families := OrderedCollection new.
	parkManager := OrderedCollection new.
]

{ #category : 'initialization' }
PCModel >> initializeBiomass [

	self initializeBiomassFromArray: self class initialBiomassArray 
]

{ #category : 'initialization' }
PCModel >> initializeBiomassFromArray: aCollection [

	aCollection withIndexDo: [ :number :i |
		(cells at: i) biomass: number ]
]

{ #category : 'initialization' }
PCModel >> initializeCellImages [

	cells withIndexDo: [ :cell :index | 
		cell useImage: (PCImages cells at: index) ]
]

{ #category : 'initialization' }
PCModel >> initializeFamiliesAndHarvesters [

	| family harvester colorSymbol harvestersPerFamily |
	
	harvestersPerFamily := 20 / self class numberOfFamilies. 
	
	1 to: self class numberOfFamilies do: [ :i |
		colorSymbol := PCFamily availableColors at: i.
		family := self newEntity: PCFamily.
		family colorSymbol: colorSymbol.
		family
			initializeCells: cells
			strategyClass: self randomHarvesterStrategyClass.

		1 to: harvestersPerFamily do: [ :j |
			harvester := self newEntity: PCHarvester.
			family addChild: harvester ] ]
]

{ #category : 'initialization' }
PCModel >> initializeParkManager [

	| newParkManager |
	newParkManager := self newEntity: PCParkManager.
	newParkManager
		initializeCells: cells
		strategyClass: self randomParkManagerStrategyClass 
]

{ #category : 'initialization' }
PCModel >> open [

	| tmp1 tmp2 |
	tmp2 := CMR3SpaceDiagramBuilder new.
	tmp2 cormasModel: self.
	tmp1 := tmp2 asPresenter.
	tmp1 open
]

{ #category : 'initialization' }
PCModel >> parkManager [
	<getterFor: #PCParkManager>
	^ parkManager 
]

{ #category : 'as yet unclassified' }
PCModel >> randomHarvesterStrategyClass [

	^ self selectRandomlyFrom: PCHarvesterStrategy subclasses
]

{ #category : 'as yet unclassified' }
PCModel >> randomParkManagerStrategyClass [

	^ self selectRandomlyFrom: PCParkManagerStrategy subclasses
]

{ #category : 'initialization' }
PCModel >> step [

	<control>
	self cells do: [ :cell | cell step ].
	self families do: [ :family | family step ].
	self parkManager do: [ :pManager | pManager step ].
]

{ #category : 'probes' }
PCModel >> totalBiomass [

	<probeNamed: 'Total biomass' color: '61C38D'>
	^ cells sum: [ :cell | cell biomass ]
]

{ #category : 'probes' }
PCModel >> totalHarvest [

	<probeNamed: 'Total harvest' color: 'B90E0A'>
		
	^ harvesters sum: [ :harvester | harvester harvestedBiomass ]
]
