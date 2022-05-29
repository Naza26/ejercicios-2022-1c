!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/29/2022 16:47:14'!
test03WhenMarsRoverExecutesForwardCommandWithNorthCardinalPositionMovesOnePositionAhead

	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (0@1)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/28/2022 13:23:50'!
test04WhenMarsRoverExecutesBackwardsCommandWithNorthCardinalPositionMovesOnePositionBackwards
	
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'coordinatePointTests' stamp: 'CS 5/29/2022 16:13:05'!
test27
	
	self assert: (marsRover coordinatePointPosition = (0@0)). 
	self assert: (marsRover cardinalPointPosition = 'N'). 
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'E'). 
	self assert: (marsRover coordinatePointPosition = (0@0)). 
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


!MarsRoverTests methodsFor: 'errorHandling' stamp: 'CS 5/29/2022 18:01:17'!
test43WhenMarsRoverReceivesAnIncorrectCommandDoesNotExecuteIt

	self
		should: [ marsRover executeCommand: 'k']
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = marsRover class invalidCharacterErrorDescription].! !

!MarsRoverTests methodsFor: 'errorHandling' stamp: 'CS 5/29/2022 18:04:02'!
test44WhenMarsRoverMovesUntilItReceivesAnIncorrectCommand

	self
		should: [ 
			marsRover executeCommand: 'rfx'.
			self assert: (marsRover coordinatePointPosition = (1@0)).
			self assert: (marsRover cardinalPointPosition = 'E').
		]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = marsRover class invalidCharacterErrorDescription].! !


!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:06'!
test05WhenMarsRoverExecutesRightCommandWithNorthCardinalPositionChangesToEastCoordinate
	
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'E').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:05'!
test06WhenMarsRoverExecutesLeftCommandWithNorthCardinalPositionChangesToWestCoordinate


	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'W').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:05'!
test07
	
	self executeACommand: 'r' forANumberOfTimes: 2.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:06'!
test08

	self executeACommand: 'l' forANumberOfTimes: 2.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:05'!
test09

	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:05'!
test10Eliminar

	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:06'!
test11Eliminar

	self executeACommand: 'r' forANumberOfTimes: 3.
	self assert: (marsRover cardinalPointPosition = 'W').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:06'!
test12Eliminar
	
	self executeACommand: 'l' forANumberOfTimes: 3.
	self assert: (marsRover cardinalPointPosition = 'E').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:06'!
test13

	self executeACommand: 'r' forANumberOfTimes: 2.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'E').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 15:15:58'!
test14Eliminar

	marsRover executeCommand: 'r'.
	self executeACommand: 'l' forANumberOfTimes: 2.
	self assert: (marsRover cardinalPointPosition = 'W').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 15:16:17'!
test15Eliminar

	marsRover executeCommand: 'l'.
	self executeACommand: 'r' forANumberOfTimes: 2.
	self assert: (marsRover cardinalPointPosition = 'E').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 15:16:25'!
test16Eliminar

	self executeACommand: 'l' forANumberOfTimes: 2.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'W').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 15:16:31'!
test17Eliminar

	self executeACommand: 'l' forANumberOfTimes: 4.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 15:16:37'!
test18Eliminar

	self executeACommand: 'r' forANumberOfTimes: 4.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:06'!
test19

	marsRover executeCommand: 'r'.
	self executeACommand: 'l' forANumberOfTimes: 3.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 15:16:54'!
test20Eliminar

	marsRover executeCommand: 'l'.
	self executeACommand: 'r' forANumberOfTimes: 3.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:06'!
test21

	self executeACommand: 'l' forANumberOfTimes: 2.
	self executeACommand: 'r' forANumberOfTimes: 2.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 15:17:00'!
test22Eliminar

	self executeACommand: 'r' forANumberOfTimes: 2.
	self executeACommand: 'l' forANumberOfTimes: 2.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:06'!
test23
	
	self executeACommand: 'l' forANumberOfTimes: 3.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 15:17:07'!
test24Eliminar

	self executeACommand: 'r' forANumberOfTimes: 3.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 12:45:05'!
test25

	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover cardinalPointPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinalPointTests' stamp: 'CS 5/29/2022 15:17:15'!
test26Eliminar

	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'r'.
	self assert: (marsRover cardinalPointPosition = 'N').! !


!MarsRoverTests methodsFor: 'setUp' stamp: 'CS 5/29/2022 17:51:47'!
setUp
	marsRover := MarsRover new.! !


!MarsRoverTests methodsFor: 'private' stamp: 'CS 5/28/2022 13:35:11'!
executeACommand: aCommand forANumberOfTimes: amountOfTimes 
	amountOfTimes timesRepeat: [ marsRover executeCommand: aCommand].! !


