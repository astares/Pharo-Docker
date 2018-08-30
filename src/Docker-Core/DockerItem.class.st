"
Abstract superclass for docker releated items
"
Class {
	#name : #DockerItem,
	#superclass : #Object,
	#category : #'Docker-Core-Base-Model'
}

{ #category : #testing }
DockerItem class >> isAbstract [

	^self name = #DockerItem
]
