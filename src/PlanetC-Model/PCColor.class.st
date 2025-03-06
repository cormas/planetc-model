Class {
	#name : 'PCColor',
	#superclass : 'Object',
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'as yet unclassified' }
PCColor class >> biomass0 [
	<script: 'self biomass0 inspect'>
	^ Color fromHexString: 'FFFDF1'
]

{ #category : 'as yet unclassified' }
PCColor class >> biomass1 [
	<script: 'self biomass1 inspect'>
	^ Color fromHexString: 'BCEAC8'
]

{ #category : 'as yet unclassified' }
PCColor class >> biomass2 [
	<script: 'self biomass2 inspect'>
	^ Color fromHexString: '61C38D'
]

{ #category : 'as yet unclassified' }
PCColor class >> biomass3 [
	<script: 'self biomass3 inspect'>
	^ Color fromHexString: '258C60'
]

{ #category : 'as yet unclassified' }
PCColor class >> biomassColors [
	<script: 'self biomassColors inspect'>
	^ { self biomass0 . self biomass1 . self biomass2 . self biomass3 }
]

{ #category : 'as yet unclassified' }
PCColor class >> bluePiece [
	<script: 'self bluePiece inspect'>
	^ Color blue
]

{ #category : 'as yet unclassified' }
PCColor class >> greenPiece [
	<script: 'self greenPiece inspect'>
	^ Color green
]

{ #category : 'accessing' }
PCColor class >> pieces [
	<script: 'self pieces inspect'>
	^ { 
		#red -> self redPiece .
		#green -> self greenPiece .
		#blue -> self bluePiece .
		#yellow -> self yellowPiece .
		#pink -> self pinkPiece .
	} asDictionary
]

{ #category : 'as yet unclassified' }
PCColor class >> pinkPiece [
	<script: 'self pinkPiece inspect'>
	^ Color pink
]

{ #category : 'as yet unclassified' }
PCColor class >> redPiece [
	<script: 'self redPiece inspect'>
	^ Color red
]

{ #category : 'as yet unclassified' }
PCColor class >> yellowPiece [
	<script: 'self yellowPiece inspect'>
	^ Color yellow
]
