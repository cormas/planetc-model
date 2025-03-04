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
