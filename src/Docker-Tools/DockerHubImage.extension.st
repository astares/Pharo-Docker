Extension { #name : #DockerHubImage }

{ #category : #'*Docker-Tools' }
DockerHubImage >> spotterPreviewDockerHubImageIn: aComposite [
	<spotterPreview: 10>
	
	^aComposite text
		title: [ self name ];
		display: [:aDockerHubImage | aDockerHubImage description ];
		entity: self
		
	 
]

{ #category : #'*Docker-Tools' }
DockerHubImage class >> systemIcon [

	 ^DockerIconCache dockerhubIcon 
]
