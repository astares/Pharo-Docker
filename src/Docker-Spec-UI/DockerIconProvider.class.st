"
An icon provider
"
Class {
	#name : 'DockerIconProvider',
	#superclass : 'Object',
	#classVars : [
		'IconCache'
	],
	#category : 'Docker-Spec-UI-Utilities',
	#package : 'Docker-Spec-UI',
	#tag : 'Utilities'
}

{ #category : 'icons' }
DockerIconProvider class >> containerIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAG8SURBVDhP1VLNbtpAEJ7d9Q8hDVkooEQ5gBRU8tMD6qHn3MoN9Un6KO0r5Cki5UTS5tSLc4nSVm1AQaiFIhsJTNdmvZ2xSRuJJ8gnj8eenZn95geePtjlj9HJV1/JZzaXV8OwczaYy5clF2ZKB4vEyOOS6x0V3f5B0fHazd3uKu4fmPPhs4miBN7uF7pffHVy4yto17e6ZZtDzhHezzDuj8PluziBQHCQBVv09jZF0JDudVM6XctwBoDOTDAQKED/CAd1eUNMK3nuzSO7Z3N2YTEGM22AKQ33kz+1T4P5+8w9MWCMAY0a8CGQIkmSTDQK+bp4CSYGZNB/IZ2Ak/Pras6ruFbwqpzzqnkr0Jgs4/EIjwx0D/kgGUgTEK0YDSFqhadsPTzDypyp7J0muJmoVhBpeeur1lRpSXWtKvmPh5oQ2AqgdlkoPLVhRGpcNZBAXyRk4ngNTiCNV9iM3wsN36ZR7daPpCWQerxMwCB9TUVRgamjgXGot38t4tY4jOs4RmTG5LbDcYx20Ci5128ahVN2dTdqfZ9G9Q3B5MfhonM+mOHy5LJF0kYePsdFkk6/WXRxkXbWFunJA+Av7FbFmfnV2o4AAAAASUVORK5CYII='
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

{ #category : 'private - accessing' }
DockerIconProvider class >> iconFor: aSymbol [ 

	| encoded |
	encoded := self perform: (aSymbol, self iconPrefix) asSymbol.
	^ Form fromBinaryStream:
		  encoded base64Decoded asByteArray readStream
]

{ #category : 'accessing' }
DockerIconProvider class >> iconNamed: aName [  

	^ self icons at: aName ifAbsentPut: [ self iconFor: aName ]
]

{ #category : 'accessing' }
DockerIconProvider class >> iconNamed: aName ifAbsent: aBlock [

	(aName isNil or: [ (self respondsTo: aName , self iconPrefix) not ])
		  ifTrue: [ ^ aBlock value ].
		
	^ self iconNamed: aName
]

{ #category : 'private - defaults' }
DockerIconProvider class >> iconPrefix [

	^ 'IconContents'
]

{ #category : 'private - accessing' }
DockerIconProvider class >> icons [  
	<script: 'self icons inspect'>
	
	^ IconCache ifNil: [ IconCache := Dictionary new ]
]

{ #category : 'inspecting' }
DockerIconProvider class >> inspectionIcons [  
	<inspectorPresentationOrder: 0 title: 'icons'>
	<script: 'self inspect'>
	^ SpTablePresenter new
		  addColumn: (SpImageTableColumn title: 'Icon' evaluated: #value);
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: #key);
		  items: self icons associations;
		  yourself
]

{ #category : 'initialization' }
DockerIconProvider class >> resetIcons [  
	<script>

	^ IconCache := nil
]
