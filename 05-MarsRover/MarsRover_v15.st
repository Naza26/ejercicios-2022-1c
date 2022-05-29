!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'CS 5/29/2022 16:47:14'!
test03WhenMarsRoverExecutesForwardCommandWithNorthCardinalPositionMovesOnePositionAhead

	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (0@1)).! !

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'NR 5/29/2022 18:42:02'!
test04WhenMarsRoverExecutesBackwardCommandWithNorthCardinalPositionMovesOnePositionBackwards
	
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'NR 5/29/2022 19:13:33'!
test12WhenMarsRoverRotatesRightAndMovesEndsUpOnePositionAheadOfRotation
	
	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (1@0)).! !

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'NR 5/29/2022 19:13:44'!
test13WhenMarsRoverRotatesLeftAndMovesEndsUpOnePositionBelowOfRotation

	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (-1@0)).! !

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'NR 5/29/2022 19:23:59'!
test14RevisarSiSonNecesarias

	self executeACommand: 'r' forANumberOfTimes: 2.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'NR 5/29/2022 19:24:04'!
test15RevisarSiSonNecesarias

	self executeACommand: 'r' forANumberOfTimes: 2.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@1)).! !

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'NR 5/29/2022 19:24:09'!
test16RevisarSiSonNecesarias

	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (-1@0)).! !

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'NR 5/29/2022 19:24:14'!
test17RevisarSiSonNecesarias
	
	marsRover executeCommand: 'l'.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (1@0)).! !

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'NR 5/29/2022 19:24:18'!
test18RevisarSiSonNecesarias

	self executeACommand: 'l' forANumberOfTimes: 2.
	marsRover executeCommand: 'f'.
	self assert: (marsRover coordinatePointPosition = (0@-1)).! !

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'NR 5/29/2022 19:24:23'!
test19RevisarSiSonNecesarias

	self executeACommand: 'l' forANumberOfTimes: 2.
	marsRover executeCommand: 'b'.
	self assert: (marsRover coordinatePointPosition = (0@1)).! !

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'NR 5/29/2022 19:15:24'!
test22WhenMarsRoverExecutesForwardCommandWithNorthCardinalPositionTwiceMovesTwiceAhead
	marsRover executeCommand: 'f'.
	marsRover executeCommand: 'f'.
	
	self assert: (marsRover coordinatePointPosition = (0@2)).
	! !

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'NR 5/29/2022 19:15:39'!
test23WhenMarsRoverExecutesBackwardsCommandWithNorthCardinalPositionTwiceMovesTwiceBackwards
	marsRover executeCommand: 'b'.
	marsRover executeCommand: 'b'.
	
	self assert: (marsRover coordinatePointPosition = (0@-2)).
	! !

!MarsRoverTests methodsFor: 'coordinate movements' stamp: 'NR 5/29/2022 19:15:57'!
test24WhenMarsRoverExecutesFowardAndBackwardsCommandWithNorthCardinalPositionRemainsInTheSamePosition
	marsRover executeCommand: 'f'.
	marsRover executeCommand: 'b'.
	
	self assert: (marsRover coordinatePointPosition = (0@0)).
	! !


!MarsRoverTests methodsFor: 'validations' stamp: 'NR 5/29/2022 19:15:00'!
test20WhenMarsRoverReceivesAnIncorrectCommandDoesNotExecuteIt

	self
		should: [ marsRover executeCommand: 'k']
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = marsRover class invalidCharacterErrorDescription].! !

!MarsRoverTests methodsFor: 'validations' stamp: 'NR 5/29/2022 19:37:24'!
test21WhenMarsRoverMovesReceivesCommandItExecutesItUntilAnInvalidOneAppears

	self
		should: [ 
			marsRover executeCommand: 'rfx'.
			self assert: (marsRover coordinatePointPosition = (1@0)).
			self assert: (marsRover headPosition = 'E').
		]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = marsRover class invalidCharacterErrorDescription].! !


!MarsRoverTests methodsFor: 'cardinal rotations' stamp: 'NR 5/29/2022 19:37:24'!
test05WhenMarsRoverExecutesRightCommandWithNorthCardinalPositionChangesToEastCoordinate
	
	marsRover executeCommand: 'r'.
	self assert: (marsRover headPosition = 'E').! !

!MarsRoverTests methodsFor: 'cardinal rotations' stamp: 'NR 5/29/2022 19:37:24'!
test06WhenMarsRoverExecutesLeftCommandWithNorthCardinalPositionChangesToWestCoordinate


	marsRover executeCommand: 'l'.
	self assert: (marsRover headPosition = 'W').! !

