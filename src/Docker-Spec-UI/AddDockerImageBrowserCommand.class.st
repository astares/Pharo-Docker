"
Add another docker image
"
Class {
	#name : 'AddDockerImageBrowserCommand',
	#superclass : 'DockerLauncherCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'executing' }
AddDockerImageBrowserCommand >> execute [
	 
]

{ #category : 'accessing' }
AddDockerImageBrowserCommand >> iconName [

	^ #add
]

{ #category : 'executing' }
AddDockerImageBrowserCommand >> initialize [

	super initialize.
	self
		name: 'Add';
		description: 'Add new images'
]
