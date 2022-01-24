Class {
	#name : #NotionPage,
	#superclass : #Object,
	#instVars : [
		'notionJSON',
		'url'
	],
	#category : #ImportChannel
}

{ #category : #accessing }
NotionPage >> globalID [
	^ (self url).
]

{ #category : #accessing }
NotionPage >> json [
	^notionJSON
]

{ #category : #accessing }
NotionPage >> json: notionPageJSON [ 
	notionJSON := notionPageJSON.
	^self
]

{ #category : #accessing }
NotionPage >> url [
	url := (url ifNil: [self json at: 'url'.] ifNotNil: [url.]).
	^ url. 
]
