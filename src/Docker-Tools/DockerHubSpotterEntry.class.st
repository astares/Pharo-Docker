"
A spotter entry wrapping a container image found on docker hub
"
Class {
	#name : 'DockerHubSpotterEntry',
	#superclass : 'StEntry',
	#category : 'Docker-Tools-Spotter-Entries',
	#package : 'Docker-Tools',
	#tag : 'Spotter-Entries'
}

{ #category : 'converting' }
DockerHubSpotterEntry >> asString [

	^ content name
]

{ #category : 'evaluating' }
DockerHubSpotterEntry >> doEvaluate [
	| url |
	url := 'https://hub.docker.com/r/', content name.
	WebBrowser openOn: url.
]

{ #category : 'accessing' }
DockerHubSpotterEntry >> iconName [

	^ #add
]