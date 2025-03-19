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

		"Packages"
		spec
			package: 'PlanetC-Model';
			package: 'PlanetC-Model-Tests' with: [ spec requires: #( 'PlanetC-Model' ) ] ]
]
