"
Provides easy access to ""docker"" command line tool.
"
Class {
	#name : 'Docker',
	#superclass : 'Object',
	#category : 'Docker-Core-Base',
	#package : 'Docker-Core',
	#tag : 'Base'
}

{ #category : 'accessing' }
Docker class >> localContainers [
	<sampleInstance>
	| expression cmd |
	cmd := 'docker ps --no-trunc --format "DockerContainer id: \?{{.ID}}\? image: \?{{.Image}}\? command: \?{{.Command}}\? created: \?{{.CreatedAt}}\? status: \?{{.Status}}\? ports: \?{{.Ports}}\? names: \?{{.Names}}\?. "'.
	expression := '{',(LibC resultOfCommand: cmd), '}'.

	^ self compiler evaluate: (self sanitizeString: expression)
]

{ #category : 'accessing' }
Docker class >> localImageNamed: aString [

	^ self localImages
		  detect: [ :each | each repository = aString ]
		  ifNone: [ self wasNotAbleToFindImageNamed: aString ]
]

{ #category : 'accessing' }
Docker class >> localImages [
	<sampleInstance>
	| expression |
	expression := '{'
	              ,
		              (LibC resultOfCommand:
			               'docker images --format "(DockerImage 
id: ''{{.ID}}'' repository: ''{{.Repository}}'' tag: ''{{.Tag}}'')
digest: ''{{.Digest}}'';
createdAt: ''{{.CreatedAt}}'';
createdSince: ''{{.CreatedSince}}'';
imageSize: ''{{.Size}}'';
yourself."') , '}'.
	^ self compiler evaluate: expression
]

{ #category : 'operating' }
Docker class >> pull: aString [
	"Pull a DockerHub image using the given DockerHub image name"

	^ (DockerHubImage fromHubName: aString) 
			ifNil: [ self wasNotAbleToFindImageNamed: aString ] 
			ifNotNil: [:image | 
				image pull.  
				self localImageNamed: aString ]

]

{ #category : 'operating' }
Docker class >> pullImage: aDockerHubImage [

	 ^ LibC system: 'docker pull ', aDockerHubImage name
]

{ #category : 'operating' }
Docker class >> remove: aString [
	"Pull a DockerHub image using the given DockerHub image name"

	self removeImage: (self localImageNamed: aString)
			

]

{ #category : 'operating' }
Docker class >> removeImage: aDockerImage [
	
	^ LibC system: 'docker rmi ', aDockerImage repository
]

{ #category : 'private' }
Docker class >> sanitizeString: aString [
	"Works for now - find a better method later"
	| sanitized |
	sanitized := aString copyReplaceAll: '''' asString with: ''''''. 				
	sanitized := sanitized copyReplaceAll: '\?' asString with: ''''. 									
	^sanitized
]

{ #category : 'accessing' }
Docker class >> searchDockerHubFor: searchString [

	| expression cmd coll |
	cmd := 'docker search --no-trunc --format "#(\?{{.Name}}\? \?{{.Description}}\? \?{{.StarCount}}\? \?{{.IsOfficial}}\? \?{{.IsAutomated}}\?)." '
	       , searchString.
	expression := '{' , (LibC resultOfCommand: cmd) , '}'.
	coll := self compiler evaluate: (self sanitizeString: expression).
	^ coll collect: [ :each |
		  (DockerHubImage name: each first description: each second)
			  starCount: each third;
			  isOfficial: each fourth = '[OK]';
			  isAutomated: each fifth = '[OK]';
			  yourself ]
]

{ #category : 'accessing' }
Docker class >> version [

	^ LibC resultOfCommand: 'docker version'
]

{ #category : 'private - exception handling' }
Docker class >> wasNotAbleToFindImageNamed: aString [ 
	"Throw an error as were not able to find an image with the given name"
	
	^ (DockerImageNotFoundException imageName: aString) signal 

]
