Class {
	#name : 'PCModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'cells',
		'harvesters',
		'families'
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

	"harvesters do: [ :harvester | harvester moveTo: self pickRandomCell ]"
]

{ #category : 'initialization' }
PCModel >> initialize [ 
	super initialize.
	cells := OrderedCollection new.
	harvesters := OrderedCollection new.
	families := OrderedCollection new.
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
		family initializeCells: cells strategyClass: self randomStrategyClass.

		1 to: 4 do: [ :i |
			harvester := self newEntity: PCHarvester.
			family addChild: harvester ] ]
]

{ #category : 'initialization' }
PCModel >> open [

	| tmp1 tmp3 |
	tmp3 := CMR3SpaceDiagramBuilder new.
	tmp3 cormasModel: self.
	tmp1 := tmp3 asPresenter.
	tmp1 open
]

{ #category : 'as yet unclassified' }
PCModel >> randomStrategyClass [

	^ self selectRandomlyFrom: PCStrategy subclasses
]

{ #category : 'initialization' }
PCModel >> step [ 
	<control>
	
	self cells do: [:cell | cell step].
	self families do: [:family | family step ].
]
