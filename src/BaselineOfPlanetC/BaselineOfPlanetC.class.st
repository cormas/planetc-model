Class {
	#name : 'BaselineOfPlanetC',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPlanetC',
	#package : 'BaselineOfPlanetC'
}

{ #category : 'baselines' }
BaselineOfPlanetC >> baseline: spec [

	<baseline>
	spec for: #common do: [
		"Dependencies"
		spec
			baseline: 'CormasGameServer'
			with: [ spec repository: 'github://cormas/cormas-game-server:main' ].
		
		"Packages"
		spec
			package: 'PlanetC-Model'
			with: [ spec requires: #('CormasGameServer') ];

			package: 'PlanetC-Model-Tests'
			with: [ spec requires: #( 'PlanetC-Model' ) ] ]
]
