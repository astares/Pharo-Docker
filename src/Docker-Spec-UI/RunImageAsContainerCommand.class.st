"
Ru the image as a container
"
Class {
	#name : 'RunImageAsContainerCommand',
	#superclass : 'DockerHubImageCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'executing' }
RunImageAsContainerCommand >> execute [
	self context selectedImage ifNotNil: [:item | self runImageAsContainer: item ]
]

{ #category : 'accessing' }
RunImageAsContainerCommand >> iconName [  

	^ #glamorousGo
]

{ #category : 'initialization' }
RunImageAsContainerCommand >> initialize [

	super initialize.
	self
		name: 'Run';
		description: 'Run image'
]

{ #category : 'operating' }
RunImageAsContainerCommand >> runImageAsContainer: aDockerImage [ 
	
	LibC system: 'docker run -d ', aDockerImage repository 
]
