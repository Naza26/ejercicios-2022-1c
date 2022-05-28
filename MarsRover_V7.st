!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 11:07:01'!
test01WhenMarsRoverIsCreatedStartsInZeroPosition
	| marsRover |
	marsRover := MarsRover createMarsRover.
	self assert: (marsRover coordinatePointPosition = (0@0)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 11:07:27'!
test02WhenMarsRoverIsCreatedStartsInNorthCardinalPosition
	| marsRover |
	marsRover := MarsRover createMarsRover.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 11:09:33'!
test03WhenMarsRoverExecutesForwardCommandWithNorthCardinalPositionMovesOnePositionAhead
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'f'.
	self deny: (marsRover coordinatePointPosition = (0@0)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 11:12:48'!
test04WhenMarsRoverExecutesBackwardsCommandWithNorthCardinalPositionMovesOnePositionBackwards
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 11:20:29'!
test05WhenMarsRoverExecutesRightCommandWithNorthCardinalPositionChangesToEastCoordinate
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'E').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 11:21:13'!
test06WhenMarsRoverExecutesLeftCommandWithNorthCardinalPositionChangesToWestCoordinate

	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'W').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 11:56:02'!
test07
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:02:42'!
test08
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:03:17'!
test09
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:04:45'!
test10
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:04:34'!
test11
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'W').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:05:02'!
test12
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'E').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:06:23'!
test13
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'E').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:06:55'!
test14
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'W').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:07:44'!
test15
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'E').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:10:30'!
test16
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'W').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:12:32'!
test17
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:12:58'!
test18
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:15:04'!
test19
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:15:24'!
test20
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:16:36'!
test21
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:17:10'!
test22
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:21:15'!
test23
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:21:28'!
test24
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:23:32'!
test25
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:23:13'!
test26
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:32:05'!
test27
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (1@0)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:40:50'!
test28
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (-1@0)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:41:38'!
test29
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:41:47'!
test30
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@1)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:43:16'!
test31
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (-1@0)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:43:24'!
test32
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (1@0)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:45:34'!
test33
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (-1@0)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:45:44'!
test34
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (1@0)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:46:16'!
test35
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:46:23'!
test36
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@1)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:46:51'!
test37
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (1@0)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:47:01'!
test38
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (-1@0)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:47:59'!
test39
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (0@1)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:48:08'!
test40
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:48:37'!
test41
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (0@1)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:48:46'!
test42
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:51:29'!
test43WhenMarsRoverReceivesAnIncorrectCommandDoesNotExecuteIt
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'k'.

	self assert: (marsRover coordinatePointPosition = (0@0)).! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 13:11:07'!
test44WhenMarsRoverMovesUntilItReceivesAnIncorrectCommand
	| marsRover |
	marsRover := MarsRover createMarsRover.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'f'.
	marsRover executeCommand: ''.

	self assert: (marsRover coordinatePointPosition = (1@0)).
	self assert: (marsRover cardinalPointPosition = 'E').! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'pointPosition cardinalPosition degrees validCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 11:03:10'!
cardinalPointPosition
	^ cardinalPosition.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 11:02:25'!
coordinatePointPosition
	^ pointPosition.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 13:04:16'!
executeCommand: aCommand

	(self validateCommand: aCommand) ifTrue: [
		
		self updatePointPosition: aCommand.
		aCommand = 'r' ifTrue: [
			degrees := degrees + 90.
			degrees = 360 ifTrue: [ degrees := 0].
			self updateCardinalPosition.
		].
		aCommand = 'l' ifTrue: [
			degrees := degrees - 90.
			degrees = -360 ifTrue: [ degrees := 0 ].
			self updateCardinalPosition.
		].
	].
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:33:29'!
getCardinalCoordinate
	^ cardinalPosition.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:57:49'!
initializePosition
	pointPosition := (0@0).
	cardinalPosition := 'N'.
	degrees := 0.
	validCommands := OrderedCollection new.
	validCommands add: 'r'.
	validCommands add: 'l'.
	validCommands add: 'f'.
	validCommands add: 'b'.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:02:14'!
updateCardinalPosition
	degrees = 0 ifTrue: [cardinalPosition := 'N'].
	
	degrees = 90 ifTrue: [cardinalPosition := 'E'].
	degrees = 180 ifTrue: [cardinalPosition := 'S'].
	degrees = 270 ifTrue: [cardinalPosition := 'W'].
	
	degrees = -90 ifTrue: [cardinalPosition := 'W'].
	degrees = -180 ifTrue: [cardinalPosition := 'S'].
	degrees = -270 ifTrue: [cardinalPosition := 'E'].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 12:44:33'!
updatePointPosition: aCommand

	| actualCardinalPosition |
	actualCardinalPosition := self getCardinalCoordinate.
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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 13:03:01'!
validateCommand: aCommand
	validCommands do: [ :command | command = aCommand ifTrue: [^ true.]].
	^ false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'CS 5/28/2022 10:55:55'!
createMarsRover
	^ (MarsRover new) initializePosition. "preguntar porque no podemos usar el mensaje initialize"! !
