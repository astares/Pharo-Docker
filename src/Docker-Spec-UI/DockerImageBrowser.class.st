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
	imageList showColumnHeaders;
		 		 beResizable.
	imageList
		addColumn: (SpStringTableColumn title: 'Repository' evaluated: #repository);
		addColumn: (SpStringTableColumn title: 'Tag' evaluated: #tag);
		addColumn: (SpStringTableColumn title: 'Imge ID' evaluated: #id);
		addColumn: (SpStringTableColumn title: 'Created' evaluated: #createdAt);
		addColumn: (SpStringTableColumn title: 'Size' evaluated: #imageSize).
		
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
		statusBar: statusBar
]
