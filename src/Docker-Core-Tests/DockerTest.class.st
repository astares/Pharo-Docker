"
Unit test for Docker
"
Class {
	#name : #DockerTest,
	#superclass : #TestCase,
	#category : #'Docker-Core-Tests-Base'
}

{ #category : #tests }
DockerTest >> testPullingNonExistingImage [

	self should: [ Docker pull: 'pharo/notexistent' ] raise: DockerImageNotFoundException   
	
]

{ #category : #tests }
DockerTest >> testVersionAccessible [

	self assert: Docker version notEmpty 
]
