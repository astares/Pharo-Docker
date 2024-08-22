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

	infos := self instantiate: MicrodownPresenter.
	infos
		documentFromString: self launcherText
]

{ #category : 'initialization' }
DockerLauncher >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Launcher';
		initialExtent: 600 @ 425
]

{ #category : 'initialization' }
DockerLauncher >> launcherText [

	^ '###Welcome to the Docker Launcher
		
This small tool lets you display your local container **images** and **containers** easily but also search for container images on [DockerHub](https://hub.docker.com/)

![Docker](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4E27g9Or59mx-2MiEqEeiW2k8p46qmyJO5g&s)


	
(c) 2024 by T.Bergmann (astares)'
]
