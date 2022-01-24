Class {
	#name : #NotionDatabase,
	#superclass : #Object,
	#instVars : [
		'notionChannel',
		'databaseID',
		'json'
	],
	#category : #ImportChannel
}

{ #category : #accessing }
NotionDatabase >> json [
	json := (json ifNil: [notionChannel getJSON: self url] ifNotNil: [json]).
	^ json.
]

{ #category : #accessing }
NotionDatabase >> notionChannel: aNotionChannel [ 
	notionChannel := aNotionChannel
]

{ #category : #accessing }
NotionDatabase >> notionChannel: aNotionChannel id: aDatabaseID [
	notionChannel :=  aNotionChannel.
	databaseID := aDatabaseID.
]

{ #category : #accessing }
NotionDatabase >> notionJSON [
	json := (json ifNil: [notionChannel getJSON: self url] ifNotNil: [json]).
	^ json.
]

{ #category : #accessing }
NotionDatabase >> pages [
	| thePages aNotionPage |
	thePages := (self json at: 'results') collect: [
		:pageJSON |
		aNotionPage := NotionPage new.
		aNotionPage json: pageJSON.
		aNotionPage.
		].
	^ thePages.
	
]

{ #category : #accessing }
NotionDatabase >> url [
	^ 'https://api.notion.com/v1/databases/', databaseID, '/query'.
]
