Class {
	#name : #DataClass,
	#superclass : #Object,
	#instVars : [
		'name',
		'sourceFile',
		'attributes',
		'methods',
		'loc',
		'noc',
		'fanOut',
		'wmc',
		'lcom'
	],
	#category : #'MGL843-Core'
}

{ #category : #'instance creation' }
DataClass class >> newFromClass: aClass [

	| newInstance |
	newInstance := self new.

	newInstance
		name: aClass name;
		sourceFile: aClass sourceAnchor fileName;
		attributes: aClass numberOfAttributes asString;
		methods: aClass numberOfMethods asString;
		loc: aClass numberOfLinesOfCode asString;
		noc: aClass numberOfChildren asString;
		fanOut: aClass fanOut asString;
		wmc: aClass weightedMethodCount asString;
		lcom: aClass lcom3 asString.

	^ newInstance
]

{ #category : #accessing }
DataClass >> attributes [

	^ attributes
]

{ #category : #accessing }
DataClass >> attributes: aString [

	attributes := aString
]

{ #category : #accessing }
DataClass >> name [

	^ name
]

{ #category : #accessing }
DataClass >> name: aString [

	name := aString
]

{ #category : #accessing }
DataClass >> lcom [

	^ lcom
]

{ #category : #accessing }
DataClass >> lcom: aString [

	lcom := aString
]

{ #category : #accessing }
DataClass >> loc [

	^ loc
]

{ #category : #accessing }
DataClass >> loc: aString [

	loc := aString
]

{ #category : #accessing }
DataClass >> methods [

	^ methods
]

{ #category : #accessing }
DataClass >> methods: aString [

	methods := aString
]

{ #category : #accessing }
DataClass >> noc [

	^ noc
]

{ #category : #accessing }
DataClass >> noc: aString [

	noc := aString
]

{ #category : #accessing }
DataClass >> sourceFile [

	^ sourceFile
]

{ #category : #accessing }
DataClass >> sourceFile: aString [

	sourceFile := aString
]

{ #category : #accessing }
DataClass >> wmc [

	^ wmc
]

{ #category : #accessing }
DataClass >> wmc: aString [

	wmc := aString
]

{ #category : #accessing }
DataClass >> fanOut [

	^ fanOut
]

{ #category : #accessing }
DataClass >> fanOut: aString [

	fanOut := aString
]
