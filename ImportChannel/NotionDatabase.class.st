Class {
	#name : #NotionDatabase,
	#superclass : #NotionContentItem,
	#instVars : [
		'databaseID',
		'json',
		'nChannel'
	],
	#category : #ImportChannel
}

{ #category : #accessing }
NotionDatabase >> json [
	json := (json ifNil: [nChannel getJSON: self url] ifNotNil: [json]).
	^ json.
]

{ #category : #accessing }
NotionDatabase >> notionChannel: aNotionChannel [ 
	nChannel := aNotionChannel
]

{ #category : #accessing }
NotionDatabase >> notionChannel: aNotionChannel id: aDatabaseID [
	nChannel :=  aNotionChannel.
	databaseID := aDatabaseID.
]

{ #category : #accessing }
NotionDatabase >> notionJSON [
	json := (json ifNil: [nChannel getJSON: self url] ifNotNil: [json]).
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
