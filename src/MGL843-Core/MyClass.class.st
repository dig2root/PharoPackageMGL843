Class {
	#name : #MyClass,
	#superclass : #Object,
	#classVars : [
		'CsvWriter'
	],
	#classInstVars : [
		'writer'
	],
	#category : #'MGL843-Core'
}

{ #category : #writing }
MyClass >> getModelOnPharo: aFilename [
		"Mise en place des variable"
		| model|

		aFilename asFileReference readStreamDo: 
		[ :stream | model := FamixTypeScriptModel new 
      importFromJSONStream: stream. model install ].
]

{ #category : #writing }
MyClass >> write_file_csv [
		"Mise en place des variable"
	| classes fileRef writer Name Attribut|
	
	classes := MooseModel root second allModelClasses.
	classes do: [ 
	:aClass |
	
	
	Name := aClass name.
	Attribut := aClass numberOfAttributes stringForReadout.		
		
	fileRef := 'file.csv' asFileReference.
	writer := NeoCSVWriter on: fileRef writeStream.
		
	writer nextPut:  #('Class' 'Attributes' 'Methods' 'LOC' 'NOC' 'fanOut' 'WMC' 'LCOM').

	writer close.
].


]
