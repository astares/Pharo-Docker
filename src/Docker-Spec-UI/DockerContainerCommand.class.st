"
Abstract superclass for all commands related to docker containers
"
Class {
	#name : 'DockerContainerCommand',
	#superclass : 'DockerCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'testing' }
DockerContainerCommand class >> isAbstract [

	^ self == DockerContainerCommand
]
