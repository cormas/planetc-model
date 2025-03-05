Class {
	#name : 'PCModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'cells',
		'harvesters'
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
PCModel >> harvesters [
	<getterFor: #PCHarvester >
	^ harvesters 
]

{ #category : 'initialization' }
PCModel >> initStandard [
	<init>
	self createGridNumberOfRows: 4 
		numberOfColumns: 5 
		neighbourhood: 8 
		closed: true.
		
	self initializeCellImages.
	self createN: 2 randomlyLocatedAloneEntities: PCHarvester.
]

{ #category : 'initialization' }
PCModel >> initialize [ 
	super initialize.
	cells := OrderedCollection new.
	harvesters := OrderedCollection new
]

{ #category : 'initialization' }
PCModel >> initializeCellImages [

	cells withIndexDo: [ :cell :index | 
		cell useImage: (PCImages cells at: index) ]
]

{ #category : 'initialization' }
PCModel >> open [ 

	| builder |
	builder := CMR3SpaceDiagramBuilder new
		cormasModel: self;
		asPresenter.
	
	builder open.
]

{ #category : 'initialization' }
PCModel >> step [ 
	<control>
	
	self cells do: [:cell | cell step].
	self harvesters do: [:harvester | harvester step ].
]
