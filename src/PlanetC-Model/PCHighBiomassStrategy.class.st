Class {
	#name : 'PCHighBiomassStrategy',
	#superclass : 'PCHarvesterStrategy',
	#category : 'PlanetC-Model',
	#package : 'PlanetC-Model'
}

{ #category : 'accessing' }
PCHighBiomassStrategy >> selectCellsWithHighBiomass [

	| maxBiomass |
	maxBiomass := (cells collect: [ :cell | cell biomass ]) max.
	^ cells select: [ :cell | cell biomass = maxBiomass ]
]

{ #category : 'as yet unclassified' }
PCHighBiomassStrategy >> sendHarvesters [

	| harvestersToSend targetCells |
	
	harvestersToSend := family children first: 3.
	targetCells := self selectCellsWithHighBiomass.
	
	harvestersToSend withIndexDo: [ :child :index |
		child moveTo: (family selectRandomlyFrom: targetCells) ]
]
