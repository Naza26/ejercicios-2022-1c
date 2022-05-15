!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'tests' stamp: 'CS 5/14/2022 14:53:01'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
		
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'tests' stamp: 'CS 5/11/2022 14:40:17'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'tests' stamp: 'CS 5/11/2022 14:41:10'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'tests' stamp: 'CS 5/11/2022 15:12:02'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'tests' stamp: 'CS 5/11/2022 15:12:34'!
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

!OOStackTest methodsFor: 'tests' stamp: 'CS 5/11/2022 15:13:37'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.! !

!OOStackTest methodsFor: 'tests' stamp: 'CS 5/12/2022 19:41:43'!
test07TopDoesNotRemoveObjectFromStack


	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	
	stack top.
	
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'tests' stamp: 'CS 5/12/2022 19:42:30'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	
	self
	
		should: [ stack pop ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!OOStackTest methodsFor: 'tests' stamp: 'CS 5/12/2022 19:33:26'!
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

!OOStackTest methodsFor: 'tests' stamp: 'CS 5/12/2022 19:42:58'!
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
	instanceVariableNames: 'stack finder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'NR 5/15/2022 10:13:41'!
HandleFinderExceptionErrorGiven: aPrefix

	self
		should: [ finder find: aPrefix at: stack]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = SentenceFinderByPrefix stackDidNotFindWordErrorDescription].! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'NR 5/15/2022 10:24:46'!
assertOriginalStackStateValues

	self assert: (stack pop) equals: 'Winter is here'.
	self assert: (stack pop) equals: 'The winds of Winter'.
	self assert: (stack pop) equals: 'winning is everything'.
	self assert: (stack pop) equals: 'winter is coming'.! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'NR 5/15/2022 10:24:16'!
assertionAgainstFoundAndExpectedSentencesIsSuccessfullyAccomplished 

	| sentencesWithThePrefix sentenceExpected |
	
	sentencesWithThePrefix := finder find: 'Wint' at: stack.
	sentenceExpected := OrderedCollection with: 'Winter is here'. 

	self assert: sentencesWithThePrefix equals: sentenceExpected. 
! !


!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'NR 5/15/2022 10:12:57'!
setUp
	
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 10:24:16'!
test01FinderReturnsTheDesiredSentence
	
	self assertionAgainstFoundAndExpectedSentencesIsSuccessfullyAccomplished.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 10:24:46'!
test02TheStackRemainesInItsOriginalStateAfterFindingSentence

	self assertionAgainstFoundAndExpectedSentencesIsSuccessfullyAccomplished.
	self assertOriginalStackStateValues.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 10:10:00'!
test03TheFinderShouldRaiseExceptionIfTheSentenceIsNotFound
	
	self HandleFinderExceptionErrorGiven: 'Sum'.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 10:13:20'!
test04TheFinderShouldBeCaseSensitive
	
	| sentencesWithThePrefix sentenceExpected |
	
	sentencesWithThePrefix := finder find: 'wint' at: stack.
	sentenceExpected := OrderedCollection with: 'Winter is here'. 

	self deny: sentencesWithThePrefix = sentenceExpected. 
		! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 10:10:00'!
test05TheFinderShouldRaiseExceptionIfThePrefixIsEmpty

	self HandleFinderExceptionErrorGiven: ''.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 10:10:00'!
test06TheFinderShouldRaiseExceptionIfThePrefixContainsABlankSpace

	self HandleFinderExceptionErrorGiven: 'Wint '.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 10:28:14'!
test07TheFinderReturnsAllTheSentencesThatHaveTheCorrectPrefix
	
	| sentencesWithThePrefix sentencesExpected |
	
	stack push: 'Winterfell'.
	
	sentencesWithThePrefix := finder find: 'Wint' at: stack.
	
	sentencesExpected := OrderedCollection with: 'Winterfell'.
	sentencesExpected add: 'Winter is here'.  

	self assert: sentencesWithThePrefix equals: sentencesExpected.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'CS 5/11/2022 15:01:55'!
isEmpty
	^ stack size = 0.! !


!OOStack methodsFor: 'private' stamp: 'CS 5/11/2022 15:05:37'!
initialize
	stack := OrderedCollection new.! !

!OOStack methodsFor: 'private' stamp: 'NR 5/15/2022 10:00:14'!
performError
	^ self error: self class stackEmptyErrorDescription.! !


!OOStack methodsFor: 'stack operations' stamp: 'CS 5/14/2022 12:58:32'!
peekLastElement
	^ stack last.! !

!OOStack methodsFor: 'stack operations' stamp: 'CS 5/14/2022 19:01:07'!
performPeekOperation
	^ stack last.! !

!OOStack methodsFor: 'stack operations' stamp: 'CS 5/14/2022 19:01:19'!
performRemovalOperation
	^ stack removeLast.! !