!MarsRoverTests methodsFor: 'initialization' stamp: 'CS 5/28/2022 13:23:50'!
test01WhenMarsRoverIsCreatedStartsInZeroPosition
	
	self assert: (marsRover coordinatePointPosition = (0@0)).! !

!MarsRoverTests methodsFor: 'initialization' stamp: 'CS 5/29/2022 12:45:55'!
test02WhenMarsRoverIsCreatedStartsInNorthCardinalPosition
	
	self assert: (marsRover cardinalPointPosition = 'N').! !


!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 11:15:51'!
test45WhenMarsRoverExecutesForwardCommandWithNorthCardinalPositionTwiceMovesTwiceAhead
	marsRover executeCommand: 'f'.
	marsRover executeCommand: 'f'.
	
	self assert: (marsRover coordinatePointPosition = (0@2)).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 11:16:53'!
test46WhenMarsRoverExecutesBackwardsCommandWithNorthCardinalPositionTwiceMovesTwiceBackwards
	marsRover executeCommand: 'b'.
	marsRover executeCommand: 'b'.
	
	self assert: (marsRover coordinatePointPosition = (0@-2)).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 11:18:04'!
test47WhenMarsRoverExecutesFowardAndBackwardsCommandWithNorthCardinalPositionRemainsInTheSamePosition
	marsRover executeCommand: 'f'.
	marsRover executeCommand: 'b'.
	
	self assert: (marsRover coordinatePointPosition = (0@0)).
	! !


!classDefinition: #CardinalPoint category: 'MarsRover'!
Object subclass: #CardinalPoint
	instanceVariableNames: 'pointPosition cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 13:03:54'!
cardinalPoint
	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:50:56'!
cardinalPositionRotatedToTheLeft
	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:13:26'!
cardinalPositionRotatedToTheRight
	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:26:59'!
move: aMarsRover with: aCommand
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalPoint class' category: 'MarsRover'!
CardinalPoint class
	instanceVariableNames: ''!

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:09:19'!
isTypeOfCardinal: aCardinalPointPosition
	self subclassResponsibility.
	! !


!classDefinition: #East category: 'MarsRover'!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 13:04:40'!
cardinalPoint
	^ cardinalPoint.! !

!East methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 15:30:42'!
cardinalPositionRotatedToTheLeft
	^ North new.! !

!East methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 15:30:46'!
cardinalPositionRotatedToTheRight
	^ South new.! !

!East methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 13:48:26'!
initialize
	cardinalPoint := 'E'.! !

!East methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:27:13'!
move: aMarsRover with: aCommand
	| marsRoverMovement |
	marsRoverMovement := aMarsRover getMovementOfMarsRover: aCommand.
	^ (marsRoverMovement new) moveWithEastCardinal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'MarsRover'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:09:58'!
isTypeOfCardinal: aCardinalPointPosition
	^ aCardinalPointPosition = 'E'.
	! !


!classDefinition: #North category: 'MarsRover'!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:51:51'!
cardinalPoint
	^ cardinalPoint.! !

!North methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 15:30:31'!
cardinalPositionRotatedToTheLeft
	^ West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 15:30:34'!
cardinalPositionRotatedToTheRight
	^ East new.! !

!North methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 16:22:23'!
initialize
	cardinalPoint := 'N'.! !

!North methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:27:02'!
move: aMarsRover with: aCommand
	| marsRoverMovement |
	marsRoverMovement := aMarsRover getMovementOfMarsRover: aCommand.
	^ (marsRoverMovement new) moveWithNorthCardinal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:53:11'!
isTypeOfCardinal: aCardinalPointPosition
	^ aCardinalPointPosition = 'N'.! !


!classDefinition: #South category: 'MarsRover'!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 13:05:28'!
cardinalPoint
	^ cardinalPoint.! !

!South methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 15:30:22'!
cardinalPositionRotatedToTheLeft
	^ East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 15:30:18'!
cardinalPositionRotatedToTheRight
	^ West new.! !

!South methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 13:05:39'!
initialize
	cardinalPoint := 'S'.! !

!South methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:27:31'!
move: aMarsRover with: aCommand
	| marsRoverMovement |
	marsRoverMovement := aMarsRover getMovementOfMarsRover: aCommand.
	^ (marsRoverMovement new) moveWithSouthCardinal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'MarsRover'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:10:12'!
isTypeOfCardinal: aCardinalPointPosition
	^ aCardinalPointPosition = 'S'.! !


!classDefinition: #West category: 'MarsRover'!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 13:06:37'!
cardinalPoint
	^ cardinalPoint.! !

!West methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 15:30:09'!
cardinalPositionRotatedToTheLeft
	^ South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 15:30:01'!
cardinalPositionRotatedToTheRight
	^ North new.! !

!West methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 13:07:21'!
initialize
	cardinalPoint := 'W'.! !

