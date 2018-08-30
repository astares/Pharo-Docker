"
Browser for local docker images
"
Class {
	#name : #DockerBrowser,
	#superclass : #ComposablePresenter,
	#instVars : [
		'tableModel',
		'statusBar',
		'mainMenu',
		'toolBar'
	],
	#category : #'Docker-Tools-UI'
}

{ #category : #specs }
DockerBrowser class >> contentSpec [
	<spec>
	| searchBarOffset |
	searchBarOffset := 5 + StandardFonts defaultFont height + 10.
	^SpecLayout composed 
		add: #tableModel origin: 0@0 corner: 1@1 offsetOrigin: 0@0 offsetCorner: 0@0
	 
]

{ #category : #specs }
DockerBrowser class >> defaultSpec [
	<spec>
	^ SpecLayout composed
		add: #mainMenu
			origin: 0 @ 0
			corner: 1 @ 0
			offsetOrigin: 0 @ 0
			offsetCorner: 0 @ self toolbarHeight;
		add: #toolBar
			origin: 0 @ 0
			corner: 1 @ 0
			offsetOrigin: 0 @ self toolbarHeight
			offsetCorner: 0 @ (self toolbarHeight + (self toolbarHeight + 4));
		add: #statusBar
			origin: 0 @ 1
			corner: 1 @ 1
			offsetOrigin: 0 @ (0 - self statusBarHeight)
			offsetCorner: 0 @ 0;
		add: self contentSpec
			origin: 0 @ 0
			corner: 1 @ 1
			offsetOrigin: 0 @ (self toolbarHeight + (self toolbarHeight + 4))
			offsetCorner: 0 @ (0 - self statusBarHeight);
		yourself
]

{ #category : #accessing }
DockerBrowser class >> icon [

	^DockerIconCache dockerhubIcon 
]

{ #category : #'word menu' }
DockerBrowser class >> menuCommandOn: aBuilder [
	<worldMenu> 		 
		
	(aBuilder item: #'Docker Browser')	 	 
		action: [ self open ]; 
		parent: #Tools;
		order: 140;
		icon: self icon 
]

{ #category : #'instance creation' }
DockerBrowser class >> open [
	<script>
	
	(self basicNew)	 
		initialize;
		openWithSpec 
]

{ #category : #defaults }
DockerBrowser class >> statusBarHeight [

	^ StandardFonts defaultFont height + 2
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

{ #category : #initialization }
DockerBrowser >> iconProvider [

	^DockerIconCache 
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

{ #category : #initialization }
DockerBrowser >> initialExtent [

	^530@360
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
DockerBrowser >> initializeStatusBar [
	statusBar := LabelModel new.
	self statusBar 
		color: Color gray;
		label: 'Ready'
]

{ #category : #'private - initialization' }
DockerBrowser >> initializeTableModel [

	tableModel := self instantiate: FastTableModel.
	tableModel 
 		items: SortedCollection new;
		displayBlock: [ :case | case printString ];
		icons: [:user |  self iconProvider dockerIcon ];
		menu: [:menu | self tableMenu: menu ]
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

{ #category : #initialization }
DockerBrowser >> initializeWidgets [
	
	self 
		initializeMainMenu; 		
		initializeToolBar;
		initializeStatusBar;
		initializeTableModel.
	self refresh	
]

{ #category : #accessing }
DockerBrowser >> mainMenu [
	^ mainMenu
]

{ #category : #accessing }
DockerBrowser >> mainMenu: anObject [
	mainMenu := anObject
]

{ #category : #'private - actions' }
DockerBrowser >> refresh [

	self tableModel items: Docker localImages
]

{ #category : #accessing }
DockerBrowser >> statusBar [
	^ statusBar
]

{ #category : #accessing }
DockerBrowser >> statusBar: anObject [
	statusBar := anObject
]

{ #category : #'private - menu initialization' }
DockerBrowser >> tableMenu: aMenu [

	tableModel selectedItem ifNil: [ ^nil ].
	aMenu target: self.
	aMenu addTitle: 'Image' translated.
	aMenu add: 'Remove' selector: #removeImage.
	^aMenu
]

{ #category : #accessing }
DockerBrowser >> tableModel [
	^ tableModel
]

{ #category : #accessing }
DockerBrowser >> tableModel: anObject [
	tableModel := anObject
]

{ #category : #accessing }
DockerBrowser >> taskbarIcon [

	^self class icon
]

{ #category : #accessing }
DockerBrowser >> toolBar [
	^ toolBar
]

{ #category : #accessing }
DockerBrowser >> toolBar: anObject [
	toolBar := anObject
]
