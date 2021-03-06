Class {
	#name : #KLossFunction,
	#superclass : #KObject,
	#classTraits : 'PBPythonValueTrait',
	#category : #'KerasBridge-LossFunction'
}

{ #category : #testing }
KLossFunction class >> isPythonGenerable [
	^ true
]

{ #category : #'instance creation' }
KLossFunction class >> new [
	self error: 'Loss functions are not supposed to be instantiated'
]

{ #category : #testing }
KLossFunction class >> pythonClass [
	self subclassResponsibility
]

{ #category : #testing }
KLossFunction class >> pythonClassName [
	^ self pythonClass attributeIdentifier name
]

{ #category : #testing }
KLossFunction class >> writePython3On: str [
	self pythonClass writePython3On: str
]
