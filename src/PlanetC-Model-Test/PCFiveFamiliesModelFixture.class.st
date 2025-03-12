Class {
	#name : 'PCFiveFamiliesModelFixture',
	#superclass : 'PCModelFixture',
	#category : 'PlanetC-Model-Test',
	#package : 'PlanetC-Model-Test'
}

{ #category : 'accessing' }
PCFiveFamiliesModelFixture >> numberOfFamilies [

	^ 5
]

{ #category : 'inspecting' }
PCFiveFamiliesModelFixture >> openGrid [

	<script: 'self new openGrid'>
	super openGrid
]

{ #category : 'inspecting' }
PCFiveFamiliesModelFixture >> openInspector [

	<script: 'self new openInspector'>
	self inspect
]
