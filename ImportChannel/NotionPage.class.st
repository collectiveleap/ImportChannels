Class {
	#name : #NotionPage,
	#superclass : #NotionContentItem,
	#instVars : [
		'notionJSON',
		'url'
	],
	#category : #ImportChannel
}

{ #category : #accessing }
NotionPage >> globalID [
	"generate the id"
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
NotionPage >> title [
	| aTitle |
	aTitle := ((((notionJSON at: 'properties') at: 'Name') at: 'title') at: 1) at: 'plain_text'.
	^ aTitle
]

{ #category : #accessing }
NotionPage >> url [
	url := (url ifNil: [self json at: 'url'.] ifNotNil: [url.]).
	^ url. 
]
