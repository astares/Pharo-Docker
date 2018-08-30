"
An exception thrown when a docker image was not found.
"
Class {
	#name : #DockerImageNotFoundException,
	#superclass : #Error,
	#instVars : [
		'imageName'
	],
	#category : #'Docker-Core-Errors'
}

{ #category : #'instance creation' }
DockerImageNotFoundException class >> imageName: aString [

	^ (self new)
			imageName: aString;
			yourself
]

{ #category : #accessing }
DockerImageNotFoundException >> imageName [
	^ imageName
]

{ #category : #accessing }
DockerImageNotFoundException >> imageName: anObject [
	imageName := anObject
]

{ #category : #accessing }
DockerImageNotFoundException >> messageText [
	"Overwritten to initialize the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{ #category : #accessing }
DockerImageNotFoundException >> standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream print: self imageName.
		stream << ' not found' ]
]
