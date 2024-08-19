"
Command to open the docker image browser
"
Class {
	#name : 'RemoveDockerImageBrowserCommand',
	#superclass : 'DockerLauncherCommand',
	#category : 'Docker-Spec-UI-Commands',
	#package : 'Docker-Spec-UI',
	#tag : 'Commands'
}

{ #category : 'accessing' }
RemoveDockerImageBrowserCommand >> iconName [

	^ #remove
]

{ #category : 'initialization' }
RemoveDockerImageBrowserCommand >> initialize [

	super initialize.
	self
		name: 'Remove';
		description: 'Remove the selected container image.'
]
