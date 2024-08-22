"
Docker tooling - launcher
"
Class {
	#name : 'DockerLauncher',
	#superclass : 'DockerBrowserPresenter',
	#instVars : [
		'infos'
	],
	#category : 'Docker-Spec-UI-Base',
	#package : 'Docker-Spec-UI',
	#tag : 'Base'
}

{ #category : 'building' }
DockerLauncher class >> buildToolbarFor: presenter [  

	^ (CmCommandGroup named: 'Toolbar') asSpecGroup
		  register: (OpenDockerImageBrowserCommand forSpecContext: presenter);
		 " register: (FBAboutSystemCommand forSpecContext: presenter);				" 	
		  yourself
]

{ #category : 'layout' }
DockerLauncher class >> defaultLayout [
	^ SpBoxLayout newVertical
				   add: #actionBar
				   expand: false
				   fill: false
				   padding: 0;
				   add: #infos;
		  yourself
]

{ #category : 'operations' }
DockerLauncher class >> open [
	<script>
	
	self new open
]

{ #category : 'layout' }
DockerLauncher class >> worldMenuOn: aBuilder [
	<worldMenu>
	(aBuilder item: #Astares)
		order: 10.
	
	(aBuilder item: #Docker)
		parent: #Astares.
		
	(aBuilder item: #DockerLauncher)
		parent: #Docker;
		label: 'Docker Launcher';
		order: 70;
		help: 'Docker related tooling';
		action: [ self open ]
]

{ #category : 'initialization' }
DockerLauncher >> initializePresenters [

	actionBar := SpToolbarPresenterBuilder new
		             visit: self rootCommandsGroup / 'Toolbar';
		             toolbarPresenter.

	infos := self newText
]

{ #category : 'initialization' }
DockerLauncher >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Launcher';
		initialExtent: 500 @ 300
]