!West methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:27:41'!
move: aMarsRover with: aCommand
	| marsRoverMovement |
	marsRoverMovement := aMarsRover getMovementOfMarsRover: aCommand.
	^ (marsRoverMovement new) moveWithWestCardinal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'MarsRover'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:10:17'!
isTypeOfCardinal: aCardinalPointPosition
	^ aCardinalPointPosition = 'W'.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'cardinalPosition validCommands cardinal pointPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'commandValidation' stamp: 'CS 5/29/2022 18:04:20'!
isValidCommand: aCharacter

	^ #($r $l $b $f) includes: aCharacter. ! !


!MarsRover methodsFor: 'position' stamp: 'CS 5/29/2022 13:24:23'!
cardinalPointPosition
	^ cardinalPosition cardinalPoint.! !

!MarsRover methodsFor: 'position' stamp: 'CS 5/29/2022 16:22:46'!
coordinatePointPosition
	^ pointPosition.! !


!MarsRover methodsFor: 'private' stamp: 'CS 5/29/2022 17:32:02'!
updatePointPosition: aCommand
	
	pointPosition := pointPosition + (cardinalPosition move: self with: aCommand).! !


!MarsRover methodsFor: 'commandExecution' stamp: 'CS 5/29/2022 17:59:10'!
executeCommand: aCommand

	(aCommand ) do: [ 
		: character | (self isValidCommand: character) 
		ifTrue: [
			(# ('l' 'r') includes: aCommand) ifTrue:[ self updateCardinalPointPosition: aCommand].
			(# ('f' 'b') includes: aCommand) ifTrue: [self updatePointPosition: aCommand].
		] 
		ifFalse: [
			^ self error: self class invalidCharacterErrorDescription. 
		]
	].
	! !


!MarsRover methodsFor: 'initialize' stamp: 'CS 5/29/2022 17:51:21'!
initialize
	
	pointPosition := (0@0).
	cardinalPosition := (North new) initialize.
	! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:07:02'!
getMovementOfMarsRover: aCommand
	^  (MarsRoverMovement subclasses detect: [: subclass |  (subclass isTypeOfMovement: aCommand)]).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:19:43'!
updateCardinalPointPosition: aCommand
	aCommand = 'r' ifTrue: [cardinalPosition := cardinalPosition cardinalPositionRotatedToTheRight].
	aCommand = 'l' ifTrue: [cardinalPosition := cardinalPosition cardinalPositionRotatedToTheLeft].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 16:33:39'!
invalidCharacterErrorDescription
	^ 'invalid character found'.! !


!classDefinition: #MarsRoverMovement category: 'MarsRover'!
Object subclass: #MarsRoverMovement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverMovement methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:15:50'!
moveWithEastCardinal
	self subclassResponsibility.! !

!MarsRoverMovement methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:15:43'!
moveWithNorthCardinal
	self subclassResponsibility.! !

!MarsRoverMovement methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:15:37'!
moveWithSouthCardinal
	self subclassResponsibility.! !

!MarsRoverMovement methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:15:31'!
moveWithWestCardinal
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverMovement class' category: 'MarsRover'!
MarsRoverMovement class
	instanceVariableNames: ''!

!MarsRoverMovement class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:02:13'!
isTypeOfMovement: aMovement
	self subclassResponsibility.! !


!classDefinition: #BackwardMovement category: 'MarsRover'!
MarsRoverMovement subclass: #BackwardMovement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!BackwardMovement methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:15:50'!
moveWithEastCardinal
	^ (-1@0).! !

!BackwardMovement methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:15:43'!
moveWithNorthCardinal
	^ (0@-1).! !

!BackwardMovement methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:15:37'!
moveWithSouthCardinal
	^ (0@1).! !

!BackwardMovement methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:15:31'!
moveWithWestCardinal
	^ (1@0).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardMovement class' category: 'MarsRover'!
BackwardMovement class
	instanceVariableNames: ''!

!BackwardMovement class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:02:42'!
isTypeOfMovement: aMovement
	^ aMovement = 'b'.! !


!classDefinition: #FowardMovement category: 'MarsRover'!
MarsRoverMovement subclass: #FowardMovement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!FowardMovement methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:15:50'!
moveWithEastCardinal
	^ (1@0).! !

!FowardMovement methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:15:43'!
moveWithNorthCardinal
	^ (0@1).! !

!FowardMovement methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:15:37'!
moveWithSouthCardinal
	^ (0@-1).! !

!FowardMovement methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:15:31'!
moveWithWestCardinal
	^ (-1@0).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FowardMovement class' category: 'MarsRover'!
FowardMovement class
	instanceVariableNames: ''!

!FowardMovement class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 17:02:49'!
isTypeOfMovement: aMovement
	^ aMovement = 'f'.! !
