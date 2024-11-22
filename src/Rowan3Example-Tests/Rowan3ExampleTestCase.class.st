"
I test the example class
"
Class {
	#name : 'Rowan3ExampleTestCase',
	#superclass : 'TestCase',
	#category : 'Rowan3Example-Tests'
}

{ #category : 'tests' }
Rowan3ExampleTestCase >> test [  self assert: Rowan3ExampleClass1 new foo = 1
]
