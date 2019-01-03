Class {
	#name : #KSequentialModelTests,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KSequentialModelTests >> testEmptyModel [
	| model |
	model := KSequentialModel new.
	model createObject.
	KCF << (#len asP3GI callWith: (Array with: model pythonVariable => #_layers)).
	self
		assert: KCF send waitForValue
		equals: 0
]

{ #category : #tests }
KSequentialModelTests >> testInputLayer [
	| model |
	model := KSequentialModel inputs: 10.
	KCF << (#len asP3GI callWith: (Array with: model pythonVariable => #_layers)).
	self
		assert: KCF send waitForValue
		equals: 1
]