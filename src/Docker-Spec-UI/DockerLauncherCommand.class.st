"
Abstract superclass for launcher commands
"
Class {
	#name : 'DockerLauncherCommand',
	#superclass : 'DockerCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'testing' }
DockerLauncherCommand class >> isAbstract [

	^ self == DockerLauncherCommand
]
