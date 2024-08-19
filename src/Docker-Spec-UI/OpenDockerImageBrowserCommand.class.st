"
Command to open the docker image overview
"
Class {
	#name : 'OpenDockerImageBrowserCommand',
	#superclass : 'DockerLauncherCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'executing' }
OpenDockerImageBrowserCommand >> execute [

	DockerImageBrowser open
]

{ #category : 'accessing' }
OpenDockerImageBrowserCommand >> iconName [

	^ #page
]

{ #category : 'initialization' }
OpenDockerImageBrowserCommand >> initialize [

	super initialize.
	self
		name: 'Images';
		description: 'Open a browser for docker images.'
]
