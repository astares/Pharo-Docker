"
A generic superclass for docker browsers
"
Class {
	#name : #DockerGenericBrowser,
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
DockerGenericBrowser class >> contentSpec [
	<spec>	 
	^SpecLayout composed 
		add: #tableModel origin: 0@0 corner: 1@1 offsetOrigin: 0@0 offsetCorner: 0@0
	 
]

{ #category : #specs }
DockerGenericBrowser class >> defaultSpec [
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

{ #category : #testing }
DockerGenericBrowser class >> isAbstract [

	^ self name = #DockerGenericBrowser 
]

{ #category : #defaults }
DockerGenericBrowser class >> statusBarHeight [

	^ StandardFonts defaultFont height + 2
]

{ #category : #initialization }
DockerGenericBrowser >> iconProvider [

	^DockerIconCache 
]

{ #category : #initialization }
DockerGenericBrowser >> initialExtent [

	^530@360
]

{ #category : #'private - initialization' }
DockerGenericBrowser >> initializeStatusBar [
	statusBar := LabelModel new.
	self statusBar 
		color: Color gray;
		label: 'Ready'
]

{ #category : #'private - initialization' }
DockerGenericBrowser >> initializeTableModel [

	tableModel := self instantiate: FastTableModel.
	tableModel 
 		items: SortedCollection new;
		displayBlock: [ :case | case printString ];
		icons: [:user |  self class icon ];
		menu: [:menu | self tableMenu: menu ]
]

{ #category : #'private - initialization' }
DockerGenericBrowser >> initializeToolBar [

	self subclassResponsibility 
]

{ #category : #initialization }
DockerGenericBrowser >> initializeWidgets [
	
	self 
		initializeMainMenu; 		
		initializeToolBar;
		initializeStatusBar;
		initializeTableModel.
	self refresh	
]

{ #category : #accessing }
DockerGenericBrowser >> mainMenu [
	^ mainMenu
]

{ #category : #accessing }
DockerGenericBrowser >> mainMenu: anObject [
	mainMenu := anObject
]

{ #category : #'private - actions' }
DockerGenericBrowser >> refresh [

	self tableModel items: Docker localImages
]

{ #category : #accessing }
DockerGenericBrowser >> statusBar [
	^ statusBar
]

{ #category : #accessing }
DockerGenericBrowser >> statusBar: anObject [
	statusBar := anObject
]

{ #category : #'private - menu initialization' }
DockerGenericBrowser >> tableMenu: aMenu [

	self subclassResponsibility 
]

{ #category : #accessing }
DockerGenericBrowser >> tableModel [
	^ tableModel
]

{ #category : #accessing }
DockerGenericBrowser >> tableModel: anObject [
	tableModel := anObject
]

{ #category : #accessing }
DockerGenericBrowser >> taskbarIcon [

	^self class icon
]

{ #category : #accessing }
DockerGenericBrowser >> toolBar [
	^ toolBar
]

{ #category : #accessing }
DockerGenericBrowser >> toolBar: anObject [
	toolBar := anObject
]
