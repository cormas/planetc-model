Class {
	#name : 'PCDelayTest',
	#superclass : 'TestCase',
	#instVars : [
		'timer'
	],
	#category : 'PlanetC-Model-Test',
	#package : 'PlanetC-Model-Test'
}

{ #category : 'tests' }
PCDelayTest >> testTimer [

	timer := PCDelay new.

	timer duration: 5.

	timer start.
	(Delay forSeconds: 2) wait.
	timer stop.

	self assert: timer duration equals: 3
]
