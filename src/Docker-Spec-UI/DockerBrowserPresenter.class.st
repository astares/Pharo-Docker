"
Abstract superclass for presenters related to Docker toolwork
"
Class {
	#name : 'DockerBrowserPresenter',
	#superclass : 'DockerPresenter',
	#instVars : [
		'actionBar',
		'statusBar'
	],
	#category : 'Docker-Spec-UI-Base',
	#package : 'Docker-Spec-UI',
	#tag : 'Base'
}

{ #category : 'building' }
DockerBrowserPresenter class >> buildCommandsGroupWith: presenter forRoot: aGroup [

	aGroup		 
		register: (self buildToolbarFor: presenter)
]

{ #category : 'testing' }
DockerBrowserPresenter class >> isAbstract [

	^ self == DockerBrowserPresenter
]
