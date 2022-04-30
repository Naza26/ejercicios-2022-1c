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

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/30/2022 12:24:43'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/3/2019 10:50:28'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
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



!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

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

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 16:41:32'!
isActiveCustomerInCustomerBook: aName
	^(active includes: aName).! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 16:42:17'!
isNameIncludedInCustomerBook: aName
	^(self isActiveCustomerInCustomerBook: aName) or: (self isSuspendedCustomerInCustomerBook: aName)! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 16:42:07'!
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

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/30/2022 16:51:03'!
removeCustomerNamed: aName 

	|isActive isSuspended|
	
	isActive := (self isActiveCustomerInCustomerBook: aName).
	
	isSuspended := (self isSuspendedCustomerInCustomerBook: aName).
	
	(isActive or: isSuspended) ifFalse: [^ NotFound signal].
	
	isActive ifTrue: [self remove: aName FromA: active].
	
	isSuspended ifTrue: [self remove: aName FromA: suspended].
	
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
