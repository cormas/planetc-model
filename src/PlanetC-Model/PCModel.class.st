Class {
	#name : 'PCModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'cells',
		'harvesters',
		'families',
		'parkManagers'
	],
	#classInstVars : [
		'numberOfFamilies'
	],
	#category : 'PlanetC-Model-Model',
	#package : 'PlanetC-Model',
	#tag : 'Model'
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

{ #category : 'accessing' }
PCModel >> cells [ 
	<getterFor: #PCCell >
	^ cells 
]

{ #category : 'accessing' }
PCModel >> families [
	<getterFor: #PCFamily >
	^ families 
]

{ #category : 'accessing' }
PCModel >> harvesters [
	<getterFor: #PCHarvester >
	^ harvesters 
]

{ #category : 'init' }
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

{ #category : 'init' }
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
	parkManagers := OrderedCollection new.
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

{ #category : 'as yet unclassified' }
PCModel >> open [

	| tmp1 tmp2 |
	tmp2 := CMR3SpaceDiagramBuilder new.
	tmp2 cormasModel: self.
	tmp1 := tmp2 asPresenter.
	tmp1 open
]

{ #category : 'accessing' }
PCModel >> parkManager [

	^ parkManagers first
]

{ #category : 'accessing' }
PCModel >> parkManagers [
	<getterFor: #PCParkManager>
	^ parkManagers 
]

{ #category : 'as yet unclassified' }
PCModel >> randomHarvesterStrategyClass [

	^ self selectRandomlyFrom: PCFamilyStrategy subclasses
]

{ #category : 'as yet unclassified' }
PCModel >> randomParkManagerStrategyClass [

	^ self selectRandomlyFrom: PCParkManagerStrategy subclasses
]

{ #category : 'control' }
PCModel >> step [

	<control>
	self unprotectCells.
	self cells do: [ :cell | cell step ].
	self families do: [ :family | family sendHarvesters ].
	self families do: [ :family | family collectBiomass ].
	self parkManager protectCells.
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

{ #category : 'as yet unclassified' }
PCModel >> unprotectCells [

	cells do: [ :cell | cell makeNotProtected ]
]
