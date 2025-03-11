Class {
	#name : 'PCModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'cells',
		'harvesters',
		'families',
		'parkManager'
	],
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'as yet unclassified' }
PCModel class >> aboutThisModel [

	^ ''
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
		createGridNumberOfRows: 4
		numberOfColumns: 5
		neighbourhood: 8
		closed: true.

	self initializeCellImages.
	self initializeFamiliesAndHarvesters.
	self initializeParkManager.

	"harvesters do: [ :harvester | harvester moveTo: self pickRandomCell ]"
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
PCModel >> initializeCellImages [

	cells withIndexDo: [ :cell :index | 
		cell useImage: (PCImages cells at: index) ]
]

{ #category : 'initialization' }
PCModel >> initializeFamiliesAndHarvesters [

	| family harvester |
	PCFamily availableColors do: [ :colorSymbol |
		family := self newEntity: PCFamily.
		family colorSymbol: colorSymbol.
		family initializeCells: cells strategyClass: self randomHarvesterStrategyClass.

		1 to: 4 do: [ :i |
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
