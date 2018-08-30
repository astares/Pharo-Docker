Extension { #name : #DockerImage }

{ #category : #'*Docker-Tools' }
DockerImage >> spotterPreviewDockerImageIn: aComposite [
	<spotterPreview: 10>
	
	^aComposite table
		title: [ self printString ];
		display: [ {
			'Repository:' -> self repository asString.
			'Tag:' -> self tag asString.
			'Id:' -> self id asString.
			'Digest:' -> self digest asString.
			'Size:' -> self imageSize asString.
			'Created since:' -> self createdSince asString.
			'Created at:' -> self createdAt asString.
			} ];
		column: 'Key' evaluated: #key;
		column: 'Value' evaluated: #value;
		entity: self
		
	 
]

{ #category : #'*Docker-Tools' }
DockerImage class >> systemIcon [

	 ^DockerIconCache dockerIcon 
]
