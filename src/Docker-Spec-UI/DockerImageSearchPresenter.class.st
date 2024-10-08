"
A presenter allowing to search for docker container images
"
Class {
	#name : 'DockerImageSearchPresenter',
	#superclass : 'DockerPresenter',
	#instVars : [
		'searchText',
		'searchButton',
		'resultList'
	],
	#category : 'Docker-Spec-UI-Base',
	#package : 'Docker-Spec-UI',
	#tag : 'Base'
}

{ #category : 'commands' }
DockerImageSearchPresenter class >> buildCommandsGroupWith: presenterIntance forRoot: rootCommandGroup [

	rootCommandGroup register:
		((CmCommandGroup named: 'result commands') asSpecGroup 
			register: (BrowseDockerHubImageCommand forSpecContext: presenterIntance);
			register: (PullDockerImageCommand forSpecContext: presenterIntance))
]

{ #category : 'layout' }
DockerImageSearchPresenter >> defaultLayout [

	^ SpBoxLayout newVertical 
	   	  spacing: 10;
		  add: (SpGridLayout build: [ :builder |
					   builder
						   beColumnNotHomogeneous;
						   column: 2 expand: true;
						   add: 'Find:';
						   add: searchText;
						   add: searchButton ]) expand: false;
		  add: resultList;
		  yourself
		 
]

{ #category : 'private - initialization' }
DockerImageSearchPresenter >> initDockerImageRegistryTable [

	resultList := self newTable.
	resultList showColumnHeaders;
		 		 beResizable.
	resultList
		addColumn: (SpImageTableColumn new
				 width: 20;
				 evaluated: [ :each |
					 self application iconProvider iconNamed: #container ];
				 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'NAME';
				 evaluated: #name;
				 width: 80;
				 beSortable;
				 yourself);				
		
		addColumn: (SpStringTableColumn title: 'Description' evaluated: #description);
		addColumn: (SpStringTableColumn title: 'Stars' evaluated: #starCount);
		addColumn: (SpStringTableColumn title: 'Official' evaluated: #isOfficial);
		addColumn: (SpStringTableColumn title: 'Automated' evaluated: #isAutomated).
	
	resultList	
		contextMenu: [ (self rootCommandsGroup / 'result commands') beRoot asMenuPresenter	]
]

{ #category : 'initialization' }
DockerImageSearchPresenter >> initializePresenters [
	searchText := self newTextInput.
	searchText whenSubmitDo: [:text | self search ].

	searchButton := self newButton
		help: 'Search for the image';
		label: 'Search';
		icon: (self iconNamed: #glamorousSearch);
		action: [ self search ];
		yourself.
		
	self initDockerImageRegistryTable	
]

{ #category : 'initialization' }
DockerImageSearchPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Search container images';
		initialExtent: 700 @ 600.
		
	aWindowPresenter whenOpenedDo: [ searchText takeKeyboardFocus ]	
]

{ #category : 'actions' }
DockerImageSearchPresenter >> search [

	searchText text
		ifEmpty: [ resultList items: #(  ) ]
		ifNotEmpty: [ :text |
		resultList items: (Docker searchDockerHubFor: text) ]
]

{ #category : 'information' }
DockerImageSearchPresenter >> selectedResult [
	^ resultList selectedItem
]
