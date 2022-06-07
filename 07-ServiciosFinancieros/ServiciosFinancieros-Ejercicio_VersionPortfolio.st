!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 21:17:59'!
test01PortfolioHaveZeroAsBalanceWhenCreated 

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 21:13:44'!
test02

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	
	portfolio addAnAccount: account.
		
	self assert: 100 * peso equals: portfolio balance
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 21:19:31'!
test03

	| portfolio account1 account2 |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount  new.
	account2 := ReceptiveAccount  new.
	
	Deposit register: 100 * peso on: account1.
	Deposit register: 200 * peso on: account2.
	
	portfolio addAnAccount: account1.
	portfolio addAnAccount: account2.
		
	self assert: 300 * peso equals: portfolio balance
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 21:36:05'!
test04

	| portfolio account1 aTransactionOfAccount1 |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount  new.
	
	aTransactionOfAccount1 := Deposit register: 100 * peso on: account1.
	
	portfolio addAnAccount: account1.
		
	self assert: (portfolio hasRegisteredAnyTransaction: aTransactionOfAccount1) equals: true.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 21:36:35'!
test05

	| portfolio account1 |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount  new.
	
	portfolio addAnAccount: account1.
		
	self assert: (portfolio hasRegisteredAnyTransaction: nil) equals: false.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/6/2022 20:34:55'!
test08AnAccountCannotTransferZeroPesos
	
	| accountSender accountReceiver |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	self should: [ Transfer from: accountSender to: accountReceiver a: 0 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Transfer cannotTransferZeroPesosErrorDescription ].! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/6/2022 20:45:02'!
test09WhenATransferTransactionSucceedsSenderAccountBalanceGetsUpdated
	
	| accountSender accountReceiver |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	Transfer from: accountSender to: accountReceiver a: 5*peso.
	
	self assert: 5 * peso equals: accountSender balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/6/2022 20:45:43'!
test10WhenATransferTransactionSucceedsReceiverAccountBalanceGetsUpdated
	
	| accountSender accountReceiver |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	Transfer from: accountSender to: accountReceiver a: 5*peso.
	
	self assert: 105 * peso equals: accountReceiver balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/6/2022 20:50:46'!
test11YouCanGetValueOfATransferTransactionAfterItGotExecuted

	| accountSender accountReceiver transfer |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	transfer := Transfer from: accountSender to: accountReceiver a: 5*peso.
	
	self assert: 5 * peso equals: transfer getTransferValue.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/6/2022 21:00:58'!
test12AWithdrawLegCanGetItsCounterPartLeg

	| accountSender accountReceiver transfer depositLeg withdrawLeg |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	transfer := Transfer from: accountSender to: accountReceiver a: 5* peso.
	withdrawLeg := transfer getWithdrawLeg.
	depositLeg := transfer getDepositLeg.
	
	self assert: (withdrawLeg getCounterPartLegFrom: transfer) equals: (depositLeg). ! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/6/2022 21:01:34'!
test13ADepositLegCanGetItsCounterPartLeg

	| accountSender accountReceiver transfer depositLeg withdrawLeg |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	transfer := Transfer from: accountSender to: accountReceiver a: 5* peso.
	withdrawLeg := transfer getWithdrawLeg.
	depositLeg := transfer getDepositLeg.
	
	self assert: (depositLeg getCounterPartLegFrom: transfer) equals: (withdrawLeg). ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 20:59:50'!
getCounterPartLegFrom: aTransfer
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 16:11:04'!
isTransferType

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
	instanceVariableNames: 'value isTransferDeposit transferId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'CS 6/5/2022 17:59:38'!
initializeFor: aValue

	value := aValue.
	isTransferDeposit := false.
	transferId := -1.! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 20:59:40'!
getCounterPartLegFrom: aTransfer
	^ aTransfer getWithdrawLeg.! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:25:39'!
isTransactionTransfer
	^ isTransferDeposit = true.! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'CSYNR 6/2/2022 21:38:30'!
processBalance: aBalance
	^ aBalance + self value.! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:01:46'!
updateTransferData
	isTransferDeposit := true.
	transferId := 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value isTransferWithdraw transferId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'CS 6/5/2022 17:59:20'!
initializeFor: aValue

	value := aValue.
	isTransferWithdraw := false.
	transferId := -1.! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 20:59:30'!
getCounterPartLegFrom: aTransfer
	^ aTransfer getDepositLeg.! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:25:28'!
isTransactionTransfer
	^ isTransferWithdraw = true.! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'CSYNR 6/2/2022 21:38:30'!
processBalance: aBalance
	^ aBalance - self value.! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:02:36'!
updateTransferData
	isTransferWithdraw := true.
	transferId := 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 21:09:29'!
addAnAccount: anAccount
	accounts add: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 21:30:28'!
balance
	^ accounts sum: [ :anaccount | anaccount balance] ifEmpty: [^0].

	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 21:37:09'!
hasRegisteredAnyTransaction: aTransaction
	accounts do: [:anAccount | ^ (anAccount hasRegistered: aTransaction)].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 21:09:47'!
initialize
	accounts := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions transferTransaction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 6/4/2022 14:22:11'!
balance

	^transactions inject: 0 into: [:balance :aTransaction | aTransaction processBalance: balance].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 6/4/2022 13:46:09'!
register: aTransaction

	transactions add: aTransaction. 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !



!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'transferValue transferWithdrawTransaction transferDepositTransaction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 20:43:55'!
createTransferFrom: anAccountSender to: anAccountReceiver with: aValue. 	
	transferWithdrawTransaction := Withdraw register: aValue on: anAccountSender.
	transferDepositTransaction := Deposit register: aValue on: anAccountReceiver.
	transferValue := aValue.
	^ self.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 20:56:07'!
getDepositLeg
	^ transferDepositTransaction.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 20:48:42'!
getTransferValue
	 ^ transferValue.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 20:55:53'!
getWithdrawLeg
	^ transferWithdrawTransaction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 11:17:50'!
cannotTransferZeroPesosErrorDescription
	^ 'cannot Transfer Zero Pesos'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'CS 6/6/2022 20:40:04'!
from: anAccountSender to: anAccountReceiver a: aValue
	| transfer |
	aValue = 0 ifTrue: [self error: self cannotTransferZeroPesosErrorDescription].
	transfer := Transfer new.
	^ transfer createTransferFrom: anAccountSender to: anAccountReceiver with: aValue. ! !
