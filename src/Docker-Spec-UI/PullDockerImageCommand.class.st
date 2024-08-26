Class {
	#name : 'PullDockerImageCommand',
	#superclass : 'DockerHubImageCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'executing' }
PullDockerImageCommand >> execute [
	self context selectedResult ifNotNil: [:item | self pullImage: item ]
]

{ #category : 'accessing' }
PullDockerImageCommand >> iconName [  

	^ #bottom
]

{ #category : 'initialization' }
PullDockerImageCommand >> initialize [

	super initialize.
	self
		name: 'Pull image';
		description: 'Pull image from Dockerhub'
]

{ #category : 'operating' }
PullDockerImageCommand >> pullImage: aDockerImage [
	LibC system: 'docker pull ', aDockerImage name
]
