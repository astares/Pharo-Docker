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

{ #category : #accessing }
Docker class >> searchDockerHubFor: searchString [

	|expression cmd |
	cmd := 'docker search --format "(DockerHubImage 
name: ''{{.Name}}'' description: ''{{.Description}}'')
starCount: ''{{.StarCount}}'' asInteger;
isOfficial: ''{{.IsOfficial}}'' =''[OK]'';
isAutomated: ''{{.IsAutomated}}'' = ''[OK]'';
yourself." ', searchString.

	expression := '{',(LibC resultOfCommand: cmd), '}'.
	^self evaluate: expression
]

{ #category : #accessing }
Docker class >> version [

	^LibC resultOfCommand: 'docker version'
]
