!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:23:50'!
test03WhenMarsRoverExecutesForwardCommandWithNorthCardinalPositionMovesOnePositionAhead

	marsRover executeCommand: 'f'.
	self deny: (marsRover coordinatePointPosition = (0@0)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:23:50'!
test04WhenMarsRoverExecutesBackwardsCommandWithNorthCardinalPositionMovesOnePositionBackwards
	
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:23:50'!
test27

	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (1@0)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:23:50'!
test28

	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (-1@0)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:38:47'!
test29

	self executeACommand: 'r' forANumberOfTimes: 2.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:38:52'!
test30

	self executeACommand: 'r' forANumberOfTimes: 2.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@1)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:38:58'!
test31

	self executeACommand: 'r' forANumberOfTimes: 3.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (-1@0)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:39:05'!
test32

	self executeACommand: 'r' forANumberOfTimes: 3.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (1@0)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:23:50'!
test33

	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (-1@0)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:23:50'!
test34
	
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (1@0)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:39:16'!
test35

	self executeACommand: 'l' forANumberOfTimes: 2.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:39:23'!
test36

	self executeACommand: 'l' forANumberOfTimes: 2.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@1)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:39:53'!
test37

	self executeACommand: 'l' forANumberOfTimes: 3.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (1@0)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:40:25'!
test38

	self executeACommand: 'l' forANumberOfTimes: 3.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (-1@0)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:40:35'!
test39

	self executeACommand: 'l' forANumberOfTimes: 4.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (0@1)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:40:43'!
test40

	self executeACommand: 'l' forANumberOfTimes: 4.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:40:49'!
test41

	self executeACommand: 'r' forANumberOfTimes: 4.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (0@1)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:40:54'!
test42

	self executeACommand: 'r' forANumberOfTimes: 4.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !


!MarsRoverTests methodsFor: 'errorHandling' stamp: 'CS 5/28/2022 13:23:50'!
test43WhenMarsRoverReceivesAnIncorrectCommandDoesNotExecuteIt

	marsRover executeCommand: 'k'.

	self assert: (marsRover coordinatePointPosition = (0@0)).! !

!MarsRoverTests methodsFor: 'errorHandling' stamp: 'CS 5/28/2022 13:23:50'!
test44WhenMarsRoverMovesUntilItReceivesAnIncorrectCommand

	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'f'.
	marsRover executeCommand: ''.

	self assert: (marsRover coordinatePointPosition = (1@0)).
	self assert: (marsRover cardinalPointPosition = 'E').! !


!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:23:49'!
test05WhenMarsRoverExecutesRightCommandWithNorthCardinalPositionChangesToEastCoordinate
	
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'E').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:23:50'!
test06WhenMarsRoverExecutesLeftCommandWithNorthCardinalPositionChangesToWestCoordinate


	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'W').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:35:11'!
test07
	
	self executeACommand: 'r' forANumberOfTimes: 2.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:35:35'!
test08

	self executeACommand: 'l' forANumberOfTimes: 2.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:23:49'!
test09

	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:23:50'!
test10

	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:35:47'!
test11

	self executeACommand: 'r' forANumberOfTimes: 3.
	self assert: (marsRover cardinalPointPosition = 'W').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:36:04'!
test12
	
	self executeACommand: 'l' forANumberOfTimes: 3.
	self assert: (marsRover cardinalPointPosition = 'E').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:36:11'!
test13

	self executeACommand: 'r' forANumberOfTimes: 2.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'E').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:36:33'!
test14

	marsRover executeCommand: 'r'.
	self executeACommand: 'l' forANumberOfTimes: 2.
	self assert: (marsRover cardinalPointPosition = 'W').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:36:38'!
test15

	marsRover executeCommand: 'l'.
	self executeACommand: 'r' forANumberOfTimes: 2.
	self assert: (marsRover cardinalPointPosition = 'E').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:36:43'!
test16

	self executeACommand: 'l' forANumberOfTimes: 2.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'W').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:36:53'!
test17

	self executeACommand: 'l' forANumberOfTimes: 4.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:37:01'!
test18

	self executeACommand: 'r' forANumberOfTimes: 4.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:37:13'!
test19

	marsRover executeCommand: 'r'.
	self executeACommand: 'l' forANumberOfTimes: 3.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:37:33'!
test20

	marsRover executeCommand: 'l'.
	self executeACommand: 'r' forANumberOfTimes: 3.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:37:42'!
test21

	self executeACommand: 'l' forANumberOfTimes: 2.
	self executeACommand: 'r' forANumberOfTimes: 2.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:37:49'!
test22

	self executeACommand: 'r' forANumberOfTimes: 2.
	self executeACommand: 'l' forANumberOfTimes: 2.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:38:00'!
test23
	
	self executeACommand: 'l' forANumberOfTimes: 3.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:38:09'!
test24

	self executeACommand: 'r' forANumberOfTimes: 3.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:23:50'!
