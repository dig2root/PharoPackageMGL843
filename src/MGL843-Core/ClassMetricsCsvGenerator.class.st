Class {
	#name : #MyClass,
	#superclass : #Object,
	#classVars : [
		'CsvWriter'
	],
	#classInstVars : []
	#category : #'MGL843-Core'
}

{ #category : #importing }
ClassMetricsCsvGenerator class >> importFamixTypeScriptModel: modelPath sourcePath: sourcePath [

	"Mise en place des variable"

	modelPath asFileReference readStreamDo: [ :stream | 
		[ 
		| model |
		model := FamixTypeScriptModel new importFromJSONStream: stream.
		model install.
		model rootFolder: sourcePath ]
			on: SlotNotFound
			do: [ ^ false ] ].
	^ true
]

{ #category : #importing }
ClassMetricsCsvGenerator class >> importFamixTypeScriptModels: repoListFile [

	| reader importCount failedCount |
	reader := NeoCSVReader on: repoListFile readStream.
	reader skipHeader.

	importCount := 0.
	failedCount := 0.

	reader do: [ :aLine | 
		| success |
		success := self
			           importFamixTypeScriptModel: (aLine at: 3)
			           sourcePath: (aLine at: 2).

		success
			ifTrue: [ importCount := importCount + 1 ]
			ifFalse: [ failedCount := failedCount + 1 ] ].

	^ importCount asString , ' models imported, ' , failedCount asString
	  , ' models failed to be imported.'
]

{ #category : #utilities }
ClassMetricsCsvGenerator class >> createData: classes [

	"Mise en place des variable"

	| dataclasses |
	dataclasses := classes collect: [ :aClass | 
		               DataClass newFromClass: aClass ].

	^ dataclasses
]

{ #category : #writing }
ClassMetricsCsvGenerator class >> writeToFile: filePath [

	| fileRef writer classes data |
	fileRef := filePath asFileReference.
	writer := NeoCSVWriter on: filePath asFileReference writeStream.

	classes := MooseModel root allModels collectAll: [ :aModel | 
		           aModel allModelClasses ].
	data := self createData: classes.

	writer
		nextPut:
			#( 'Class' 'PathFile' 'Attributes' 'Methods' 'LOC' 'NOC' 'fanOut'
			   'WMC' 'LCOM' );
		addFields:
			#( name sourceFile attributes methods loc noc fanOut wmc lcom );
		nextPutAll: data.

	writer close.
	^ 'Writing done.'
]
