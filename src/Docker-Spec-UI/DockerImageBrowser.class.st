"
A docker image browser
"
Class {
	#name : 'DockerImageBrowser',
	#superclass : 'DockerBrowserPresenter',
	#instVars : [
		'imageList'
	],
	#category : 'Docker-Spec-UI-Base',
	#package : 'Docker-Spec-UI',
	#tag : 'Base'
}

{ #category : 'building' }
DockerImageBrowser class >> buildToolbarFor: presenter [  

	^ (CmCommandGroup named: 'Toolbar') asSpecGroup
		  "register: (AddDockerImageBrowserCommand forSpecContext: presenter);
		  register: (RemoveDockerImageBrowserCommand forSpecContext: presenter);"
		  register: (OpenDockerImageSearchCommand forSpecContext: presenter);		
		  yourself
]

{ #category : 'layout' }
DockerImageBrowser class >> defaultLayout [
	^ SpBoxLayout newVertical
					add: #actionBar
				   expand: false
				   fill: false
				   padding: 0;
				   add: #imageList;				
		  yourself
]

{ #category : 'operating' }
DockerImageBrowser class >> open [
	<script>
	
	self new open
]

{ #category : 'private - initialization' }
DockerImageBrowser >> initDockerImageTable [

	imageList := self newTable.
	imageList
		showColumnHeaders;
		beResizable.
	imageList
		addColumn: (SpImageTableColumn new
				 width: 20;
				 evaluated: [ :each |
					 self application iconProvider iconNamed: #docker ];
				 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'Repository';
				 evaluated: #repository;
				 width: 170;
				 beSortable;
				 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'Tag';
				 evaluated: #tag;
				 width: 50;
				 beSortable;
				 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'Image ID';
				 evaluated: #id;
				 width: 110;
				 beSortable;
				 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'Created';
				 evaluated: #createdAt;
				 width: 190;
				 beSortable;
				 yourself);
		addColumn: (SpStringTableColumn new
				 title: 'Size';
				 evaluated: #imageSize;
				 width: 80;
				 beSortable;
				 yourself).

	imageList items: Docker localImages
]

{ #category : 'initialization' }
DockerImageBrowser >> initializePresenters [

	actionBar := SpToolbarPresenterBuilder new
		             visit: self rootCommandsGroup / 'Toolbar';
		             toolbarPresenter.
		
	statusBar := self newStatusBar.	
	
	self initDockerImageTable
	 
]

{ #category : 'initialization' }
DockerImageBrowser >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Docker images';
		initialExtent: 800 @ 600;		
		statusBar: statusBar.
		
	self setWindowIconTo: aWindowPresenter
]

{ #category : 'private - initialization' }
DockerImageBrowser >> setWindowIconTo: aSpWindowPresenter [
	
	aSpWindowPresenter	windowIcon: (self iconNamed: #docker).

]
