Class {
	#name : 'PCLowBiomassStrategy',
	#superclass : 'PCFamilyStrategy',
	#category : 'PlanetC-Strategies',
	#package : 'PlanetC-Strategies'
}

{ #category : 'accessing' }
PCLowBiomassStrategy >> selectCellsWithLowBiomass [

	| minBiomass |
	minBiomass := (cells collect: [ :cell | cell biomass ]) min.
	^ cells select: [ :cell | cell biomass = minBiomass ]
]

{ #category : 'accessing' }
PCLowBiomassStrategy >> sendHarvesters [

	| harvestersToSend targetCells |
	
	harvestersToSend := family children first: 3.
	targetCells := self selectCellsWithLowBiomass.
	
	harvestersToSend withIndexDo: [ :child :index |
		child moveTo: (family selectRandomlyFrom: targetCells) ]
]
