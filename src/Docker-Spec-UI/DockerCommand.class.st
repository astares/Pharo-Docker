"
Abstract superclass for all commands related to docker
"
Class {
	#name : 'DockerCommand',
	#superclass : 'CmCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'testing' }
DockerCommand class >> isAbstract [

	^ self == DockerCommand
]

{ #category : 'converting' }
DockerCommand >> asSpecCommand [

	^ super asSpecCommand
		  iconName: self iconName;
		  yourself
]

{ #category : 'accessing' }
DockerCommand >> iconName [  

	^ self subclassResponsibility
]
