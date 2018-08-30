"
A DockerHub image
"
Class {
	#name : #DockerHubImage,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'starCount',
		'isOfficial',
		'isAutomated'
	],
	#category : #'Docker-Core-Base'
}

{ #category : #querying }
DockerHubImage class >> fromHubName: aString [

	^(Docker searchDockerHubFor: aString) detect: [:each | each name = aString ] ifNone: nil 
]

{ #category : #'instance creation' }
DockerHubImage class >> name: aName description: aDescription [

	^(self new)
		name: aName;
		description: aDescription;
		yourself
]

{ #category : #accessing }
DockerHubImage >> description [
	^ description
]

{ #category : #accessing }
DockerHubImage >> description: anObject [
	description := anObject
]

{ #category : #initialization }
DockerHubImage >> initialize [
	super initialize.
	self 
		name: '';
		description: '';
		starCount: 0;
		isOfficial: false;
		isAutomated: false
]

{ #category : #accessing }
DockerHubImage >> isAutomated [
	^ isAutomated
]

{ #category : #accessing }
DockerHubImage >> isAutomated: anObject [
	isAutomated := anObject
]

{ #category : #accessing }
DockerHubImage >> isOfficial [
	^ isOfficial
]

{ #category : #accessing }
DockerHubImage >> isOfficial: anObject [
	isOfficial := anObject
]

{ #category : #accessing }
DockerHubImage >> name [
	^ name
]

{ #category : #accessing }
DockerHubImage >> name: anObject [
	name := anObject
]

{ #category : #printing }
DockerHubImage >> printOn: aStream [

	aStream nextPutAll: self name asString
]

{ #category : #operating }
DockerHubImage >> pull [

	^Docker pullImage: self
]

{ #category : #accessing }
DockerHubImage >> starCount [
	^ starCount
]

{ #category : #accessing }
DockerHubImage >> starCount: anObject [
	starCount := anObject
]
