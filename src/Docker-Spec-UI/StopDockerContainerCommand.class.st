"
Remove a docker container
"
Class {
	#name : 'StopDockerContainerCommand',
	#superclass : 'DockerContainerCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'testing' }
StopDockerContainerCommand >> canBeExecuted [
	 
	^ self context selectedContainer notNil
]

{ #category : 'executing' }
StopDockerContainerCommand >> execute [
	self context selectedContainer ifNotNil: [:item | self stopContainer: item. self context updateContainerList ]
]

{ #category : 'accessing' }
StopDockerContainerCommand >> iconName [

	^ #delete
]

{ #category : 'initialization' }
StopDockerContainerCommand >> initialize [

	super initialize.
	self
		name: 'Stop';
		description: 'Stop the selected container image.'
]

{ #category : 'operating' }
StopDockerContainerCommand >> stopContainer: aDockerContainer [ 
	LibC system: 'docker container stop ', aDockerContainer id
]
