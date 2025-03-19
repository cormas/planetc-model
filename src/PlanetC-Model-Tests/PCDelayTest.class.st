Class {
	#name : 'PCDelayTest',
	#superclass : 'TestCase',
	#instVars : [
		'timer'
	],
	#category : 'PlanetC-Model-Tests',
	#package : 'PlanetC-Model-Tests'
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
