!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'portfolio1 account1 account2 portfolio2 desposit1 desposit2 deposits'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'setUp' stamp: 'CS 6/8/2022 17:46:05'!
setUp
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account1 := ReceptiveAccount  new.
	desposit1 := Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount  new.
	desposit2 := Deposit register: 200 * peso on: account2.
	
	deposits := OrderedCollection new.
	
	deposits add: desposit1.
	deposits add: desposit2.
	
	! !


!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/8/2022 17:45:03'!
test01PortfolioHaveZeroAsBalanceWhenCreated 

	self assert: 0 equals: portfolio1 balance.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/8/2022 17:45:41'!
test02PortfolioCanGetBalanceFromAnAddedAccount

	portfolio1 addAnAccount: account1.
		
	self assert: 100 * peso equals: portfolio1 balance
! !

!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/8/2022 17:45:54'!
test03PortfolioCanGetBalanceFromMultipleAddedAccounts

	portfolio1 addAnAccount: account1.
	portfolio1 addAnAccount: account2.
		
	self assert: 300 * peso equals: portfolio1 balance
! !

!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/8/2022 17:45:41'!
test04PortfolioCanRecognizeWhenAnAccountHasRegisteredATransaction

	| aTransaction |
	portfolio1 addAnAccount: account1.
	
	aTransaction := Deposit register: 100 * peso on: account1.
			
	self assert: (portfolio1 hasRegistered: aTransaction) equals: true.! !

!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/8/2022 17:45:02'!
test05PortfolioCanRecognizeWhenAnAccountHasNotRegisteredATransaction
	
	self assert: (portfolio1 hasRegistered: nil) equals: false.! !

!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/9/2022 14:23:01'!
test06PorfolioCanRecognizeWhenAPortfolioHasRegisteredATransaction

	portfolio1 addAnAccount: account1.
	portfolio1 addAnAccount: portfolio2.
	portfolio2 addAnAccount: account2.
		
	self assert: (portfolio1 hasRegistered: desposit2).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/8/2022 17:46:05'!
test07PortfolioCanGetAllAccountTransactions
	
	portfolio1 addAnAccount: account1.
	portfolio1 addAnAccount: account2.
		
	self assert: (portfolio1 transactions) equals: deposits.! !

!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/9/2022 14:23:52'!
test08PortfolioCanGetAllTheTransactionsOfItsAccounts

	portfolio1 addAnAccount: account1.
	portfolio1 addAnAccount: portfolio2.
	portfolio2 addAnAccount: account2.
		
	self assert: (portfolio1 transactions) equals: deposits.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/8/2022 17:45:54'!
test09PortfolioCanGetBalanceOfItsAccountsAndTheAccountsOfItsPortfolios

	portfolio1 addAnAccount: account1.
	portfolio2 addAnAccount: account2.
	portfolio1 addAnAccount: portfolio2. 
	
	self assert: (300 * peso) equals: portfolio1 balance.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/8/2022 17:45:41'!
test10PortfolioCannotAddTheSameAccountTwice

	portfolio1 addAnAccount: account1.
		
	self should: [ portfolio1 addAnAccount: account1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
		self assert: anError messageText = Portfolio portfolioCannotAddSameAccountTwiceErrorDescription ].
! !

!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/8/2022 17:56:16'!
test11PortfolioCannotAddAnAccountPreviouslyAddedAndIncludedInAPortfolio

	portfolio2 addAnAccount: account1.
	portfolio1 addAnAccount: portfolio2.
		
	self should: [portfolio1 addAnAccount: account1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
		self assert: anError messageText = Portfolio portfolioCannotAddSameAccountTwiceErrorDescription ].
! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/9/2022 15:04:46'!
test12PortfolioCannotAddItself
		
	self should: [portfolio1 addAnAccount: portfolio1.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
		self assert: anError messageText = Portfolio portfolioCannotIncludeItselfErrorDescription ].
! !

