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
	model class numberOfFamilies: self numberOfFamilies.

	model randomSeed: 13.
	model initStandard.
]

{ #category : 'accessing' }
PCModelFixture >> model [

	^ model
]

{ #category : 'accessing' }
PCModelFixture >> numberOfFamilies [

	self subclassResponsibility.
]

{ #category : 'inspecting' }
PCModelFixture >> openGrid [

	| builder |
	builder := CMR3SpaceDiagramBuilder new
		           cormasModel: model;
		           asPresenter.

	builder open
]
