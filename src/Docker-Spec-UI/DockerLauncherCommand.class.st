"
Abstract superclass for launcher commands
"
Class {
	#name : 'DockerLauncherCommand',
	#superclass : 'CmCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'testing' }
DockerLauncherCommand class >> isAbstract [

	^ self == DockerLauncherCommand
]

{ #category : 'converting' }
DockerLauncherCommand >> asSpecCommand [

	^ super asSpecCommand
		  iconName: self iconName;
		  yourself
]

{ #category : 'accessing' }
DockerLauncherCommand >> iconName [  

	^ self subclassResponsibility
]
