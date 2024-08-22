"
An iterator for Spotter to iterate over container images found on docker hub
"
Class {
	#name : 'DockerHubImageIterator',
	#superclass : 'StGenericGenerator',
	#instVars : [
		'searchTerm'
	],
	#category : 'Docker-Tools-Spotter-Entries',
	#package : 'Docker-Tools',
	#tag : 'Spotter-Entries'
}

{ #category : 'enumerating' }
DockerHubImageIterator >> elementsDo: aValuable [

	searchTerm ifNil: [ ^ self ].
	(Docker searchDockerHubFor: searchTerm) do: [:result | aValuable value: (DockerHubSpotterEntry on: result) ]
]

{ #category : 'filtering' }
DockerHubImageIterator >> filteringText: aString [

	searchTerm := aString ifEmpty: [ nil] ifNotEmpty: [aString asSymbol].
	self reset.
]
