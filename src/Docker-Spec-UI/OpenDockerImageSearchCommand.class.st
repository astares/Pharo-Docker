"
Open search 
"
Class {
	#name : 'OpenDockerImageSearchCommand',
	#superclass : 'DockerCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'executing' }
OpenDockerImageSearchCommand >> execute [
	 DockerImageSearchPresenter new openModal 
]

{ #category : 'accessing' }
OpenDockerImageSearchCommand >> iconName [  

	^ #glamorousSearch
]

{ #category : 'initialization' }
OpenDockerImageSearchCommand >> initialize [

	super initialize.
	self
		name: 'Search';
		description: 'Search for an image.'
]