!OOStack methodsFor: 'stack operations' stamp: 'CS 5/14/2022 18:57:28'!
pop
	| stateOfStack |
	stateOfStack := State subclasses detect: [: subclass |  (subclass isTypeOfState: self) ].
	^ (stateOfStack new) pop: self. ! !

!OOStack methodsFor: 'stack operations' stamp: 'CS 5/11/2022 15:08:29'!
push: aValue
	stack add: aValue.! !

!OOStack methodsFor: 'stack operations' stamp: 'CS 5/14/2022 12:29:36'!
removeLastElement
	^ stack removeLast.! !

!OOStack methodsFor: 'stack operations' stamp: 'CS 5/11/2022 15:36:09'!
size
	^ stack size.! !

!OOStack methodsFor: 'stack operations' stamp: 'CS 5/14/2022 18:57:41'!
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

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CS 5/14/2022 16:51:35'!
findSentencesGiven: aPrefix in: aStack withTheHelpOf: anotherStack

	| value valueFound |
	
	valueFound := OrderedCollection new.
	
	[aStack isEmpty] whileFalse: [
		value := aStack pop.
		(self is: value FoundBy: aPrefix) ifTrue: [valueFound add: value].
		anotherStack push: value.
	].

	^ valueFound.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CS 5/14/2022 14:15:37'!
is: aSentence FoundBy: aPrefix  

	^ (aSentence beginsWith: aPrefix). 

	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CS 5/14/2022 18:54:49'!
reverse: aStack ToOriginalStateWith: anotherStack 
	| value |
	
	[anotherStack isEmpty] whileFalse: [
		value := anotherStack pop.
		aStack push: value.
	].! !


!SentenceFinderByPrefix methodsFor: 'finder' stamp: 'NR 5/15/2022 10:28:36'!
find: aPrefix at: aStack

	| auxStack valueFound |
	
	auxStack := OOStack new. 
	valueFound := OrderedCollection new.
	
	aPrefix isEmpty ifTrue: [^ self error: self class stackDidNotFindWordErrorDescription].

	valueFound := self findSentencesGiven: aPrefix in: aStack withTheHelpOf: auxStack.
	self reverse: aStack ToOriginalStateWith: auxStack.
	
	(valueFound isEmpty) ifTrue: [ ^ self error: self class stackDidNotFindWordErrorDescription].
	
	^ valueFound.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'NR 5/15/2022 10:05:22'!
stackDidNotFindWordErrorDescription
	^ 'Stack did not found word'! !


!classDefinition: #State category: 'Stack-Exercise'!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!State methodsFor: 'state orders' stamp: 'NR 5/15/2022 10:03:09'!
pop
	self subclassResponsibility.! !

!State methodsFor: 'state orders' stamp: 'NR 5/15/2022 10:03:21'!
top

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'State class' category: 'Stack-Exercise'!
State class
	instanceVariableNames: ''!

!State class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 12:17:32'!
isEmpty: aStack
	self subclassResponsibility.! !

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

!EmptyStackState methodsFor: 'state orders' stamp: 'NR 5/15/2022 10:00:14'!
pop: aStack

	^ aStack performError.! !

!EmptyStackState methodsFor: 'state orders' stamp: 'NR 5/15/2022 10:00:14'!
top: aStack

	^ aStack 	performError.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStackState class' category: 'Stack-Exercise'!
EmptyStackState class
	instanceVariableNames: ''!

!EmptyStackState class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 12:51:53'!
isEmpty: aStack
	^ aStack size = 0.! !

!EmptyStackState class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 18:57:41'!
isTypeOfState: aStack
	^ aStack size = 0.! !

!EmptyStackState class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 13:01:00'!
pop: aStack

	^self error: aStack class stackEmptyErrorDescription.! !

!EmptyStackState class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 13:02:54'!
top: aStack

	"ESTO ES CODIGO REPETIDO COMO LO SACAMOS? ES SELF O ASTACK?"
	^ self error: aStack class stackEmptyErrorDescription.! !


!classDefinition: #NotEmptyStackState category: 'Stack-Exercise'!
State subclass: #NotEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStackState methodsFor: 'state orders' stamp: 'CS 5/14/2022 19:01:19'!
pop: aStack
	
	^ aStack performRemovalOperation.! !

!NotEmptyStackState methodsFor: 'state orders' stamp: 'CS 5/14/2022 19:01:08'!
top: aStack
	^ aStack performPeekOperation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStackState class' category: 'Stack-Exercise'!
NotEmptyStackState class
	instanceVariableNames: ''!

!NotEmptyStackState class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 12:52:01'!
isEmpty: aStack
	^ aStack size > 0.! !

!NotEmptyStackState class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 18:57:25'!
isTypeOfState: aStack
	^ aStack isEmpty not.! !

!NotEmptyStackState class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 13:01:00'!
pop: aStack
	
	^ aStack removeLastElement.! !

!NotEmptyStackState class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 13:00:09'!
top: aStack
	^ aStack peekLastElement.! !
