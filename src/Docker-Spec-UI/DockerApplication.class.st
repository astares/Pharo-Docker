"
This is the mian docker application class
"
Class {
	#name : 'DockerApplication',
	#superclass : 'SpApplication',
	#classVars : [
		'Current'
	],
	#category : 'Docker-Spec-UI-Core',
	#package : 'Docker-Spec-UI',
	#tag : 'Core'
}

{ #category : 'class initialization' }
DockerApplication class >> current [ 
	<sampleInstance>

	^ Current ifNil: [ Current := self new ]
]

{ #category : 'class initialization' }
DockerApplication class >> reset [ 
	<script>

	Current := nil
]

{ #category : 'running' }
DockerApplication class >> start [
	<script>

	self current run
]

{ #category : 'world menu' }
DockerApplication class >> worldMenuOn: aBuilder [
	<worldMenu>
	(aBuilder item: #Astares)
		order: 10.
	
	(aBuilder item: #Docker)
		icon: (DockerIconProvider iconNamed: #docker);
		parent: #Astares.
		
	(aBuilder item: #DockerLauncher)
		parent: #Docker;
		label: 'Docker Launcher';
		order: 70;
		help: 'Docker related tooling';
		action: [ self start ]
]

{ #category : 'private - factory' }
DockerApplication >> newIconProvider [
 
	^ SpPharoThemeIconProvider new, DockerIconProvider
]

{ #category : 'running' }
DockerApplication >> start [ 
	<script: 'self defaultApplication start'>
	| newPresenter |
	newPresenter := DockerLauncher newApplication: self.
	newPresenter open
]
