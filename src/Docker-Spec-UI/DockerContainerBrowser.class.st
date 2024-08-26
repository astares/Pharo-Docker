"
A docker image browser
"
Class {
	#name : 'DockerContainerBrowser',
	#superclass : 'DockerBrowserPresenter',
	#instVars : [
		'containerList'
	],
	#category : 'Docker-Spec-UI-Browser',
	#package : 'Docker-Spec-UI',
	#tag : 'Browser'
}

{ #category : 'building' }
DockerContainerBrowser class >> buildCommandsGroupWith: presenterIntance forRoot: rootCommandGroup [
	super buildCommandsGroupWith: presenterIntance forRoot: rootCommandGroup.
	rootCommandGroup register:
		((CmCommandGroup named: 'container commands') asSpecGroup 
			register: (StopDockerContainerCommand forSpecContext: presenterIntance))
]

{ #category : 'building' }
DockerContainerBrowser class >> buildToolbarFor: presenter [  

	^ (CmCommandGroup named: 'Toolbar') asSpecGroup	 
		  register: (StopDockerContainerCommand forSpecContext: presenter);		
		  yourself
]

{ #category : 'layout' }
DockerContainerBrowser class >> defaultLayout [
	^ SpBoxLayout newVertical
					add: #actionBar
				   expand: false
				   fill: false
				   padding: 0;
				   add: #containerList;				
		  yourself
]

{ #category : 'operating' }
DockerContainerBrowser class >> open [
	<script>
	
	self new open
]

{ #category : 'private - initialization' }
DockerContainerBrowser >> initDockerContainerTable [

	containerList := self newTable.
	containerList showColumnHeaders;
		 		 beResizable.
				
	containerList
		addColumn: (SpImageTableColumn new
				 width: 20;
				 evaluated: [ :each |
					 self application iconProvider iconNamed: #container ];
				 yourself);
		addColumn: (SpStringTableColumn title: 'ID' evaluated: #shortID);
		addColumn: (SpStringTableColumn title: 'IMAGE' evaluated: #image);
		addColumn: (SpStringTableColumn title: 'COMMAND' evaluated: #command);
		addColumn: (SpStringTableColumn title: 'CREATED' evaluated: #created);
		addColumn: (SpStringTableColumn title: 'STATUS' evaluated: #status);
		addColumn: (SpStringTableColumn title: 'PORTS' evaluated: #ports);
		addColumn: (SpStringTableColumn title: 'NAMES' evaluated: #names).

	containerList 
		contextMenu: [ (self rootCommandsGroup / 'container commands') beRoot asMenuPresenter	].
		
	self updateContainerList
]

{ #category : 'initialization' }
DockerContainerBrowser >> initializePresenters [

	actionBar := SpToolbarPresenterBuilder new
		             visit: self rootCommandsGroup / 'Toolbar';
		             toolbarPresenter.
		
	statusBar := self newStatusBar.	
	
	self initDockerContainerTable
	 
]

{ #category : 'initialization' }
DockerContainerBrowser >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Docker container';
		initialExtent: 800 @ 300;
		statusBar: statusBar
]

{ #category : 'private - accessing' }
DockerContainerBrowser >> selectedContainer [

	^ containerList selectedItem
]

{ #category : 'private - initialization' }
DockerContainerBrowser >> updateContainerList [

	containerList items: Docker localContainers
]
