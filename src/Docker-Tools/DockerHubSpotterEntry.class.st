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

	content openInWebbrowser
]

{ #category : 'accessing' }
DockerHubSpotterEntry >> iconName [

	^ #docker
]

{ #category : 'accessing' }
DockerHubSpotterEntry >> iconOn: anIconProvider [

	^ (DockerIconProvider iconNamed: #docker)
]