!MarsRoverTests methodsFor: 'cardinal rotations' stamp: 'NR 5/29/2022 19:37:24'!
test07WhenMarsRoverExecutesRightCommandTwiceWithNorthCardinalPositionChangesToSouth
	
	self executeACommand: 'r' forANumberOfTimes: 2.
	self assert: (marsRover headPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinal rotations' stamp: 'NR 5/29/2022 19:37:24'!
test08WhenMarsRoverExecutesLeftCommandTwiceWithNorthCardinalPositionChangesToSouth

	self executeACommand: 'l' forANumberOfTimes: 2.
	self assert: (marsRover headPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinal rotations' stamp: 'NR 5/29/2022 19:37:24'!
test09WhenMarsRoverExecutesBothOppositeCommandsWithInitialNorthCardinalPositionRemainsNorth

	marsRover executeCommand: 'r'.
	marsRover executeCommand: 'l'.
	self assert: (marsRover headPosition = 'N').! !

!MarsRoverTests methodsFor: 'cardinal rotations' stamp: 'NR 5/29/2022 19:37:24'!
test10RevisarSiSonNecesarias

	self executeACommand: 'r' forANumberOfTimes: 2.
	marsRover executeCommand: 'l'.
	self assert: (marsRover headPosition = 'E').! !

!MarsRoverTests methodsFor: 'cardinal rotations' stamp: 'NR 5/29/2022 19:37:24'!
test11RevisarSiSonNecesarias

	marsRover executeCommand: 'r'.
	self executeACommand: 'l' forANumberOfTimes: 2.
	self assert: (marsRover headPosition = 'W').! !


!MarsRoverTests methodsFor: 'setUp' stamp: 'CS 5/29/2022 17:51:47'!
setUp
	marsRover := MarsRover new.! !


!MarsRoverTests methodsFor: 'private' stamp: 'CS 5/28/2022 13:35:11'!
executeACommand: aCommand forANumberOfTimes: amountOfTimes 
	amountOfTimes timesRepeat: [ marsRover executeCommand: aCommand].! !


!MarsRoverTests methodsFor: 'initialization' stamp: 'CS 5/28/2022 13:23:50'!
test01WhenMarsRoverIsCreatedStartsInZeroPosition
	
	self assert: (marsRover coordinatePointPosition = (0@0)).! !

!MarsRoverTests methodsFor: 'initialization' stamp: 'NR 5/29/2022 19:37:24'!
test02WhenMarsRoverIsCreatedStartsInNorthCardinalPosition
	
	self assert: (marsRover headPosition = 'N').! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'cardinalPosition pointPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'commandValidation' stamp: 'NR 5/29/2022 19:43:20'!
isValidCommand: aCharacter
	^ #($r $l $b $f) includes: aCharacter. ! !


!MarsRover methodsFor: 'position' stamp: 'NR 5/29/2022 19:43:10'!
coordinatePointPosition
	^ pointPosition.! !

!MarsRover methodsFor: 'position' stamp: 'NR 5/29/2022 19:37:24'!
headPosition
	^ cardinalPosition headPosition.! !


!MarsRover methodsFor: 'private' stamp: 'NR 5/29/2022 19:42:44'!
getMovementOfMarsRover: aCommand
	^ (MarsRoverMovement subclasses detect: [: subclass |  (subclass isTypeOfMovement: aCommand)]).! !

!MarsRover methodsFor: 'private' stamp: 'NR 5/29/2022 19:29:10'!
updateCardinalPointPosition: aCommand
	aCommand = 'r' ifTrue: [cardinalPosition := cardinalPosition headPositionRotatesRight].
	aCommand = 'l' ifTrue: [cardinalPosition := cardinalPosition headPositionRotatesLeft].! !

!MarsRover methodsFor: 'private' stamp: 'NR 5/29/2022 19:42:49'!
updatePointPosition: aCommand
	pointPosition := pointPosition + (cardinalPosition moveHead: self executing: aCommand).! !


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


!MarsRover methodsFor: 'initialize' stamp: 'NR 5/29/2022 19:45:40'!
cardinalPosition
	pointPosition := (0@0).
	cardinalPosition := (MarsRoverHeadLookingNorth new) cardinalPosition.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 16:33:39'!
invalidCharacterErrorDescription
	^ 'invalid character found'.! !


!classDefinition: #MarsRoverHead category: 'MarsRover'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'headPointPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:45:40'!
cardinalPosition
	self subclassResponsibility.! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:29:55'!
headPosition
	self subclassResponsibility.! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:28:59'!
headPositionRotatesLeft
	self subclassResponsibility.! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:29:10'!
headPositionRotatesRight
	self subclassResponsibility.! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:26:39'!
moveHead: aMarsRover executing: aCommand
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:09:19'!
isTypeOfCardinal: aCardinalPointPosition
	self subclassResponsibility.
	! !


!classDefinition: #MarsRoverHeadLookingEast category: 'MarsRover'!
MarsRoverHead subclass: #MarsRoverHeadLookingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadLookingEast methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:45:40'!
cardinalPosition
	headPointPosition := 'E'.! !

!MarsRoverHeadLookingEast methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:30:52'!
headPosition
	^ headPointPosition.! !

!MarsRoverHeadLookingEast methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:42:09'!
headPositionRotatesLeft
	^ MarsRoverHeadLookingNorth new.! !

!MarsRoverHeadLookingEast methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:29:10'!
headPositionRotatesRight
	^ MarsRoverHeadLookingSouth new.! !

!MarsRoverHeadLookingEast methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:26:39'!
moveHead: aMarsRover executing: aCommand
	| marsRoverMovement |
	marsRoverMovement := aMarsRover getMovementOfMarsRover: aCommand.
	^ (marsRoverMovement new) moveWithEastCardinal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadLookingEast class' category: 'MarsRover'!
MarsRoverHeadLookingEast class
	instanceVariableNames: ''!

!MarsRoverHeadLookingEast class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:09:58'!
isTypeOfCardinal: aCardinalPointPosition
	^ aCardinalPointPosition = 'E'.
	! !


!classDefinition: #MarsRoverHeadLookingNorth category: 'MarsRover'!
MarsRoverHead subclass: #MarsRoverHeadLookingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadLookingNorth methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:45:40'!
cardinalPosition
	headPointPosition := 'N'.! !

!MarsRoverHeadLookingNorth methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:41:41'!
headPosition
	^ headPointPosition.! !

!MarsRoverHeadLookingNorth methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:41:41'!
headPositionRotatesLeft
	^ MarsRoverHeadLookingWest new.! !

!MarsRoverHeadLookingNorth methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:41:41'!
headPositionRotatesRight
	^ MarsRoverHeadLookingEast new.! !

!MarsRoverHeadLookingNorth methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:41:41'!
moveHead: aMarsRover executing: aCommand
	| marsRoverMovement |
	marsRoverMovement := aMarsRover getMovementOfMarsRover: aCommand.
	^ (marsRoverMovement new) moveWithNorthCardinal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadLookingNorth class' category: 'MarsRover'!
MarsRoverHeadLookingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadLookingNorth class methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:41:41'!
isTypeOfCardinal: aCardinalPointPosition
	^ aCardinalPointPosition = 'N'.! !


!classDefinition: #MarsRoverHeadLookingSouth category: 'MarsRover'!
MarsRoverHead subclass: #MarsRoverHeadLookingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadLookingSouth methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:45:40'!
cardinalPosition
	headPointPosition := 'S'.! !

!MarsRoverHeadLookingSouth methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:31:34'!
headPosition
	^ headPointPosition.! !

!MarsRoverHeadLookingSouth methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:28:59'!
headPositionRotatesLeft
	^ MarsRoverHeadLookingEast new.! !

!MarsRoverHeadLookingSouth methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:29:10'!
headPositionRotatesRight
	^ MarsRoverHeadLookingWest new.! !

!MarsRoverHeadLookingSouth methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:26:39'!
moveHead: aMarsRover executing: aCommand
	| marsRoverMovement |
	marsRoverMovement := aMarsRover getMovementOfMarsRover: aCommand.
	^ (marsRoverMovement new) moveWithSouthCardinal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadLookingSouth class' category: 'MarsRover'!
MarsRoverHeadLookingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadLookingSouth class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:10:12'!
isTypeOfCardinal: aCardinalPointPosition
	^ aCardinalPointPosition = 'S'.! !


!classDefinition: #MarsRoverHeadLookingWest category: 'MarsRover'!
MarsRoverHead subclass: #MarsRoverHeadLookingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadLookingWest methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:45:40'!
cardinalPosition
	headPointPosition := 'W'.! !

!MarsRoverHeadLookingWest methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:31:51'!
headPosition
	^ headPointPosition.! !

!MarsRoverHeadLookingWest methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:28:59'!
headPositionRotatesLeft
	^ MarsRoverHeadLookingSouth new.! !

!MarsRoverHeadLookingWest methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:42:11'!
headPositionRotatesRight
	^ MarsRoverHeadLookingNorth new.! !

!MarsRoverHeadLookingWest methodsFor: 'as yet unclassified' stamp: 'NR 5/29/2022 19:26:39'!
moveHead: aMarsRover executing: aCommand
	| marsRoverMovement |
	marsRoverMovement := aMarsRover getMovementOfMarsRover: aCommand.
	^ (marsRoverMovement new) moveWithWestCardinal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadLookingWest class' category: 'MarsRover'!
MarsRoverHeadLookingWest class
	instanceVariableNames: ''!

!MarsRoverHeadLookingWest class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:10:17'!
isTypeOfCardinal: aCardinalPointPosition
	^ aCardinalPointPosition = 'W'.! !


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
