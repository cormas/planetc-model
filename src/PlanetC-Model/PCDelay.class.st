Class {
	#name : 'PCDelay',
	#superclass : 'Object',
	#instVars : [
		'duration',
		'workingAgents',
		'isTimerActive'
	],
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'accessing' }
PCDelay >> completeForAgent: anAgent [
	
	workingAgents removeAllSuchThat: [ :agents | agents = anAgent ].
]

{ #category : 'accessing' }
PCDelay >> duration [
	
	^ duration
]

{ #category : 'accessing' }
PCDelay >> duration: aDuration [

	duration := aDuration
]

{ #category : 'accessing' }
PCDelay >> employAgent: anAgent [

	workingAgents add: anAgent. 
]

{ #category : 'accessing' }
PCDelay >> initialize [ 
	
	super initialize.
	duration := 0.
	workingAgents := OrderedCollection new.
	
]

{ #category : 'accessing' }
PCDelay >> start [

	isTimerActive := true.
	[[ duration > 0 and: isTimerActive ] whileTrue: [
		1 second wait.
		duration traceCr.
		self duration: duration - 1 ]] fork
]

{ #category : 'accessing' }
PCDelay >> stop [

	[isTimerActive := false] fork.
]
