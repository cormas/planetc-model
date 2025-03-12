Class {
	#name : 'PCFourFamiliesModelFixture',
	#superclass : 'PCModelFixture',
	#category : 'PlanetC-Model-Test',
	#package : 'PlanetC-Model-Test'
}

{ #category : 'accessing' }
PCFourFamiliesModelFixture >> numberOfFamilies [

	^ 4
]

{ #category : 'inspecting' }
PCFourFamiliesModelFixture >> openGrid [

	<script: 'self new openGrid'>
	super openGrid
]

{ #category : 'inspecting' }
PCFourFamiliesModelFixture >> openInspector [

	<script: 'self new openInspector'>
	self inspect
]
