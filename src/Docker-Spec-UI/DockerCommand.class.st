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
		  iconProvider: self iconProvider;
		  iconName: self iconName;
		  yourself
]

{ #category : 'accessing' }
DockerCommand >> iconName [  

	^ self subclassResponsibility
]

{ #category : 'accessing' }
DockerCommand >> iconName: aSymbol [ 

	^  self iconProvider iconNamed: aSymbol
]

{ #category : 'accessing' }
DockerCommand >> iconProvider [

	^ DockerApplication current iconProvider
]
