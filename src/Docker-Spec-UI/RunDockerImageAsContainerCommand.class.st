"
Ru the image as a container
"
Class {
	#name : 'RunDockerImageAsContainerCommand',
	#superclass : 'DockerImageCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'executing' }
RunDockerImageAsContainerCommand >> execute [
	self context selectedImage ifNotNil: [:item | self runImageAsContainer: item ]
]

{ #category : 'accessing' }
RunDockerImageAsContainerCommand >> iconName [  

	^ #glamorousGo
]

{ #category : 'initialization' }
RunDockerImageAsContainerCommand >> initialize [

	super initialize.
	self
		name: 'Run';
		description: 'Run image'
]

{ #category : 'operating' }
RunDockerImageAsContainerCommand >> runImageAsContainer: aDockerImage [ 
	
	LibC system: 'docker run -d ', aDockerImage repository 
]