!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/9/2022 14:30:21'!
test13PortfolioCannotAddAnAccountToAPortfolioWhenItIsChildOfPortfolioFatherContainingThatAccount

	portfolio1 addAnAccount: account1.
	portfolio1 addAnAccount: portfolio2.
	
	self should: [portfolio2 addAnAccount: account1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
		self assert: anError messageText = Portfolio portfolioCannotAddSameAccountTwiceErrorDescription ].
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'CS 6/8/2022 17:56:54'!
test14CannotAddAPortfolioToAPortfolioWhenTheFistOneIncludesAnAccountThatTheLatterAlreadyHas
	
	portfolio1 addAnAccount: account1.
	portfolio2 addAnAccount: account1.
		
	self should: [portfolio1 addAnAccount: portfolio2]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
		self assert: anError messageText = Portfolio portfolioCannotAddSameAccountTwiceErrorDescription ].
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'account1 account2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'setUp' stamp: 'NR 6/8/2022 16:54:35'!
setUp
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.! !


!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/8/2022 16:47:27'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	self assert: 0 equals: account1 balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/8/2022 16:49:02'!
test02DepositIncreasesBalanceOnTransactionValue 
		
	Deposit register: 100 * peso on: account1.
	
	self assert: 100 * peso equals: account1 balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/8/2022 16:49:17'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: account1.
	Withdraw register: 50 * peso on: account1.
		
	self assert: 50 * peso equals: account1 balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/8/2022 16:49:37'!
