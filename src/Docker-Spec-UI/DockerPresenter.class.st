"
Abstract superclass for presenters related to Docker toolwork
"
Class {
	#name : 'DockerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'actionBar',
		'statusBar'
	],
	#category : 'Docker-Spec-UI-Base',
	#package : 'Docker-Spec-UI',
	#tag : 'Base'
}

{ #category : 'building' }
DockerPresenter class >> buildCommandsGroupWith: presenter forRoot: aGroup [

	aGroup		 
		register: (self buildToolbarFor: presenter)
]

{ #category : 'testing' }
DockerPresenter class >> isAbstract [

	^ self == DockerPresenter
]
