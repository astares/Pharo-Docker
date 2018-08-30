"
Browser for local docker images
"
Class {
	#name : #DockerBrowser,
	#superclass : #DockerGenericBrowser,
	#category : #'Docker-Tools-UI'
}

{ #category : #accessing }
DockerBrowser class >> icon [

	^DockerIconCache dockerIcon 
]

{ #category : #'word menu' }
DockerBrowser class >> menuCommandOn: aBuilder [
	<worldMenu> 		 
		
	(aBuilder item: self title asSymbol)	 	 
		action: [ self open ]; 
		parent: #Tools;
		order: 140;
		icon: self icon 
]

{ #category : #'instance creation' }
DockerBrowser class >> open [
	<script>
	
	^(self basicNew)	 
		initialize;
		openWithSpec 
]

{ #category : #accessing }
DockerBrowser class >> title [

	^'Docker Browser'
]

{ #category : #'private - actions' }
DockerBrowser >> displayVersion [

	^AboutDialogWindow new
		entryText: Docker version;
		open;
		yourself
]

{ #category : #'private - menu initialization' }
DockerBrowser >> initalDockerMenu [
	|builder|
	builder := DockerMenuBuilder new.
	builder
		addItem: 'Refresh'
		icon: self iconProvider refreshIcon 
		action: [ self refresh ].
	builder
		addItem: 'Version'
		icon: self iconProvider dockerhubIcon 
		action: [ self displayVersion ].	
	^builder menu	
]

{ #category : #'private - menu initialization' }
DockerBrowser >> initalImageMenu [
	|builder|
	builder := DockerMenuBuilder new.
	builder
		addItem: 'Search'
		icon: self iconProvider searchIcon
		action: [ self refresh ].	 
	^builder menu	
]

{ #category : #'private - initialization' }
DockerBrowser >> initializeMainMenu [

	| builder |
	mainMenu := MenuModel new.
	builder := DockerMenuBuilder forMenu: mainMenu.
	builder addItem: 'Docker' icon: nil subMenu: self initalDockerMenu.
	builder addItem: 'Image' icon: nil subMenu: self initalImageMenu
]

{ #category : #'private - initialization' }
DockerBrowser >> initializeToolBar [

	toolBar := MenuModel new
		addGroup: [ :group |			 
			group addItem: [ :item |
				item
					name: nil;
					description: 'Refresh';
					icon: (self iconProvider refreshIcon);
					action: [ self refresh ] ].
		 ].
	toolBar applyTo: self.
]

{ #category : #'private - menu initialization' }
DockerBrowser >> tableMenu: aMenu [

	tableModel selectedItem ifNil: [ ^nil ].
	aMenu target: self.
	aMenu addTitle: 'Image' translated.
	aMenu add: 'Remove' selector: #removeImage.
	^aMenu
]
