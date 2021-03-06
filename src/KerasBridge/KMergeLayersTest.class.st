Class {
	#name : #KMergeLayersTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KMergeLayersTest >> testAddLayer [
	self assertInstanceClass: KAddLayer default name: 'Add'
]

{ #category : #tests }
KMergeLayersTest >> testAverageLayer [
	self assertInstanceClass: KAverageLayer default name: 'Average'
]

{ #category : #tests }
KMergeLayersTest >> testConcatenateLayer [
	self assertInstanceClass: KConcatenateLayer default name: 'Concatenate'
]

{ #category : #tests }
KMergeLayersTest >> testDotLayer [
	self assertInstanceClass: (KDotLayer axis: -1) name: 'Dot'
]

{ #category : #tests }
KMergeLayersTest >> testDotMultiAxesLayer [
	self assertInstanceClass: (KDotLayer axes: #(-1 1)) name: 'Dot'
]

{ #category : #tests }
KMergeLayersTest >> testDotSingleAxisOnListLayer [
	self assertInstanceClass: (KDotLayer axes: #(-1)) name: 'Dot'
]

{ #category : #tests }
KMergeLayersTest >> testMaximumLayer [
	self assertInstanceClass: KMaximumLayer default name: 'Maximum'
]

{ #category : #tests }
KMergeLayersTest >> testMinimumLayer [
	self assertInstanceClass: KMinimumLayer default name: 'Minimum'
]

{ #category : #tests }
KMergeLayersTest >> testMultiplyLayer [
	self assertInstanceClass: KMultiplyLayer default name: 'Multiply'
]

{ #category : #tests }
KMergeLayersTest >> testSubstractLayer [
	self assertInstanceClass: KSubtractLayer default name: 'Subtract'
]

{ #category : #tests }
KMergeLayersTest >> testUseAddLayer [
	| kvar1 kvar2 layerTensor |
	kvar1 := KBackend variable: (KNpArray on: #(-1 2)).
	kvar2 := KBackend variable: (KNpArray on: #(3 4)).
	layerTensor := KAddLayer default tensors: (Array with: kvar1 with: kvar2).
	self cfSend.
	self cf << ((KBackend eval: layerTensor) => #tolist callWith: #()).
	self 
		assert: self cfSend waitForValue
		equals: #(2.0 6.0)
]
