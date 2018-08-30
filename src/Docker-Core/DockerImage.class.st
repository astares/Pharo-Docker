"
I represent a docker image
"
Class {
	#name : #DockerImage,
	#superclass : #Object,
	#instVars : [
		'id',
		'repository',
		'tag',
		'digest',
		'createdSince',
		'createdAt',
		'imageSize'
	],
	#category : #'Docker-Core-Base'
}

{ #category : #'instance creation' }
DockerImage class >> id: aString [ 
	self shouldBeImplemented.
]

{ #category : #'instance creation' }
DockerImage class >> id: aString repository: repository tag: tag [ 
	 ^(self new)
			id: aString;
			repository: repository;
			tag: tag;
			yourself
]

{ #category : #operating }
DockerImage class >> remove [

	 ^Docker remove: self
]

{ #category : #accessing }
DockerImage >> createdAt [
	^ createdAt
]

{ #category : #accessing }
DockerImage >> createdAt: anObject [
	createdAt := anObject
]

{ #category : #accessing }
DockerImage >> createdSince [
	^ createdSince
]

{ #category : #accessing }
DockerImage >> createdSince: anObject [
	createdSince := anObject
]

{ #category : #accessing }
DockerImage >> digest [
	^ digest
]

{ #category : #accessing }
DockerImage >> digest: anObject [
	digest := anObject
]

{ #category : #accessing }
DockerImage >> id [
	^ id
]

{ #category : #accessing }
DockerImage >> id: anObject [
	id := anObject
]

{ #category : #accessing }
DockerImage >> imageSize [
	^ imageSize
]

{ #category : #accessing }
DockerImage >> imageSize: anObject [
	imageSize := anObject
]

{ #category : #initialization }
DockerImage >> initialize [
	super initialize.
	
]

{ #category : #printing }
DockerImage >> printOn: aStream [

	aStream 
		nextPutAll: self repository asString;
		nextPut: $:;
		nextPutAll: self tag asString;		
		nextPut: $(;
		nextPutAll: self id asString;
		nextPut: $) 
]

{ #category : #accessing }
DockerImage >> repository [
	^ repository
]

{ #category : #accessing }
DockerImage >> repository: anObject [
	repository := anObject
]

{ #category : #accessing }
DockerImage >> tag [
	^ tag
]

{ #category : #accessing }
DockerImage >> tag: anObject [
	tag := anObject
]
