Class {
	#name : 'SearchDockerImageBrowserCommand',
	#superclass : 'DockerLauncherCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'executing' }
SearchDockerImageBrowserCommand >> execute [
	 DockerImageSearchPresenter new openModal 
]

{ #category : 'accessing' }
SearchDockerImageBrowserCommand >> iconName [  

	^ #glamorousSearch
]

{ #category : 'initialization' }
SearchDockerImageBrowserCommand >> initialize [

	super initialize.
	self
		name: 'Search';
		description: 'Search for an image.'
]
