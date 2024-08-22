"
A spotter processor taking care to provide found images
"
Class {
	#name : 'DockerHubSpotterProcessor',
	#superclass : 'StSpotterProcessor',
	#category : 'Docker-Tools-Spotter',
	#package : 'Docker-Tools',
	#tag : 'Spotter'
}

{ #category : 'default-settings' }
DockerHubSpotterProcessor class >> defaultEnabled [

	^ true
]

{ #category : 'accessing' }
DockerHubSpotterProcessor class >> order [
	
	^ 100
]

{ #category : 'accessing' }
DockerHubSpotterProcessor class >> showForEmptyQuery [

	^ false
]

{ #category : 'accessing' }
DockerHubSpotterProcessor class >> title [

	^ 'Docker images on Hub'
]

{ #category : 'instance creation' }
DockerHubSpotterProcessor >> newEntryOn: anElement [

	^ DockerHubSpotterEntry on: anElement
]

{ #category : 'filtering' }
DockerHubSpotterProcessor >> newTextFilteringSource [

	^ DockerHubImageIterator new 
]
