Class {
	#name : 'DockerIconProvider',
	#superclass : 'SpPharoThemeIconProvider',
	#classInstVars : [
		'icons'
	],
	#category : 'Docker-Spec-UI-Utilities',
	#package : 'Docker-Spec-UI',
	#tag : 'Utilities'
}

{ #category : 'icons' }
DockerIconProvider class >> containerIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHbSURBVDhP3VI9axRRFD33zZvZXfcrk+yOq8GAiqCglYVgaywsBTux9A9YCJZ2Flr6A8TGLr0gKoiNC36kiMQYHXRDhN2sjslmd97H9U5WFCzs9cCZOx/n3nfOvId/H8HPWiDG3MFb9Ubz7r6Z1jFdrsyTUnV5H7BzTupkT/UHSNikOLmuLly9gWabOs8ewAQaZA0UM1gqOwPvXOas+eDz8VNr7brNx68mO9lnUouXjTp5RmP2MDDoIV66g+Gla3DpW2C0A7WbIajVQBspdD5CUG2Ahl9QCkvIv/WhaW5eI6yKOANMvmdJNVrgOAHXPRCV4dsH4JMUJhtAnT4P232I8lYP1awvLtdegldegD8ug3urklgDLI2+oAUkQjG4qCSRCAokQ0kcsDyr4gPbQjAVgQoPf4E0/aJA0cJxqKOngJn98jvb05VJTalkkwpHOhKGYLnnKAIrhcKLXMRBqSzNLdDCCVBySNxb+O0t4QDc3wB/WgHWulCrXeh3XYSP7qHy+jEqm+8lRiSGZztnESc31bkri4gq6Dy5DyOrkXdCcVPEErvsLJzJx7KlX+VYvPHeL+9mw/R3YB0ekYN0u+bNRR1GSyJed9Y+d2ayacaj1FuzLarvQpn6HwH4Ae9b3b1tn9p5AAAAAElFTkSuQmCC'
]

{ #category : 'icons' }
DockerIconProvider class >> dockerIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHKSURBVDhPYxjmQHbhm/92697th3KxAkYoDQbHn3wx+Pv/PwMTIyPDPyB/2a0//aIcTBcarfgKISowAYoBtivf7f/86z8DCzMjAwsTA8N/BgYHMQ7GA5sDBB2hShgaj33oj9VgaVQS4vkA4oMNWHr1Y8KnP4wKdz/+4//+hwHoAgagAYwMv/4xGHAw/7+gxM/0UYqT8YEqH8MBndU/7keqsGxY7ikYCDcgdNuH/Y8//nWQ5mU68PU30AtA21mBBvz8x+DAxvT/wKMv/x2MRZkPVBmzJRqu/Xb/B9B/vEA18kDXMWbs/9jwHqjpH9DvzEC/A53N8B/IZgSywQDIBvIYWJkZGP78/qe//dm/AFAAyXIzPijWY0tkZJ/x+v9PoAKYemQAMgwmDDIUxGMBUksdORzDNXgOgMSZDASYLzADncMBtAEdcyKzWYBG/fvPEKnIvAGmGQSYEjSYJ/4FhjzIfFwAFKXff/5nsBNjvtBtxZoIEYUApkwD/gXRyswLfgAV/AGpRAJ/gfzvoED9y8CQpsE6YY0bm6MEHyT6YADu82kXPyX0X/qTf+/7PwM2oJd+AzXLcTBe8JJlOhCrzjbRXIr7AVTpoAIMDAD9d6J3DyAWqQAAAABJRU5ErkJggg=='
]

{ #category : 'utilities' }
DockerIconProvider class >> generateIcon [
	<script>
	
	| base64Contents fileName contentsMethod iconName |  
	fileName :=  UIManager default chooseExistingFileReference: 'Open Icon file' extensions: #('png') path: ''.
	fileName ifNil: [ ^ self ].
	iconName := UIManager default request: 'Icon name' initialAnswer: fileName basenameWithoutExtension.
	iconName ifNil: [ ^ self ].
 
	base64Contents := fileName binaryReadStream contents base64Encoded.
	 
	contentsMethod := String
		streamContents: [ :s | 
			s
				nextPutAll: iconName;
				nextPutAll: self iconPrefix;
				cr;
				cr;
				tab;
				nextPut: $^;
				nextPut: $';
				nextPutAll: base64Contents;
				nextPut: $' ].
	 
	self class compile: contentsMethod classified: #'icons'	 
]

{ #category : 'accessing' }
DockerIconProvider class >> iconNamed: aName ifAbsent: aBlock [ 
	"Answer a <Form> representing an icon named aName. Execute aBlock if not found"

	(aName isNil or: [ (self class respondsTo: aName) not ])
		ifTrue: [ ^ aBlock value ].

	 ^ self class perform: aName
]

{ #category : 'private - defaults' }
DockerIconProvider class >> iconPrefix [

	^ 'IconContents'
]

{ #category : 'accessing' }
DockerIconProvider class >> icons [  
	^ icons ifNil: [ icons := Dictionary new ]
]

{ #category : 'inspecting' }
DockerIconProvider class >> inspectionIcons [  
	<inspectorPresentationOrder: 0 title: 'icons'>
	<script: 'self inspect'>
	^ SpTablePresenter new
		  addColumn: (SpImageTableColumn title: 'Icon' evaluated: #value);
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: #key);
		  items:
			  ((self class selectorsInProtocol: 'accessing - icons') sorted
				   collect: [ :each | each -> (self perform: each) ]);
		  yourself
]

{ #category : 'initialization' }
DockerIconProvider class >> resetIcons [  
	<script>
	^ icons := nil
]
