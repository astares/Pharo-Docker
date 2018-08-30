"
Browser for docker hub
"
Class {
	#name : #DockerHubBrowser,
	#superclass : #DockerGenericBrowser,
	#category : #'Docker-Tools-UI'
}

{ #category : #accessing }
DockerHubBrowser class >> icon [

	^DockerIconCache dockerhubIcon 
]

{ #category : #'world menu' }
DockerHubBrowser class >> menuCommandOn: aBuilder [
	<worldMenu> 		 
		
	(aBuilder item: self title asSymbol)	 	 
		action: [ self open ]; 
		parent: #Tools;
		order: 141;
		icon: self icon 
]

{ #category : #'instance creation' }
DockerHubBrowser class >> open [
	<script>
	
	^(self basicNew)	 
		initialize;
		openWithSpec 
]

{ #category : #accessing }
DockerHubBrowser class >> title [

	^'DockerHub Browser'
]

{ #category : #'private - actions' }
DockerHubBrowser >> exploreDockerHub [
	<script: 'self new exploreDockerHub'>
	
	WebBrowser openOn: 'https://hub.docker.com/explore/'
]

{ #category : #'private - initialization' }
DockerHubBrowser >> initalDockerHubMenu [
	|builder|
	builder := DockerMenuBuilder new.
	builder
		addItem: 'Search'
		icon: self iconProvider searchIcon 
		action: [ self search ].
	^ builder menu
]

{ #category : #'private - initialization' }
DockerHubBrowser >> initializeMainMenu [

	| builder |
	mainMenu := MenuModel new.
	builder := DockerMenuBuilder forMenu: mainMenu.
	builder addItem: 'DockerHUb' icon: nil subMenu: self initalDockerHubMenu
]

{ #category : #'private - initialization' }
DockerHubBrowser >> initializeToolBar [

	toolBar := MenuModel new
		addGroup: [ :group |			 
			group addItem: [ :item |
				item
					name: nil;
					description: 'Search';
					icon: (self iconProvider searchIcon);
					action: [ self refresh ] ].
			group addItem: [ :item |
				item
					name: nil;
					description: 'Explore';
					icon: (self iconProvider dockerhubIcon);
					action: [ self exploreDockerHub ] ].				
		 ].
	toolBar applyTo: self.
]

{ #category : #'private - actions' }
DockerHubBrowser >> search [

	self inform: 'search called'
]

{ #category : #'private - menu initialization' }
DockerHubBrowser >> tableMenu: aMenu [

	tableModel selectedItem ifNil: [ ^nil ].
	aMenu target: self.
	aMenu addTitle: 'Image' translated.
	aMenu add: 'Pull' selector: #pullImage.
	^aMenu
]
