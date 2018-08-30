"
Unit tests for DockerHubImage
"
Class {
	#name : #DockerHubImageTest,
	#superclass : #TestCase,
	#category : #'Docker-Core-Tests-Base'
}

{ #category : #tests }
DockerHubImageTest >> testDockerHubImageNotFound [

	self assert: (DockerHubImage fromHubName: 'pharo/notexistent') isNil
]
