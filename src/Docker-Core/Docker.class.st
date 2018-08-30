"
Provides easy access to ""docker"" command line tool.
"
Class {
	#name : #Docker,
	#superclass : #Object,
	#category : #'Docker-Core-Base'
}

{ #category : #accessing }
Docker class >> localImages [

	|expression|
	expression := '{',(LibC resultOfCommand: 'docker images --format "(DockerImage 
id: ''{{.ID}}'' repository: ''{{.Repository}}'' tag: ''{{.Tag}}'')
digest: ''{{.Digest}}'';
createdAt: ''{{.CreatedAt}}'';
createdSince: ''{{.CreatedSince}}'';
imageSize: ''{{.Size}}'';
yourself."'), '}'.
	^self evaluate: expression
]

{ #category : #private }
Docker class >> sanitizeString: aString [
	"Works for now - find a better method later"
	| sanitized |
	sanitized := aString copyReplaceAll: (Character value: 128) asString with: ''. 
	sanitized := sanitized copyReplaceAll: (Character value: 166) asString with: ''. 	
	sanitized := sanitized copyReplaceAll: '''' asString with: ''''''. 	
	sanitized := sanitized copyReplaceAll: '?' asString with: ''''. 				
	^sanitized
]

{ #category : #accessing }
Docker class >> searchDockerHubFor: searchString [

	|expression cmd coll |
	cmd := 'docker search --format "#(?{{.Name}}? ?{{.Description}}? ?{{.StarCount}}? ?{{.IsOfficial}}? ?{{.IsAutomated}}?)." ', searchString.
	expression := '{',(LibC resultOfCommand: cmd), '}'.
	coll := (self evaluate: (self sanitizeString: expression)).
	^coll collect: [:each |
		(DockerHubImage name: each first description: each second) 
			starCount: each third;
			isOfficial: each fourth = '[OK]';
			isAutomated: each fifth = '[OK]';
			yourself
	]
	
]

{ #category : #accessing }
Docker class >> version [

	^LibC resultOfCommand: 'docker version'
]
