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


!MarsRoverTests methodsFor: 'cardinal rotations' stamp: 'CS 5/31/2022 15:22:25'!
test05WhenMarsRoverExecutesRightCommandWithNorthCardinalPositionChangesToEastCoordinate
	
	marsRover executeCommand: 'r'.
	self assert: (marsRover headPosition = 'E').! !

!MarsRoverTests methodsFor: 'cardinal rotations' stamp: 'CS 5/31/2022 15:22:35'!
test06WhenMarsRoverExecutesLeftCommandWithNorthCardinalPositionChangesToWestCoordinate


	marsRover executeCommand: 'l'.
	self assert: (marsRover headPosition = 'W').! !

!MarsRoverTests methodsFor: 'cardinal rotations' stamp: 'CS 5/31/2022 15:22:41'!
test07WhenMarsRoverExecutesRightCommandTwiceWithNorthCardinalPositionChangesToSouth
	
	self executeACommand: 'r' forANumberOfTimes: 2.
	self assert: (marsRover headPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinal rotations' stamp: 'CS 5/31/2022 15:22:53'!
test08WhenMarsRoverExecutesLeftCommandTwiceWithNorthCardinalPositionChangesToSouth

	self executeACommand: 'l' forANumberOfTimes: 2.
	self assert: (marsRover headPosition = 'S').! !

!MarsRoverTests methodsFor: 'cardinal rotations' stamp: 'CS 5/31/2022 15:21:52'!
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

!MarsRoverTests methodsFor: 'initialization' stamp: 'CS 5/31/2022 15:22:07'!
test02WhenMarsRoverIsCreatedStartsInNorthCardinalPosition
	
	self assert: (marsRover headPosition = 'N').! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'marsRoverHeadOrientation coordinatePointPosition marsRoverHead'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'commandValidation' stamp: 'NR 5/29/2022 19:43:20'!
isValidCommand: aCharacter
	^ #($r $l $b $f) includes: aCharacter. ! !


!MarsRover methodsFor: 'position' stamp: 'CS 5/31/2022 15:08:51'!
coordinatePointPosition
	^ coordinatePointPosition.! !

!MarsRover methodsFor: 'position' stamp: 'CS 5/31/2022 14:37:46'!
headPosition
	^ marsRoverHeadOrientation headPosition.! !


!MarsRover methodsFor: 'private' stamp: 'CS 5/31/2022 15:08:51'!
updateCoordinatePointPosition: aCommand
	
	aCommand = 'f' ifTrue: [coordinatePointPosition := coordinatePointPosition + (marsRoverHeadOrientation fowardMovement).].
	aCommand = 'b' ifTrue: [coordinatePointPosition := coordinatePointPosition + (marsRoverHeadOrientation backwardMovement).].! !

!MarsRover methodsFor: 'private' stamp: 'CS 5/31/2022 14:54:53'!
updateMarsRoverHeadPosition: aCommand

	aCommand = 'r' ifTrue: [marsRoverHeadOrientation := marsRoverHeadOrientation headPositionRotatesRight].
	aCommand = 'l' ifTrue: [marsRoverHeadOrientation := marsRoverHeadOrientation headPositionRotatesLeft].! !


!MarsRover methodsFor: 'commandExecution' stamp: 'CS 5/31/2022 15:47:22'!
executeCommand: aCommand

	(aCommand ) do: [ 
		: character | (self isValidCommand: character) 
		ifTrue: [
			self updateMarsRoverHeadPosition: aCommand.
			self updateCoordinatePointPosition: aCommand.
		] 
		ifFalse: [
			^ self error: self class invalidCharacterErrorDescription. 
		]
	].
! !


!MarsRover methodsFor: 'initialize' stamp: 'CS 5/31/2022 15:49:57'!
initialize
	coordinatePointPosition := (0@0).
	marsRoverHeadOrientation := MarsRoverHeadLookingNorth new.
	
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

!MarsRoverHead methodsFor: 'headPosition' stamp: 'CS 5/31/2022 16:26:53'!
headPosition
	self subclassResponsibility.! !

!MarsRoverHead methodsFor: 'headPosition' stamp: 'CS 5/31/2022 16:26:59'!
headPositionRotatesLeft
	self subclassResponsibility.! !

!MarsRoverHead methodsFor: 'headPosition' stamp: 'CS 5/31/2022 16:34:42'!
headPositionRotatesRight
	self subclassResponsibility.! !


!MarsRoverHead methodsFor: 'movement' stamp: 'CS 5/31/2022 16:26:43'!
backwardMovement
	self subclassResponsibility.! !

!MarsRoverHead methodsFor: 'movement' stamp: 'CS 5/31/2022 16:26:49'!
fowardMovement
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

!MarsRoverHeadLookingEast methodsFor: 'movement' stamp: 'CS 5/31/2022 14:46:44'!
backwardMovement
	^ (-1@0).! !

!MarsRoverHeadLookingEast methodsFor: 'movement' stamp: 'CS 5/31/2022 14:45:20'!
fowardMovement
	^ (1@0).! !


!MarsRoverHeadLookingEast methodsFor: 'headPosition' stamp: 'NR 5/29/2022 19:30:52'!
headPosition
	^ headPointPosition.! !

!MarsRoverHeadLookingEast methodsFor: 'headPosition' stamp: 'NR 5/29/2022 19:42:09'!
headPositionRotatesLeft
	^ MarsRoverHeadLookingNorth new.! !

!MarsRoverHeadLookingEast methodsFor: 'headPosition' stamp: 'NR 5/29/2022 19:29:10'!
headPositionRotatesRight
	^ MarsRoverHeadLookingSouth new.! !


!MarsRoverHeadLookingEast methodsFor: 'initialization' stamp: 'CS 5/31/2022 14:35:59'!
initialize
	headPointPosition := 'E'.! !

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

!MarsRoverHeadLookingNorth methodsFor: 'headPosition' stamp: 'CS 5/31/2022 15:06:28'!
headPositionRotatesLeft
	^ MarsRoverHeadLookingWest new.! !

!MarsRoverHeadLookingNorth methodsFor: 'headPosition' stamp: 'NR 5/29/2022 19:41:41'!
headPositionRotatesRight
	^ MarsRoverHeadLookingEast new.! !


!MarsRoverHeadLookingNorth methodsFor: 'movement' stamp: 'CS 5/31/2022 14:43:41'!
backwardMovement
	^ (0@-1).! !

!MarsRoverHeadLookingNorth methodsFor: 'movement' stamp: 'CS 5/31/2022 14:41:40'!
fowardMovement
	^ (0@1).! !

!MarsRoverHeadLookingNorth methodsFor: 'movement' stamp: 'CS 5/31/2022 15:23:14'!
headPosition
	^ headPointPosition.! !


!MarsRoverHeadLookingNorth methodsFor: 'initialization' stamp: 'CS 5/31/2022 14:35:59'!
initialize
	headPointPosition := 'N'.! !

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

!MarsRoverHeadLookingSouth methodsFor: 'movement' stamp: 'CS 5/31/2022 14:47:27'!
backwardMovement
	^ (0@1).! !

!MarsRoverHeadLookingSouth methodsFor: 'movement' stamp: 'CS 5/31/2022 14:46:08'!
fowardMovement
	^ (0@-1).! !


!MarsRoverHeadLookingSouth methodsFor: 'initialization' stamp: 'CS 5/31/2022 14:35:59'!
initialize
	headPointPosition := 'S'.! !


!MarsRoverHeadLookingSouth methodsFor: 'headPosition' stamp: 'NR 5/29/2022 19:31:34'!
headPosition
	^ headPointPosition.! !

!MarsRoverHeadLookingSouth methodsFor: 'headPosition' stamp: 'NR 5/29/2022 19:28:59'!
headPositionRotatesLeft
	^ MarsRoverHeadLookingEast new.! !

!MarsRoverHeadLookingSouth methodsFor: 'headPosition' stamp: 'NR 5/29/2022 19:29:10'!
headPositionRotatesRight
	^ MarsRoverHeadLookingWest new.! !

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

!MarsRoverHeadLookingWest methodsFor: 'headPosition' stamp: 'NR 5/29/2022 19:31:51'!
headPosition
	^ headPointPosition.! !

!MarsRoverHeadLookingWest methodsFor: 'headPosition' stamp: 'NR 5/29/2022 19:28:59'!
headPositionRotatesLeft
	^ MarsRoverHeadLookingSouth new.! !

!MarsRoverHeadLookingWest methodsFor: 'headPosition' stamp: 'NR 5/29/2022 19:42:11'!
headPositionRotatesRight
	^ MarsRoverHeadLookingNorth new.! !


!MarsRoverHeadLookingWest methodsFor: 'movement' stamp: 'CS 5/31/2022 14:47:42'!
backwardMovement
	^ (1@0).! !

!MarsRoverHeadLookingWest methodsFor: 'movement' stamp: 'CS 5/31/2022 14:46:27'!
fowardMovement
	^ (-1@0).! !


!MarsRoverHeadLookingWest methodsFor: 'initialization' stamp: 'CS 5/31/2022 14:35:59'!
initialize
	headPointPosition := 'W'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadLookingWest class' category: 'MarsRover'!
MarsRoverHeadLookingWest class
	instanceVariableNames: ''!

!MarsRoverHeadLookingWest class methodsFor: 'as yet unclassified' stamp: 'CS 5/29/2022 12:10:17'!
isTypeOfCardinal: aCardinalPointPosition
	^ aCardinalPointPosition = 'W'.! !
