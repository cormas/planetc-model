Class {
	#name : 'PCModelFixture',
	#superclass : 'Object',
	#instVars : [
		'model'
	],
	#category : 'PlanetC-Model-Test',
	#package : 'PlanetC-Model-Test'
}

{ #category : 'public - layout' }
PCModelFixture >> cell [

	^ model cellAt: 2 at: 3.
]

{ #category : 'public - layout' }
PCModelFixture >> family1 [

	^ model families first
]

{ #category : 'public - layout' }
PCModelFixture >> family2 [

	^ model families second
]

{ #category : 'public - layout' }
PCModelFixture >> harvester1 [

	^ model harvesters first
]

{ #category : 'public - layout' }
PCModelFixture >> harvester2 [

	^ model harvesters second
]

{ #category : 'public - layout' }
PCModelFixture >> harvester3 [

	^ model harvesters third
]

{ #category : 'initialization' }
PCModelFixture >> initialize [

	super initialize.

	model := PCModel new.
	model randomSeed: 13.
	self initializeGrid.

	model createN: 3 entity: PCHarvester.
	model createN: 2 entity: PCFamily.

	"self harvester1 moveTo: self cell.
	self harvester2 moveTo: self cell.
	self harvester3 moveTo: self cell."

	self family1 addChild: self harvester1.
	self family2 addChildren: {
			self harvester2.
			self harvester3 }.

	self family1
		initializeCells: model cells
		strategyClass: PCLowBiomassStrategy.
	self family2
		initializeCells: model cells
		strategyClass: PCHighBiomassStrategy.

	self family1 colorSymbol: #red.
	self family2 colorSymbol: #blue
]

{ #category : 'initialization' }
PCModelFixture >> initializeGrid [

	model
		createGridNumberOfRows: 4
		numberOfColumns: 5
		neighbourhood: 8
		closed: true
]

{ #category : 'accessing' }
PCModelFixture >> model [

	^ model
]

{ #category : 'inspecting' }
PCModelFixture >> openGrid [

	<script: 'self new openGrid'>
	| builder |
	builder := CMR3SpaceDiagramBuilder new
		           cormasModel: model;
		           asPresenter.

	builder open
]

{ #category : 'inspecting' }
PCModelFixture >> openInspector [

	<script: 'self new openInspector'>
	self inspect
]
