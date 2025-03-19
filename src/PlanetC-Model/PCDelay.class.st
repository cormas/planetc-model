Class {
	#name : 'PCDelay',
	#superclass : 'Object',
	#instVars : [
		'duration',
		'workingAgents',
		'isTimerActive'
	],
	#category : 'PlanetC-Model-Model',
	#package : 'PlanetC-Model',
	#tag : 'Model'
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
	[ duration > 0 and: isTimerActive ] whileTrue: [
		(Delay forSeconds: 1) wait.
		duration := duration - 1 ] fork.
]

{ #category : 'accessing' }
PCDelay >> stop [

	isTimerActive := false.
	
]
