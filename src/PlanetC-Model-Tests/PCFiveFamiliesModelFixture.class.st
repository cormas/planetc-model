Class {
	#name : 'PCFiveFamiliesModelFixture',
	#superclass : 'PCModelFixture',
	#category : 'PlanetC-Model-Tests',
	#package : 'PlanetC-Model-Tests'
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
