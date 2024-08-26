"
Command to open the docker image overview
"
Class {
	#name : 'OpenDockerContainerBrowserCommand',
	#superclass : 'DockerLauncherCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'executing' }
OpenDockerContainerBrowserCommand >> execute [

	DockerContainerBrowser open
]

{ #category : 'accessing' }
OpenDockerContainerBrowserCommand >> iconName [

	^ #container
]

{ #category : 'initialization' }
OpenDockerContainerBrowserCommand >> initialize [

	super initialize.
	self
		name: 'Container';
		description: 'Open a browser for local docker container.'
]
