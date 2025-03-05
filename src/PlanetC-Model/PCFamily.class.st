Class {
	#name : 'PCFamily',
	#superclass : 'CMAgentGroup',
	#instVars : [
		'colorSymbol'
	],
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'as yet unclassified' }
PCFamily class >> availableColors [

	^ { #red . #green . #blue . #yellow . #pink }
]

{ #category : 'accessing' }
PCFamily >> colorSymbol [

	^ colorSymbol
]

{ #category : 'accessing' }
PCFamily >> colorSymbol: aSymbol [

	colorSymbol := aSymbol
]
