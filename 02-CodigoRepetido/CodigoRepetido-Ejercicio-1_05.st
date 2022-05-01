!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/30/2022 15:59:30'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self should: [customerBook addCustomerNamed: 'John Lennon'] notTakeMoreThan: 50 milliSeconds.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/30/2022 16:00:35'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	
	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	self should: [customerBook removeCustomerNamed: paulMcCartney] notTakeMoreThan: 100 milliSeconds .
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/30/2022 16:42:56'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
		
	self should: [customerBook addCustomerNamed: ''] 
		raise: Error withExceptionDo:
		[ :anError | self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage. 
				self assert: customerBook isEmpty ] 
	description: CustomerBook customerCanNotBeEmptyErrorMessage.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/30/2022 16:43:09'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
		
	self should: [customerBook removeCustomerNamed: 'Paul McCartney'] 
		raise: Error withExceptionDo:
		[ :anError | self assert: customerBook numberOfCustomers = 1.
				self assert: (customerBook includesCustomerNamed: johnLennon) ] 
	description: CustomerBook customerIsInvalidErrorMessage.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CS 5/1/2022 16:13:18'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: (self IsUpdatedNumberOfCustomers: 1 andActive: 0 andSuspended: 1 in: customerBook).
	self assert: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CS 5/1/2022 16:13:39'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: (self IsUpdatedNumberOfCustomers: 0 andActive: 0 andSuspended: 0 in: customerBook).
	self deny: (customerBook isNameIncludedInCustomerBook: paulMcCartney).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/30/2022 16:34:15'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	self should: [customerBook suspendCustomerNamed: 'Ringo Starr']
		raise: CantSuspend withExceptionDo:
		[ :anError | self assert: customerBook numberOfCustomers = 1.
				self assert: (customerBook includesCustomerNamed: johnLennon) ] 
		description: CustomerBook customerIsInvalidErrorMessage.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/30/2022 16:34:37'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.	
		
	self should: [customerBook suspendCustomerNamed: johnLennon]
		raise: CantSuspend withExceptionDo:
			[ :anError | self assert: customerBook numberOfCustomers = 1.
					self assert: (customerBook includesCustomerNamed: johnLennon) ] 
		description: CustomerBook customerAlreadySuspendedErrorMessage.
! !


!CustomerBookTest methodsFor: 'testing message' stamp: 'CS 5/1/2022 16:13:09'!
IsUpdatedNumberOfCustomers: actualNumberOfCustomers andActive: actualNumberOfActives andSuspended: actualNumberOfSuspended in: customerBook
	^ (actualNumberOfCustomers = customerBook numberOfCustomers) and: (actualNumberOfActives = customerBook numberOfActiveCustomers) and: (actualNumberOfSuspended = customerBook numberOfSuspendedCustomers). ! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'CS 5/1/2022 15:58:57'!
IsUpdatedNumberOfCustomers: actualNumberOfCustomers andActive: actualNumberOfActive andSuspended: actualNumberOfSuspended
	^ (actualNumberOfCustomers = self numberOfCustomers) and: (actualNumberOfActive = self numberOfActiveCustomers) and: (actualNumberOfSuspended = self numberOfSuspendedCustomers). ! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/30/2022 12:38:32'!
includesCustomerNamed: aName
	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 12:43:59'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self isNameIncludedInCustomerBook: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'CS 5/1/2022 12:05:15'!
isActiveCustomerInCustomerBook: aName
	^(active includes: aName).! !

!CustomerBook methodsFor: 'customer management' stamp: 'CS 5/1/2022 13:48:16'!
isNameIncludedInCustomerBook: aName
	^(self isActiveCustomerInCustomerBook: aName) or: (self isSuspendedCustomerInCustomerBook: aName)! !

!CustomerBook methodsFor: 'customer management' stamp: 'CS 5/1/2022 12:05:32'!
isSuspendedCustomerInCustomerBook: aName
	^(suspended includes: aName).! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 11:18:12'!
numberOfActiveCustomers
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 16:19:16'!
numberOfCustomers
	^ self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 11:18:36'!
numberOfSuspendedCustomers
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 16:49:50'!
remove: customerName FromA: customerList
	customerList remove: customerName ifAbsent: [].! !

!CustomerBook methodsFor: 'customer management' stamp: 'CS 5/1/2022 16:07:15'!
removeCustomerNamed: aName 

	|list|
	list := self typeOfListTheCustomerBelongs: aName.
	self remove: aName FromA: list.
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 11:19:37'!
signalCustomerAlreadyExists 
	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 11:19:40'!
signalCustomerNameCannotBeEmpty 
	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 13:16:11'!
suspendCustomerNamed: aName 
	self verifyCustomerStatusBeforeSuspension: aName.
	
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	
	active remove: aName.
	
	suspended add: aName
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 13:15:45'!
verifyCustomerStatusBeforeSuspension: aName	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	(suspended includes: aName) ifTrue: [^CantSuspend signal].! !


!CustomerBook methodsFor: 'as yet unclassified' stamp: 'CS 5/1/2022 16:06:56'!
typeOfListTheCustomerBelongs: aName
	| isActive isSuspended |
	
	isActive := (self isActiveCustomerInCustomerBook: aName).
	isSuspended := (self isSuspendedCustomerInCustomerBook: aName).
	
	(isActive or: isSuspended ) ifFalse: [^NotFound signal].
	
	isActive ifTrue: [^active ].
	isSuspended ifTrue: [^suspended ].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2022 16:27:36'!
customerAlreadyExistsErrorMessage
	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2022 16:28:09'!
customerAlreadySuspendedErrorMessage

	^'Customer Already Suspended'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2022 16:27:39'!
customerCanNotBeEmptyErrorMessage
	^'Customer Name Cannot Be Empty'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2022 16:26:11'!
customerIsInvalidErrorMessage
	^ 'Customer Name Cannot Be Invalid'.! !
