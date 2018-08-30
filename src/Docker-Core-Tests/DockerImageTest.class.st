"
Unit test for DockerImage
"
Class {
	#name : #DockerImageTest,
	#superclass : #TestCase,
	#category : #'Docker-Core-Tests-Base'
}

{ #category : #tests }
DockerImageTest >> testInstanceCreation [
	"Test instance creation"
	
	|image|
	image := DockerImage 
						id: '16508e5c265d'
						repository: 'ubuntu'
						tag: 'latest'.
	
	self assert: image id equals: '16508e5c265d'					
						
]
