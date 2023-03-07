Class {
	#name : #DataClass,
	#superclass : #Object,
	#instVars : [
		'Class',
		'PathFile',
		'Attributes',
		'Methods',
		'LOC',
		'NOC',
		'fanOut',
		'WMC',
		'LCOM'
	],
	#category : #'MGL843-Core'
}

{ #category : #accessing }
DataClass >> Attributes [

	^ Attributes
]

{ #category : #accessing }
DataClass >> Attributes: aString [

	Attributes := aString
]

{ #category : #accessing }
DataClass >> Class [

	^ Class
]

{ #category : #accessing }
DataClass >> Class: aString [

	Class := aString
]

{ #category : #accessing }
DataClass >> LCOM [

	^ LCOM
]

{ #category : #accessing }
DataClass >> LCOM: aString [

	LCOM := aString
]

{ #category : #accessing }
DataClass >> LOC [

	^ LOC
]

{ #category : #accessing }
DataClass >> LOC: aString [

	LOC := aString
]

{ #category : #accessing }
DataClass >> Methods [

	^ Methods
]

{ #category : #accessing }
DataClass >> Methods: aString [

	Methods := aString
]

{ #category : #accessing }
DataClass >> NOC [

	^ NOC
]

{ #category : #accessing }
DataClass >> NOC: aString [

	NOC := aString
]

{ #category : #accessing }
DataClass >> PathFile [

	^ PathFile
]

{ #category : #accessing }
DataClass >> PathFile: aString [

	PathFile := aString
]

{ #category : #accessing }
DataClass >> WMC [

	^ WMC
]

{ #category : #accessing }
DataClass >> WMC: aString [

	WMC := aString
]

{ #category : #accessing }
DataClass >> fanOut [

	^ fanOut
]

{ #category : #accessing }
DataClass >> fanOut: aString [

	fanOut := aString
]
