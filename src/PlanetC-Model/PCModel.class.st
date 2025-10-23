Class {
	#name : 'PCModel',
	#superclass : 'CMAbstractModel',
	#classInstVars : [
		'numberOfFamilies'
	],
	#category : 'PlanetC-Model-Model',
	#package : 'PlanetC-Model',
	#tag : 'Model'
}

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

{ #category : 'model - metadata' }
PCModel class >> modelName [

	^ 'Planet C'
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
PCModel >> families [

	^ self @@ PCFamily
]

{ #category : 'accessing' }
PCModel >> harvesters [

	^ self @@ PCHarvester
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
	self initializeParkManager.
	
	PCCell activePovSelector: #povBoard.
	PCHarvester activePovSelector: #povImage
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
PCModel >> initializeBiomass [

	self initializeBiomassFromArray: self class initialBiomassArray 
]

{ #category : 'initialization' }
PCModel >> initializeBiomassFromArray: aCollection [

	aCollection withIndexDo: [ :number :i |
		(self cells at: i) biomass: number ]
]

{ #category : 'initialization' }
PCModel >> initializeCellImages [

	self cells withIndexDo: [ :cell :index | 
		cell useImage: (PCTileset cells at: index) ]
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
			initializeCells: self cells
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
		initializeCells: self cells
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

	^ self parkManagers first
]

{ #category : 'accessing' }
PCModel >> parkManagers [

	^ self @@ PCParkManager
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
	^ self cells sum: [ :cell | cell biomass ]
]

{ #category : 'probes' }
PCModel >> totalHarvest [

	<probeNamed: 'Total harvest' color: 'B90E0A'>
	^ self harvesters sum: [ :harvester | harvester harvestedBiomass ]
]

{ #category : 'as yet unclassified' }
PCModel >> unprotectCells [

	self cells do: [ :cell | cell makeNotProtected ]
]
