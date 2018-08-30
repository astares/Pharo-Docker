Extension { #name : #GTSpotter }

{ #category : #'*Docker-Tools' }
GTSpotter >> spotterDockerHubImageFor: aStep [
	<spotterOrder: 30>
 
	^ aStep listProcessor
		title: 'Dockerhub images' translated; 
		itemName: [:each | each name ];
"		itemIcon: [:each | NodeJSIconCache npmjsIcon ];"
		filter: GTNullFilter item: [ :filter :context | 
			(Docker searchDockerHubFor: context textTrimmed) 
					do: [:each | filter value: each ]];
		actLogic: [ :item :step |
			step exit.
			item inspect ];
		wantsToDisplayOnEmptyQuery: false		
]
