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
MyClass >> createData: classes [

	"Mise en place des variable"

	| dataclasses|
	dataclasses := classes collect: [ :aClass | 
		               DataClass new
			               Class: aClass name;
			               PathFile: aClass sourceAnchor fileName;
			               Attributes: aClass numberOfAttributes asString;
			               Methods: aClass numberOfMethods asString;
			               LOC: aClass numberOfLinesOfCode asString;
			               NOC: aClass numberOfChildren asString;
			               fanOut: aClass fanOut asString;
			               WMC: aClass weightedMethodCount asString;
			               LCOM: aClass lcom3 asString ].

	^ dataclasses
]

{ #category : #writing }
MyClass >> getModelOnPharo: aFilename and: path [

		"Mise en place des variable"
		| model |

		aFilename asFileReference readStreamDo: 
		[ :stream | model := FamixTypeScriptModel new 
      importFromJSONStream: stream. model install ].
		model rootFolder: path.
]

{ #category : #writing }
MyClass >> write [

	| fileRef writer classes data |
	fileRef := 'file.csv' asFileReference.
	writer := NeoCSVWriter on: fileRef writeStream.

	classes := MooseModel root allModels collect: [ :aModel | 
		           aModel allModelClasses ].
	data := MyClass new createData: classes.

	writer separator: $;.
	writer
		nextPut:
			#( 'Class' 'PathFile' 'Attributes' 'Methods' 'LOC' 'NOC' 'fanOut'
			   'WMC' 'LCOM' );
		addFields:
			#( Class PathFile Attributes Methods LOC NOC fanOut WMC LCOM );
		nextPutAll: data.

	writer close
]
