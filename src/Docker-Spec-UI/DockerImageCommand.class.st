"
Abstract superclass for all commands related to docker images
"
Class {
	#name : 'DockerImageCommand',
	#superclass : 'DockerCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'testing' }
DockerImageCommand class >> isAbstract [

	^ self == DockerImageCommand
]
