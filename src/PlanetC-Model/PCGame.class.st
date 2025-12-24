Class {
	#name : 'PCGame',
	#superclass : 'CMGame',
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'running' }
PCGame >> runStep [

	'Stepping from Planet C!' traceCr.
	super runStep
]