test25

	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/28/2022 13:23:50'!
test26

	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'N').! !


!MarsRoverTests methodsFor: 'setUp' stamp: 'CS 5/28/2022 13:23:50'!
setUp
	marsRover := MarsRover createMarsRover.! !


!MarsRoverTests methodsFor: 'private' stamp: 'CS 5/28/2022 13:35:11'!
executeACommand: aCommand forANumberOfTimes: amountOfTimes 
	amountOfTimes timesRepeat: [ marsRover executeCommand: aCommand].! !


!MarsRoverTests methodsFor: 'initialization' stamp: 'CS 5/28/2022 13:23:50'!
test01WhenMarsRoverIsCreatedStartsInZeroPosition
	
	self assert: (marsRover coordinatePointPosition = (0@0)).! !

!MarsRoverTests methodsFor: 'initialization' stamp: 'CS 5/28/2022 13:23:49'!
test02WhenMarsRoverIsCreatedStartsInNorthCardinalPosition
	
	self assert: (marsRover cardinalPointPosition = 'N').! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'pointPosition cardinalPosition degrees validCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'commandValidation' stamp: 'CS 5/28/2022 13:03:01'!
validateCommand: aCommand
	validCommands do: [ :command | command = aCommand ifTrue: [^ true.]].
	^ false.! !


!MarsRover methodsFor: 'position' stamp: 'CS 5/28/2022 11:03:10'!
cardinalPointPosition
	^ cardinalPosition.! !

!MarsRover methodsFor: 'position' stamp: 'CS 5/28/2022 11:02:25'!
coordinatePointPosition
	^ pointPosition.! !


!MarsRover methodsFor: 'private' stamp: 'CS 5/28/2022 13:49:04'!
rotateDegree: aDegree

	self updateDegreeAccordingToRotation: aDegree .
	self updateCompleteCycle.! !

!MarsRover methodsFor: 'private' stamp: 'CS 5/28/2022 12:02:14'!
updateCardinalPosition
	degrees = 0 ifTrue: [cardinalPosition := 'N'].
	
	degrees = 90 ifTrue: [cardinalPosition := 'E'].
	degrees = 180 ifTrue: [cardinalPosition := 'S'].
	degrees = 270 ifTrue: [cardinalPosition := 'W'].
	
	degrees = -90 ifTrue: [cardinalPosition := 'W'].
	degrees = -180 ifTrue: [cardinalPosition := 'S'].
	degrees = -270 ifTrue: [cardinalPosition := 'E'].! !

!MarsRover methodsFor: 'private' stamp: 'CS 5/28/2022 13:47:14'!
updateCompleteCycle
	((degrees = 360) or: (degrees = -360)) ifTrue: [ degrees := 0].! !

!MarsRover methodsFor: 'private' stamp: 'CS 5/28/2022 13:49:03'!
updateDegreeAccordingToRotation: aDegree
	degrees := degrees + aDegree.! !

!MarsRover methodsFor: 'private' stamp: 'CS 5/28/2022 13:54:10'!
updatePointPosition: aCommand

	| actualCardinalPosition |
	actualCardinalPosition := self cardinalPointPosition.
	actualCardinalPosition = 'N' ifTrue: [
		aCommand = 'f' ifTrue: [pointPosition := (0@1)] ifFalse: [pointPosition := (0@-1)].
	].
	actualCardinalPosition = 'E' ifTrue: [
		aCommand = 'f' ifTrue: [pointPosition := (1@0)] ifFalse: [pointPosition := (-1@0)].
	].
	actualCardinalPosition = 'S' ifTrue: [
		aCommand = 'f' ifTrue: [pointPosition := (0@-1)] ifFalse: [pointPosition := (0@1)].
	].
	actualCardinalPosition = 'W' ifTrue: [
		aCommand = 'f' ifTrue: [pointPosition := (-1@0)] ifFalse: [pointPosition := (1@0)].
	].! !


!MarsRover methodsFor: 'commandExecution' stamp: 'CS 5/28/2022 13:44:54'!
executeCommand: aCommand

	(self validateCommand: aCommand) ifTrue: [
		
		self updatePointPosition: aCommand.
		aCommand = 'r' ifTrue: [
			self rotateDegree: 90.
		].
		aCommand = 'l' ifTrue: [
			self rotateDegree: -90.
		].
		self updateCardinalPosition.
	].
	! !


!MarsRover methodsFor: 'initialize' stamp: 'CS 5/28/2022 12:57:49'!
initializePosition
	pointPosition := (0@0).
	cardinalPosition := 'N'.
	degrees := 0.
	validCommands := OrderedCollection new.
	validCommands add: 'r'.
	validCommands add: 'l'.
	validCommands add: 'f'.
	validCommands add: 'b'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 10:55:55'!
createMarsRover
	^ (MarsRover new) initializePosition. "preguntar porque no podemos usar el mensaje initialize"! !
