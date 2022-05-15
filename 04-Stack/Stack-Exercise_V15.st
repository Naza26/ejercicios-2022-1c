!classDefinition: #LimitedOOStackTest category: 'Stack-Exercise'!
TestCase subclass: #LimitedOOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!LimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:58:53'!
test01LimitedStackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack createALimitedOOStackWith: 5.
		
	self assert: stack isEmpty! !

!LimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:59:49'!
test02PushAddElementsToTheLimitedStack

	| stack |
	
	stack := OOStack createALimitedOOStackWith: 5.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!LimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 17:35:21'!
test03PopRemovesElementsFromTheLimitedStack

	| stack |
	
	stack := OOStack createALimitedOOStackWith: 5.
	
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!LimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 17:35:31'!
test04PopReturnsLastPushedObjectFromLimitedStack

	| stack pushedObject |
	
	stack := OOStack createALimitedOOStackWith: 5.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!LimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 17:35:39'!
test05LimitedStackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack createALimitedOOStackWith: 5.
	
	firstPushedObject := 'first'.
	
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	
	self assert: stack pop = firstPushedObject.
	
	self assert: stack isEmpty! !

!LimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 17:35:44'!
test06TopReturnsLastPushedObjectFromLimitedStack

	| stack pushedObject |
	
	stack := OOStack createALimitedOOStackWith: 5.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.! !

!LimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 17:35:50'!
test07TopDoesNotRemoveObjectFromLimitedStack


	| stack pushedObject |
	
	stack := OOStack createALimitedOOStackWith: 5.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	
	stack top.
	
	self assert: stack size = 1.
	! !

!LimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 17:35:55'!
test08CanNotPopWhenThereAreNoObjectsInTheLimitedStack

	| stack  |
	
	stack := OOStack createALimitedOOStackWith: 5.
	
	self
	
		should: [ stack pop ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!LimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 17:36:02'!
test09CanNotPopWhenThereAreNoObjectsInTheLimitedStackAndTheStackHadObjects
	
	| stack  |
	
	stack := OOStack createALimitedOOStackWith: 5.
	
	stack push: 'something'.
	
	stack pop.
	
	self should: [ stack pop ]
	
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!LimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 17:36:06'!
test10CanNotTopWhenThereAreNoObjectsInLimitedStack	
	| stack  |
	
	stack := OOStack createALimitedOOStackWith: 5.
	
	self
	
		should: [ stack top ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!LimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 17:46:05'!
test11PushShouldRaiseExceptionIfPushExceedsLimitedStackSize

	| stack |
	
	stack := OOStack createALimitedOOStackWith: 3.
	
	stack push: 'something'.
	stack push: 'another thing'.
	stack push: 'something else'.
	
	
	self
		should: [ stack push: 'im gonna break this'. ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack pushIntoLimitedStackErrorDescription ]! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack finder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'NR 5/15/2022 17:16:10'!
assertCannotFindSentenceErrorGiven: anInvalidPrefix

	self
		should: [ finder find: anInvalidPrefix at: stack]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = SentenceFinderByPrefix prefixCannotBeEmptyErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'NR 5/15/2022 10:24:46'!
assertOriginalStackStateValues

	self assert: (stack pop) equals: 'Winter is here'.
	self assert: (stack pop) equals: 'The winds of Winter'.
	self assert: (stack pop) equals: 'winning is everything'.
	self assert: (stack pop) equals: 'winter is coming'.! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'NR 5/15/2022 17:13:09'!
assertStackDidNotFindWordErrorGiven: aPrefix

	self
		should: [ finder find: aPrefix at: stack]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = SentenceFinderByPrefix stackDidNotFindWordErrorDescription].! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'NR 5/15/2022 10:24:16'!
assertionAgainstFoundAndExpectedSentencesIsSuccessfullyAccomplished 

	| sentencesWithThePrefix sentenceExpected |
	
	sentencesWithThePrefix := finder find: 'Wint' at: stack.
	sentenceExpected := OrderedCollection with: 'Winter is here'. 

	self assert: sentencesWithThePrefix equals: sentenceExpected. 
! !


!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'NR 5/15/2022 17:08:50'!
setUp
	
	stack := OOStack createAnUnlimitedOOStack.
	finder := SentenceFinderByPrefix new.
	
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:17:42'!
test01FinderReturnsTheDesiredSentence
	
	self assertionAgainstFoundAndExpectedSentencesIsSuccessfullyAccomplished.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 10:24:46'!
test02TheStackRemainesInItsOriginalStateAfterFindingSentence

	self assertionAgainstFoundAndExpectedSentencesIsSuccessfullyAccomplished.
	self assertOriginalStackStateValues.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 17:13:32'!
test03TheFinderShouldRaiseExceptionIfTheSentenceIsNotFound
	
	self assertStackDidNotFindWordErrorGiven: 'Sum'.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 10:13:20'!
test04TheFinderShouldBeCaseSensitive
	
	| sentencesWithThePrefix sentenceExpected |
	
	sentencesWithThePrefix := finder find: 'wint' at: stack.
	sentenceExpected := OrderedCollection with: 'Winter is here'. 

	self deny: sentencesWithThePrefix = sentenceExpected. 
		! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 17:16:47'!
test05TheFinderShouldRaiseExceptionIfThePrefixIsEmpty

	self assertCannotFindSentenceErrorGiven: ''.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 17:13:51'!
test06TheFinderShouldRaiseExceptionIfThePrefixContainsABlankSpace

	self assertStackDidNotFindWordErrorGiven: 'Wint '.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NR 5/15/2022 10:28:14'!
test07TheFinderReturnsAllTheSentencesThatHaveTheCorrectPrefix
	
	| sentencesWithThePrefix sentencesExpected |
	
	stack push: 'Winterfell'.
	
	sentencesWithThePrefix := finder find: 'Wint' at: stack.
	
	sentencesExpected := OrderedCollection with: 'Winterfell'.
	sentencesExpected add: 'Winter is here'.  

	self assert: sentencesWithThePrefix equals: sentencesExpected.! !


!classDefinition: #UnlimitedOOStackTest category: 'Stack-Exercise'!
TestCase subclass: #UnlimitedOOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!UnlimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:41:44'!
test01UnlimitedStackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack createAnUnlimitedOOStack.
		
	self assert: stack isEmpty! !

!UnlimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:46:51'!
test02PushAddElementsToTheUnlimitedStack

	| stack |
	
	stack := OOStack createAnUnlimitedOOStack.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!UnlimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:46:39'!
test03PopRemovesElementsFromTheUnlimitedStack

	| stack |
	
	stack := OOStack createAnUnlimitedOOStack.
	
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!UnlimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:46:18'!
test04PopReturnsLastPushedObjectFromUnlimitedStack

	| stack pushedObject |
	
	stack := OOStack createAnUnlimitedOOStack.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!UnlimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:44:30'!
test05UnlimitedStackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack createAnUnlimitedOOStack.
	
	firstPushedObject := 'first'.
	
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	
	self assert: stack pop = firstPushedObject.
	
	self assert: stack isEmpty! !

!UnlimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:46:00'!
test06TopReturnsLastPushedObjectFromUnlimitedStack

	| stack pushedObject |
	
	stack := OOStack createAnUnlimitedOOStack.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.! !

!UnlimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:45:31'!
test07TopDoesNotRemoveObjectFromUnlimitedStack


	| stack pushedObject |
	
	stack := OOStack createAnUnlimitedOOStack.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	
	stack top.
	
	self assert: stack size = 1.
	! !

!UnlimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:45:17'!
test08CanNotPopWhenThereAreNoObjectsInTheUnlimitedStack

	| stack  |
	
	stack := OOStack createAnUnlimitedOOStack.
	
	self
	
		should: [ stack pop ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!UnlimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:47:40'!
test09CanNotPopWhenThereAreNoObjectsInTheUnlimitedStackAndTheStackHadObjects
	
	| stack  |
	
	stack := OOStack createAnUnlimitedOOStack.
	
	stack push: 'something'.
	
	stack pop.
	
	self should: [ stack pop ]
	
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!UnlimitedOOStackTest methodsFor: 'tests' stamp: 'NR 5/15/2022 16:47:52'!
test10CanNotTopWhenThereAreNoObjectsInTheUnlimitedStack

	| stack  |
	
	stack := OOStack createAnUnlimitedOOStack.
	
	self
	
		should: [ stack top ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'CS 5/11/2022 15:01:55'!
isEmpty
	^ stack size = 0.! !


!OOStack methodsFor: 'private' stamp: 'NR 5/15/2022 16:27:40'!
getStateOfStack
	^StateOfOOStack subclasses detect: [: subclass |  (subclass isTypeOfState: self) ].! !

!OOStack methodsFor: 'private' stamp: 'NR 5/15/2022 16:55:23'!
initialize
	self subclassResponsibility.! !

!OOStack methodsFor: 'private' stamp: 'NR 5/15/2022 16:08:46'!
throwEmptyStackError
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

!OOStack methodsFor: 'stack operations' stamp: 'NR 5/15/2022 16:28:08'!
pop
	| stateOfStack |
	stateOfStack := self getStateOfStack.
	^ (stateOfStack new) pop: self. ! !

!OOStack methodsFor: 'stack operations' stamp: 'NR 5/15/2022 17:37:56'!
push: aValue
	self subclassResponsibility.! !

!OOStack methodsFor: 'stack operations' stamp: 'CS 5/14/2022 12:29:36'!
removeLastElement
	^ stack removeLast.! !

!OOStack methodsFor: 'stack operations' stamp: 'CS 5/11/2022 15:36:09'!
size
	^ stack size.! !

!OOStack methodsFor: 'stack operations' stamp: 'NR 5/15/2022 16:28:23'!
top
	| stateOfStack |
	stateOfStack := self getStateOfStack.
	^ (stateOfStack new) top: self.! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'NR 5/15/2022 17:27:19'!
initializeWith: aSize

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: 'stack'!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 5/15/2022 17:19:09'!
pushIntoLimitedStackErrorDescription

	^ 'Stack is full. Cannot push this element!!'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'CS 5/11/2022 14:57:44'!
stackEmptyErrorDescription

	^ 'Stack is empty'! !


!OOStack class methodsFor: 'initialization' stamp: 'NR 5/15/2022 17:29:26'!
createALimitedOOStackWith: maxSize

	^(LimitedOOStack new) initializeWith: maxSize.
	! !

!OOStack class methodsFor: 'initialization' stamp: 'NR 5/15/2022 16:35:32'!
createAnUnlimitedOOStack

	^UnlimitedOOStack new.! !


!classDefinition: #LimitedOOStack category: 'Stack-Exercise'!
OOStack subclass: #LimitedOOStack
	instanceVariableNames: 'maxSize contador'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!LimitedOOStack methodsFor: 'as yet unclassified' stamp: 'NR 5/15/2022 17:34:34'!
initialize
	stack := OrderedCollection new.! !

!LimitedOOStack methodsFor: 'as yet unclassified' stamp: 'NR 5/15/2022 17:39:16'!
initializeWith: aSize
	contador := 0.
	maxSize := aSize.! !

!LimitedOOStack methodsFor: 'as yet unclassified' stamp: 'NR 5/15/2022 17:45:43'!
push: aValue
	(contador >= maxSize) ifTrue: [ self error: self class pushIntoLimitedStackErrorDescription ].
	contador := contador + 1.
	stack add: aValue.! !


!classDefinition: #UnlimitedOOStack category: 'Stack-Exercise'!
OOStack subclass: #UnlimitedOOStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!UnlimitedOOStack methodsFor: 'as yet unclassified' stamp: 'NR 5/15/2022 16:55:09'!
initialize
	stack := OrderedCollection new.! !

!UnlimitedOOStack methodsFor: 'as yet unclassified' stamp: 'NR 5/15/2022 17:27:51'!
initializeWith: aSize

	nil.! !

!UnlimitedOOStack methodsFor: 'as yet unclassified' stamp: 'NR 5/15/2022 17:38:02'!
push: aValue
	stack add: aValue.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'NR 5/15/2022 17:08:31'!
findSentencesGiven: aPrefix in: aStack

	| value valueFound auxStack |
	
	valueFound := OrderedCollection new.
	auxStack := OOStack createAnUnlimitedOOStack.
	
	[aStack isEmpty] whileFalse: [
		value := aStack pop.
		(self is: value FoundBy: aPrefix) ifTrue: [valueFound add: value].
		auxStack push: value.
	].

	self reverse: aStack ToOriginalStateWith: auxStack.

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


!SentenceFinderByPrefix methodsFor: 'finder' stamp: 'NR 5/15/2022 17:10:42'!
find: aPrefix at: aStack

	| sentencesFound |
	
	sentencesFound := OrderedCollection new.
	
	aPrefix isEmpty ifTrue: [^ self error: self class prefixCannotBeEmptyErrorDescription].

	sentencesFound := self findSentencesGiven: aPrefix in: aStack.
	
	(sentencesFound isEmpty) ifTrue: [ ^ self error: self class stackDidNotFindWordErrorDescription].
	
	^ sentencesFound.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'NR 5/15/2022 17:10:11'!
prefixCannotBeEmptyErrorDescription
	^ 'Prefix Can Not Be Empty'.! !

!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'NR 5/15/2022 10:05:22'!
stackDidNotFindWordErrorDescription
	^ 'Stack did not found word'! !


!classDefinition: #StateOfOOStack category: 'Stack-Exercise'!
Object subclass: #StateOfOOStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateOfOOStack methodsFor: 'state orders' stamp: 'NR 5/15/2022 16:20:51'!
pop: aStack

	self subclassResponsibility.! !

!StateOfOOStack methodsFor: 'state orders' stamp: 'NR 5/15/2022 16:01:07'!
top: aStack

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateOfOOStack class' category: 'Stack-Exercise'!
StateOfOOStack class
	instanceVariableNames: ''!

!StateOfOOStack class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 18:57:41'!
isTypeOfState: aStack
	self subclassResponsibility.! !


!classDefinition: #EmptyStackState category: 'Stack-Exercise'!
StateOfOOStack subclass: #EmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackState methodsFor: 'state orders' stamp: 'NR 5/15/2022 16:08:46'!
pop: aStack

	^ aStack throwEmptyStackError.! !

!EmptyStackState methodsFor: 'state orders' stamp: 'NR 5/15/2022 16:08:46'!
top: aStack

	^ aStack 	throwEmptyStackError.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStackState class' category: 'Stack-Exercise'!
EmptyStackState class
	instanceVariableNames: ''!

!EmptyStackState class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 18:57:41'!
isTypeOfState: aStack
	^ aStack size = 0.! !


!classDefinition: #NotEmptyStackState category: 'Stack-Exercise'!
StateOfOOStack subclass: #NotEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStackState methodsFor: 'state orders' stamp: 'CS 5/14/2022 19:01:19'!
pop: aStack
	
	^ aStack performRemovalOperation.! !

!NotEmptyStackState methodsFor: 'state orders' stamp: 'NR 5/15/2022 16:22:14'!
top: aStack

	^ aStack performPeekOperation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStackState class' category: 'Stack-Exercise'!
NotEmptyStackState class
	instanceVariableNames: ''!

!NotEmptyStackState class methodsFor: 'as yet unclassified' stamp: 'CS 5/14/2022 18:57:25'!
isTypeOfState: aStack
	^ aStack isEmpty not.! !
