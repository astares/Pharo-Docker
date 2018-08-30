Extension { #name : #GTSpotter }

{ #category : #'*Docker-Tools' }
GTSpotter >> spotterDockerHubImageFor: aStep [
	<spotterOrder: 30>
 
	^ aStep listProcessor
		title: 'Dockerhub images' translated; 
		itemName: [:each | each name ];
		itemIcon: [:each | DockerIconCache dockerhubIcon ];
		filter: GTNullFilter item: [ :filter :context | 
			(Docker searchDockerHubFor: context textTrimmed) 
					do: [:each | filter value: each ]];
		actLogic: [ :item :step |
			step exit.
			item inspect ];
		wantsToDisplayOnEmptyQuery: false		
]

{ #category : #'*Docker-Tools' }
GTSpotter >> spotterDockerImageFor: aStep [
	<spotterOrder: 30>
 
	^ aStep listProcessor
		title: 'Docker images (local)' translated; 
		itemName: [:each | each printString ];
		itemIcon: [:each | DockerIconCache dockerIcon ];
	   allCandidates: [ Docker localImages ];
		actLogic: [ :item :step |
			step exit.
			item inspect ];
		wantsToDisplayOnEmptyQuery: false		
]
