"
A docker container
"
Class {
	#name : 'DockerContainer',
	#superclass : 'DockerItem',
	#instVars : [
		'id',
		'image',
		'command',
		'created',
		'status',
		'ports',
		'names'
	],
	#category : 'Docker-Core-Base-Model',
	#package : 'Docker-Core',
	#tag : 'Base-Model'
}

{ #category : 'instance creation' }
DockerContainer class >> id: id image: image command: command created: created status: status ports: ports names: names [

	^ (self new)
		id: id;
		image: image;
		command: command;
		created: created;
		status: status;
		ports: ports;
		names: names;
		yourself
]

{ #category : 'accessing' }
DockerContainer >> command [

	^ command
]

{ #category : 'accessing' }
DockerContainer >> command: anObject [

	command := anObject
]

{ #category : 'accessing' }
DockerContainer >> created [

	^ created
]

{ #category : 'accessing' }
DockerContainer >> created: anObject [

	created := anObject
]

{ #category : 'accessing' }
DockerContainer >> id [

	^ id
]

{ #category : 'accessing' }
DockerContainer >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
DockerContainer >> image [

	^ image
]

{ #category : 'accessing' }
DockerContainer >> image: anObject [

	image := anObject
]

{ #category : 'accessing' }
DockerContainer >> names [

	^ names
]

{ #category : 'accessing' }
DockerContainer >> names: anObject [

	names := anObject
]

{ #category : 'accessing' }
DockerContainer >> ports [

	^ ports
]

{ #category : 'accessing' }
DockerContainer >> ports: anObject [

	ports := anObject
]

{ #category : 'accessing' }
DockerContainer >> shortID [
	 
	^ self id copyFrom: 1 to: 12
]

{ #category : 'accessing' }
DockerContainer >> status [

	^ status
]

{ #category : 'accessing' }
DockerContainer >> status: anObject [

	status := anObject
]
