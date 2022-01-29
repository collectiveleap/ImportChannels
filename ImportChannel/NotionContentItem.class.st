Class {
	#name : #NotionContentItem,
	#superclass : #Object,
	#instVars : [
		'theNotionJSON',
		'notionChannel'
	],
	#category : #'ImportChannel-ImportChannel'
}

{ #category : #accessing }
NotionContentItem >> notionChannel: aNotionChannel [ 
	notionChannel := aNotionChannel
]
