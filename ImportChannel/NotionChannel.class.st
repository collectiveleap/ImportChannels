Class {
	#name : #NotionChannel,
	#superclass : #Object,
	#instVars : [
		'databaseID',
		'bearerAuthentication',
		'json',
		'jsonDictionary',
		'pagesRawJSON'
	],
	#category : #ImportChannel
}

{ #category : #accessing }
NotionChannel >> bearerAuthentication: aString [ 
	bearerAuthentication := aString
]

{ #category : #accessing }
NotionChannel >> database: aString [ 
	| aNotionDatabase |
	aNotionDatabase := NotionDatabase new notionChannel: self.
	aNotionDatabase notionChannel: self id: aString.
	^ aNotionDatabase
	
]

{ #category : #accessing }
NotionChannel >> getJSON: url [ 
	| aDictionary jsonString |
	jsonString := ZnClient new setBearerAuthentication: bearerAuthentication; headerAt: 'Notion-Version' put: '2021-08-16'; url: url; post.

	aDictionary := STONJSON fromString: jsonString.
	^ aDictionary
]

{ #category : #accessing }
NotionChannel >> json [
	| jsonString |
	"this is a comment"
	jsonString := ZnClient new setBearerAuthentication: bearerAuthentication; headerAt: 'Notion-Version' put: '2021-08-16'; url: 'https://api.notion.com/v1/databases/', databaseID, '/query'; post.

	jsonDictionary := STONJSON fromString: jsonString.
]

{ #category : #accessing }
NotionChannel >> openDatabase: aString bearerAuthentication: aString1 [
	databaseID := aString.
	bearerAuthentication := aString1 
]

{ #category : #accessing }
NotionChannel >> pages [
]

{ #category : #accessing }
NotionChannel >> pagesInDatabase: aDatabaseID [ 
	| jsonString |
	jsonString := ZnClient new setBearerAuthentication: bearerAuthentication; headerAt: 'Notion-Version' put: '2021-08-16'; url: 'https://api.notion.com/v1/databases/', aDatabaseID, '/query'; post.
	^ (STONJSON fromString: jsonString) at: 'results'.
]

{ #category : #accessing }
NotionChannel >> plainTextTitles [
	| plainTextTitles dictionaryOfProperties nameObject plainText |
	plainTextTitles := (self rawPages) collect: [ 
		:page |  
		dictionaryOfProperties := page at: 'properties'.
		nameObject := dictionaryOfProperties at: 'Name'.
		plainText := ((nameObject at: 'title') at: 1) at: 'plain_text'.
	].
	^ plainTextTitles
]

{ #category : #accessing }
NotionChannel >> rawJson [
	| jsonString |
	jsonString := ZnClient new setBearerAuthentication: bearerAuthentication; headerAt: 'Notion-Version' put: '2021-08-16'; url: 'https://api.notion.com/v1/databases/', databaseID, '/query'; post.

	^ jsonDictionary := STONJSON fromString: jsonString.
]

{ #category : #accessing }
NotionChannel >> rawPages [
	^ pagesRawJSON := (self rawJson) at: 'results'.
]
