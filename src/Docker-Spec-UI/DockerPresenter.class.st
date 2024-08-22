"
Abstract superclass for all presenters
"
Class {
	#name : 'DockerPresenter',
	#superclass : 'SpPresenter',
	#category : 'Docker-Spec-UI-Base',
	#package : 'Docker-Spec-UI',
	#tag : 'Base'
}

{ #category : 'testing' }
DockerPresenter class >> isAbstract [

	^ self == DockerPresenter
]
