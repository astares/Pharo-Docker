"
Menu builder
"
Class {
	#name : #DockerMenuBuilder,
	#superclass : #Object,
	#instVars : [
		'menu'
	],
	#category : #'Docker-Tools-Utilities'
}

{ #category : #'instance creation' }
DockerMenuBuilder class >> forMenu: aMenu [

	^(self new)
		menu: aMenu;
		yourself
]

{ #category : #adding }
DockerMenuBuilder >> addItem: aName action: aBlock [
	self group
		addItem: [ :item | 
			item
				name: aName;
				action: aBlock ]
]

{ #category : #adding }
DockerMenuBuilder >> addItem: aName icon: anIcon action: aBlock [
	self group
		addItem: [ :item | 
			item
				name: aName;
				icon: anIcon;
				action: aBlock ]
]

{ #category : #adding }
DockerMenuBuilder >> addItem: aName icon: anIcon subMenu: aMenu [
	self group
		addItem: [ :item | 
			item
				name: aName;
				icon: anIcon;
				subMenu: aMenu ]
]

{ #category : #adding }
DockerMenuBuilder >> addItem: aName subMenu: aMenu [
	self group
		addItem: [ :item | 
			item
				name: aName;
				subMenu: aMenu ]
]

{ #category : #accessing }
DockerMenuBuilder >> group [
	^ menu menuGroups
		ifEmpty: [ menu addGroup: [ :group |  ] ];
		first
]

{ #category : #initialization }
DockerMenuBuilder >> initialize [
 
	super initialize.	
	menu := MenuModel new
]

{ #category : #accessing }
DockerMenuBuilder >> menu [
	^ menu
]

{ #category : #accessing }
DockerMenuBuilder >> menu: anObject [
	menu := anObject
]