test04WithdrawValueMustBePositive 

	| withdrawValue |
	
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account1) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/8/2022 16:49:53'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |
	
	deposit := Deposit register: 100 * peso on: account1.
	withdraw := Withdraw register: 50 * peso on: account1.
		
	self assert: (account1 hasRegistered: deposit).
	self assert: (account1 hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/8/2022 16:50:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
	
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account1 hasRegistered: deposit).
	self deny: (account1 hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/9/2022 15:02:26'!
test07AnAccountKnowsItsTransactionsMade 

	| deposit |
	
	deposit := Deposit register: 50 * peso on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/8/2022 16:59:16'!
test08AnAccountCannotTransferZeroPesos
	
	| accountSender accountReceiver |
	
	accountSender := account1.
	accountReceiver := account2.
	
	self should: [ Transfer from: accountSender to: accountReceiver aValueOf: 0 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Transfer cannotTransferZeroPesosErrorDescription ].! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/8/2022 16:57:27'!
test09WhenATransferTransactionSucceedsSenderAccountBalanceGetsUpdated
	
	| accountSender accountReceiver |
	
	accountSender := account1.
	accountReceiver := account2.
	
	self registerInitialAccountValuesFor: accountSender andFor: accountReceiver.
	
	Transfer from: accountSender to: accountReceiver aValueOf: 5*peso.
	
	self assert: 5 * peso equals: accountSender balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/8/2022 16:59:55'!
test10WhenATransferTransactionSucceedsReceiverAccountBalanceGetsUpdated
	
	| accountSender accountReceiver |
	
	accountSender := account1.
	accountReceiver := account2.
	
	self registerInitialAccountValuesFor: accountSender andFor: accountReceiver.
	
	Transfer from: accountSender to: accountReceiver aValueOf: 5*peso.
	
	self assert: 105 * peso equals: accountReceiver balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/8/2022 17:00:22'!
test11YouCanGetValueOfATransferTransactionAfterItGotExecuted

	| accountSender accountReceiver transfer |
	
	accountSender := account1.
	accountReceiver := account2.
	
	self registerInitialAccountValuesFor: accountSender andFor: accountReceiver.
	
	transfer := Transfer from: accountSender to: accountReceiver aValueOf: 5*peso.
	
	self assert: 5 * peso equals: transfer getTransferValue.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/8/2022 17:00:33'!
test12AWithdrawLegCanGetItsCounterPartLeg

	| accountSender accountReceiver transfer depositLeg withdrawLeg |
	
	accountSender := account1.
	accountReceiver := account2.
	
	self registerInitialAccountValuesFor: accountSender andFor: accountReceiver.
	
	transfer := Transfer from: accountSender to: accountReceiver aValueOf: 5* peso.
	withdrawLeg := transfer getWithdrawLeg.
	depositLeg := transfer getDepositLeg.
	
	self assert: (withdrawLeg getCounterPartLegFrom: transfer) equals: (depositLeg). ! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/8/2022 17:00:44'!
test13ADepositLegCanGetItsCounterPartLeg

	| accountSender accountReceiver transfer depositLeg withdrawLeg |
	
	accountSender := account1.
	accountReceiver := account2.
	
	self registerInitialAccountValuesFor: accountSender andFor: accountReceiver.
	
	transfer := Transfer from: accountSender to: accountReceiver aValueOf: 5* peso.
	withdrawLeg := transfer getWithdrawLeg.
	depositLeg := transfer getDepositLeg.
	
	self assert: (depositLeg getCounterPartLegFrom: transfer) equals: (withdrawLeg). ! !


!ReceptiveAccountTest methodsFor: 'private' stamp: 'NR 6/8/2022 16:58:14'!
registerInitialAccountValuesFor: firstAccount andFor: secondAccount

	Deposit register: 10 * peso on: firstAccount.
	Deposit register: 100 * peso on: secondAccount.! !


!classDefinition: #AccountServices category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountServices
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountServices methodsFor: 'testing' stamp: 'NR 6/9/2022 14:58:45'!
hasAnAccount: anAccount
	self subclassResponsibility.! !

!AccountServices methodsFor: 'testing' stamp: 'NR 6/8/2022 15:07:18'!
hasRegistered: aTransaction
	self subclassResponsibility.! !


!AccountServices methodsFor: 'initialize' stamp: 'NR 6/8/2022 15:06:42'!
initialize
	self subclassResponsibility.! !


!AccountServices methodsFor: 'balance' stamp: 'NR 6/8/2022 15:06:27'!
balance
	self subclassResponsibility.! !


!AccountServices methodsFor: 'transactions' stamp: 'NR 6/8/2022 15:07:02'!
transactions
	self subclassResponsibility.! !


!AccountServices methodsFor: 'accounts' stamp: 'NR 6/9/2022 14:58:55'!
accounts
	self subclassResponsibility.! !


!AccountServices methodsFor: 'private' stamp: 'NR 6/9/2022 14:58:50'!
addFather: aFather
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
AccountServices subclass: #Portfolio
	instanceVariableNames: 'accounts father'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'CS 6/8/2022 18:03:10'!
hasAnAccount: anAccountToCheck
	^ accounts anySatisfy: [:anAccount | (anAccount hasAnAccount: anAccountToCheck)]. ! !

!Portfolio methodsFor: 'testing' stamp: 'NR 6/8/2022 14:49:31'!
hasRegistered: aTransaction
	^ accounts anySatisfy: [:anAccount | (anAccount hasRegistered: aTransaction)].! !


!Portfolio methodsFor: 'initialize' stamp: 'CS 6/8/2022 22:32:34'!
initialize
	accounts := OrderedCollection new.
	father := self.! !


!Portfolio methodsFor: 'main protocol' stamp: 'NR 6/8/2022 16:10:45'!
accounts
	
	| copyOfAccounts |
	copyOfAccounts := accounts copy.
	copyOfAccounts add: self.
	^ copyOfAccounts.! !

!Portfolio methodsFor: 'main protocol' stamp: 'CS 6/9/2022 14:51:11'!
addAnAccount: anAccount
	self validateAdditionOfSameAccount: anAccount.
	father = self  ifTrue: [
		self validateAdditionOf: anAccount whenAddingAnotherAccount: self.
		anAccount addFather: self.	
	] ifFalse: [
		self validateAdditionOf: anAccount toADifferentFatherWhenAddingAnotherAccount: father.
	].
	accounts add: anAccount.! !

!Portfolio methodsFor: 'main protocol' stamp: 'NR 6/8/2022 14:57:50'!
balance
	^ accounts sum: [ :anAccount | anAccount balance] ifEmpty: [^0].

	! !

!Portfolio methodsFor: 'main protocol' stamp: 'NR 6/8/2022 14:35:55'!
transactions
	| transactions |
	 transactions := OrderedCollection new.
	accounts do: [:anAccount |
	 	transactions addAll: (anAccount transactions).
	].
	^ transactions

	! !


!Portfolio methodsFor: 'private' stamp: 'CS 6/8/2022 22:13:53'!
addFather: anAccount
	father := anAccount.! !


!Portfolio methodsFor: 'validation' stamp: 'CS 6/9/2022 14:47:03'!
validateAdditionOf: anAccount toADifferentFatherWhenAddingAnotherAccount: anotherAccount
	anotherAccount accounts do: [ :anAccountToCheck |
		(anAccountToCheck hasAnAccount: anAccount)
			ifTrue: [^self error: self class portfolioCannotAddSameAccountTwiceErrorDescription].
	].! !

!Portfolio methodsFor: 'validation' stamp: 'NR 6/9/2022 14:55:38'!
validateAdditionOf: anAccount whenAddingAnotherAccount: anotherAccount  
	anAccount accounts do: [ :anAccountToCheck |
		(anotherAccount hasAnAccount: anAccountToCheck)
			ifTrue: [^self error: self class portfolioCannotAddSameAccountTwiceErrorDescription].
	].
! !

!Portfolio methodsFor: 'validation' stamp: 'CS 6/9/2022 14:51:04'!
validateAdditionOfSameAccount: anAccount
	(self = anAccount) ifTrue: [^self error: self class portfolioCannotIncludeItselfErrorDescription].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'NR 6/8/2022 15:16:51'!
portfolioCannotAddSameAccountTwiceErrorDescription
	^'Cannot add same account twice!!'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'NR 6/8/2022 16:20:16'!
portfolioCannotIncludeItselfErrorDescription
	^ 'portfolio cannot include itself!!'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
AccountServices subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions father'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 6/9/2022 14:57:22'!
initialize
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 6/9/2022 14:57:13'!
hasAnAccount: anAccount
	^ self = anAccount.! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 6/9/2022 14:57:26'!
hasRegistered: aTransaction
	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 6/9/2022 14:56:52'!
accounts
	| accounts |
	accounts := OrderedCollection new.
	accounts add: self.
	^ accounts.
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 6/9/2022 14:56:56'!
balance
	^transactions inject: 0 into: [:balance :aTransaction | aTransaction processBalance: balance].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 6/9/2022 14:56:59'!
register: aTransaction
	transactions add: aTransaction. 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 6/9/2022 14:57:03'!
transactions 
	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'CS 6/8/2022 22:33:49'!
addFather: anAccount
	father := anAccount.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'NR 6/9/2022 14:58:27'!
value 
	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'NR 6/9/2022 14:58:30'!
processBalance: aBalance
	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'private' stamp: 'CS 6/6/2022 20:59:50'!
getCounterPartLegFrom: aTransfer
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 6/4/2022 14:51:16'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'NR 6/9/2022 14:59:04'!
initializeFor: aValue
	value := aValue.! !


!Deposit methodsFor: 'value' stamp: 'NR 6/8/2022 17:02:56'!
value
	^ value! !


!Deposit methodsFor: 'private' stamp: 'CS 6/6/2022 20:59:40'!
getCounterPartLegFrom: aTransfer
	^ aTransfer getWithdrawLeg.! !


!Deposit methodsFor: 'balance' stamp: 'CSYNR 6/2/2022 21:38:30'!
processBalance: aBalance
	^ aBalance + self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'NR 6/9/2022 14:59:16'!
initializeFor: aValue
	value := aValue.! !


!Withdraw methodsFor: 'value' stamp: 'NR 6/8/2022 17:03:39'!
value
	^ value! !


!Withdraw methodsFor: 'private' stamp: 'CS 6/6/2022 20:59:30'!
getCounterPartLegFrom: aTransfer
	^ aTransfer getDepositLeg.! !


!Withdraw methodsFor: 'balance' stamp: 'CSYNR 6/2/2022 21:38:30'!
processBalance: aBalance
	^ aBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'transferValue transferWithdrawTransaction transferDepositTransaction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'private' stamp: 'CS 6/6/2022 20:43:55'!
createTransferFrom: anAccountSender to: anAccountReceiver with: aValue. 	
	transferWithdrawTransaction := Withdraw register: aValue on: anAccountSender.
	transferDepositTransaction := Deposit register: aValue on: anAccountReceiver.
	transferValue := aValue.
	^ self.! !

!Transfer methodsFor: 'private' stamp: 'CS 6/6/2022 20:48:42'!
getTransferValue
	 ^ transferValue.! !


!Transfer methodsFor: 'transfer legs' stamp: 'CS 6/6/2022 20:56:07'!
getDepositLeg
	^ transferDepositTransaction.! !

!Transfer methodsFor: 'transfer legs' stamp: 'CS 6/6/2022 20:55:53'!
getWithdrawLeg
	^ transferWithdrawTransaction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 11:17:50'!
cannotTransferZeroPesosErrorDescription
	^ 'cannot Transfer Zero Pesos'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'NR 6/8/2022 16:53:36'!
from: anAccountSender to: anAccountReceiver aValueOf: aValue
	| transfer |
	aValue = 0 ifTrue: [self error: self cannotTransferZeroPesosErrorDescription].
	transfer := Transfer new.
	^ transfer createTransferFrom: anAccountSender to: anAccountReceiver with: aValue. ! !
