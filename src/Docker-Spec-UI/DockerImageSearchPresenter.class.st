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

{ #category : 'initialization' }
DockerImageSearchPresenter >> initDockerImageRegistryTable [

	resultList := self newTable.
	resultList showColumnHeaders;
		 		 beResizable.
	resultList
		addColumn: (SpStringTableColumn title: 'NAME' evaluated: #name);
		addColumn: (SpStringTableColumn title: 'Description' evaluated: #description);
		addColumn: (SpStringTableColumn title: 'Stars' evaluated: #starCount);
		addColumn: (SpStringTableColumn title: 'Official' evaluated: #isOfficial);
		addColumn: (SpStringTableColumn title: 'Automated' evaluated: #isAutomated).
 
]

{ #category : 'initialization' }
DockerImageSearchPresenter >> initializePresenters [
	searchText := self newTextInput.
	searchButton := self newButton
		help: 'Search for the image';
		label: 'Search';
		icon: (self iconNamed: #glamorousSearch);
		action: [ self search ];
		yourself.
		
	self initDockerImageRegistryTable	
]

{ #category : 'actions' }
DockerImageSearchPresenter >> search [

	searchText text
		ifEmpty: [ resultList items: #(  ) ]
		ifNotEmpty: [ :text |
		resultList items: (Docker searchDockerHubFor: text) ]
]