"
Remove a docker container
"
Class {
	#name : 'RemoveDockerContainerCommand',
	#superclass : 'DockerContainerCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'executing' }
RemoveDockerContainerCommand >> execute [
	self halt
]

{ #category : 'accessing' }
RemoveDockerContainerCommand >> iconName [

	^ #delete
]

{ #category : 'initialization' }
RemoveDockerContainerCommand >> initialize [

	super initialize.
	self
		name: 'Remove';
		description: 'Remove the selected container image.'
]
