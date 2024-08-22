"
Open a webbrowser on the given item
"
Class {
	#name : 'BrowseDockerHubImageCommand',
	#superclass : 'DockerHubImageCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'executing' }
BrowseDockerHubImageCommand >> execute [
	self context selectedResult ifNotNil: [:item | item openInWebbrowser ]
]

{ #category : 'accessing' }
BrowseDockerHubImageCommand >> iconName [  

	^ #browse
]

{ #category : 'initialization' }
BrowseDockerHubImageCommand >> initialize [

	super initialize.
	self
		name: 'Browse';
		description: 'Browse on DockerHub'
]
