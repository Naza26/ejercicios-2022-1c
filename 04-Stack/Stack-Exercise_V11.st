!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'CS 5/14/2022 14:53:01'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
		
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'CS 5/11/2022 14:40:17'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'CS 5/11/2022 14:41:10'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'CS 5/11/2022 15:12:02'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'CS 5/11/2022 15:12:34'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	
	firstPushedObject := 'first'.
	
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	
	self assert: stack pop = firstPushedObject.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'CS 5/11/2022 15:13:37'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.! !

!OOStackTest methodsFor: 'test' stamp: 'CS 5/12/2022 19:41:43'!
test07TopDoesNotRemoveObjectFromStack


	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	
	stack top.
	
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'CS 5/12/2022 19:42:30'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	
	self
	
		should: [ stack pop ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!OOStackTest methodsFor: 'test' stamp: 'CS 5/12/2022 19:33:26'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects
	
	| stack  |
	
	stack := OOStack new.
	
	stack push: 'something'.
	
	stack pop.
	
	self should: [ stack pop ]
	
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!OOStackTest methodsFor: 'test' stamp: 'CS 5/12/2022 19:42:58'!
test10CanNotTopWhenThereAreNoObjectsInTheStack	
	| stack  |
	
	stack := OOStack new.
	
	self
	
		should: [ stack top ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stackToTest finderToTest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'CS 5/14/2022 13:57:29'!
HandleExceptionErrorWith: aPrefix

	self
		should: [ finderToTest find: aPrefix at: stackToTest]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = SentenceFinderByPrefix stackNotFoundWordErrorDescription].! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'CS 5/14/2022 17:47:11'!
ListOfSentencesWithThePrefixIsCreatedSuccessful 

	| sentencesWithThePrefix sentenceExpected |
	
	sentencesWithThePrefix := finderToTest find: 'Wint' at: stackToTest.
	sentenceExpected := OrderedCollection with: 'Winter is here'. 

	self assert: sentencesWithThePrefix equals: sentenceExpected. 
! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'CS 5/14/2022 13:59:55'!
originalStackStateValues

	self assert: (stackToTest pop) equals: 'Winter is here'.
	self assert: (stackToTest pop) equals: 'The winds of Winter'.
	self assert: (stackToTest pop) equals: 'winning is everything'.
	self assert: (stackToTest pop) equals: 'winter is coming'.! !


!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'CS 5/14/2022 18:03:42'!
setUp
	
	stackToTest := OOStack new.
	finderToTest := SentenceFinderByPrefix new.
	
	stackToTest push: 'winter is coming'.
	stackToTest push: 'winning is everything'.
	stackToTest push: 'The winds of Winter'.
	stackToTest push: 'Winter is here'.
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CS 5/14/2022 17:47:26'!
test01ReturnsTheDesiredSentence
	
	self ListOfSentencesWithThePrefixIsCreatedSuccessful.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CS 5/14/2022 17:47:23'!
test02TheStackRemainesInItsOriginalStateAfterFindingSentence

	self ListOfSentencesWithThePrefixIsCreatedSuccessful.
	self originalStackStateValues.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CS 5/14/2022 13:58:41'!
test03TheFinderShouldRaiseExceptionIfTheSentenceItsNotFound
	
	self HandleExceptionErrorWith: 'Sum'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CS 5/14/2022 18:03:43'!
test04TheFinderShouldBeCaseSensitive
	
	| sentencesWithThePrefix sentenceExpected |
	
	sentencesWithThePrefix := finderToTest find: 'wint' at: stackToTest.
	sentenceExpected := OrderedCollection with: 'Winter is here'. 

	self deny: sentencesWithThePrefix = sentenceExpected. 
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CS 5/14/2022 13:57:46'!
test05TheFinderShouldRaiseExceptionIfThePrefixIsEmpty

	self HandleExceptionErrorWith: ''.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CS 5/14/2022 13:58:14'!
test06TheFinderShouldRaiseExceptionIfThePrefixContainsABlankSpace

	self HandleExceptionErrorWith: 'Wint '.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'CS 5/14/2022 17:43:23'!
test07TheFinderReturnsAllTheSentencesThatHaveTheCorrectPrefix
	
	| sentencesWithThePrefix sentenceExpected |
	
	stackToTest push: 'Winterfell'.
	
	sentencesWithThePrefix := finderToTest find: 'Wint' at: stackToTest.
	
	sentenceExpected := OrderedCollection with: 'Winterfell'.
	sentenceExpected add: 'Winter is here'.  

	self assert: sentencesWithThePrefix equals: sentenceExpected. ! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'CS 5/11/2022 15:05:37'!
initialize
	stack := OrderedCollection new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CS 5/11/2022 15:01:55'!
isEmpty
	^ stack size = 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 19:02:20'!
performErrorDescription
	^ self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 19:01:07'!
performPeekOperation
	^ stack last.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 19:01:19'!
performRemovalOperation
	^ stack removeLast.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 18:57:28'!
pop
	| stateOfStack |
	stateOfStack := State subclasses detect: [: subclass |  (subclass isTypeOfState: self) ].
	^ (stateOfStack new) pop: self. ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CS 5/11/2022 15:08:29'!
push: aValue
	stack add: aValue.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CS 5/11/2022 15:36:09'!
size
	^ stack size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CS 5/12/2022 20:46:26'!
stack
	^stack! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 18:57:41'!
top
	| stateOfStack |
	stateOfStack := State subclasses detect: [: subclass |  (subclass isTypeOfState: self) ].
	^ (stateOfStack new) top: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: 'stack'!

!OOStack class methodsFor: 'error descriptions' stamp: 'CS 5/11/2022 14:57:44'!
stackEmptyErrorDescription

	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 18:55:18'!
find: aPrefix at: aStack

	| auxStack valueFound |
	
	auxStack := OOStack new. 
	valueFound := OrderedCollection new.
	
	aPrefix isEmpty ifTrue: [^ self error: self class stackNotFoundWordErrorDescription].

	valueFound := self findSentencesGiven: aPrefix in: aStack withTheHelpOf: auxStack.
	self reverse: aStack ToOriginalStateWith: auxStack.
	
	(valueFound isEmpty) ifTrue: [ ^ self error: self class stackNotFoundWordErrorDescription].
	^ valueFound.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 16:51:35'!
findSentencesGiven: aPrefix in: aStack withTheHelpOf: anotherStack

	| value valueFound |
	
	valueFound := OrderedCollection new.
	
	[aStack isEmpty] whileFalse: [
		value := aStack pop.
		(self is: value FoundBy: aPrefix) ifTrue: [valueFound add: value].
		anotherStack push: value.
	].

	^ valueFound.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 14:15:37'!
is: aSentence FoundBy: aPrefix  

	^ (aSentence beginsWith: aPrefix). 

	
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 18:54:49'!
reverse: aStack ToOriginalStateWith: anotherStack 
	| value |
	
	[anotherStack isEmpty] whileFalse: [
		value := anotherStack pop.
		aStack push: value.
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 13:30:54'!
stackNotFoundWordErrorDescription
	^ 'Stack did not found word'! !


!classDefinition: #State category: 'Stack-Exercise'!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'State class' category: 'Stack-Exercise'!
State class
	instanceVariableNames: ''!

!State class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 18:57:41'!
isTypeOfState: aStack
	self subclassResponsibility.! !

!State class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 13:01:00'!
pop: aStack
	self subclassResponsibility.! !

!State class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 12:58:58'!
top: aStack
	self subclassResponsibility.! !


!classDefinition: #EmptyStackState category: 'Stack-Exercise'!
State subclass: #EmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackState methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 19:02:00'!
pop: aStack

	^ aStack performErrorDescription.! !

!EmptyStackState methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 19:02:49'!
top: aStack

	^ aStack 	performErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStackState class' category: 'Stack-Exercise'!
EmptyStackState class
	instanceVariableNames: ''!

!EmptyStackState class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 18:57:41'!
isTypeOfState: aStack
	^ aStack size = 0.! !


!classDefinition: #NotEmptyStackState category: 'Stack-Exercise'!
State subclass: #NotEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStackState methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 19:01:19'!
pop: aStack
	
	^ aStack performRemovalOperation.! !

!NotEmptyStackState methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 19:01:08'!
top: aStack
	^ aStack performPeekOperation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStackState class' category: 'Stack-Exercise'!
NotEmptyStackState class
	instanceVariableNames: ''!

!NotEmptyStackState class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 18:57:25'!
isTypeOfState: aStack
	^ aStack isEmpty not.! !
