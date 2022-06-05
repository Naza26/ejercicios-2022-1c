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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/5/2022 11:18:44'!
test08AnAccountCannotTransferZeroPesos
	
	| accountSender accountReceiver |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	self should: [ accountSender transfer: 0 * peso on: accountReceiver ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Transfer cannotTransferZeroPesosErrorDescription ].
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/5/2022 13:41:49'!
test09WhenATransferTransactionSucceedsBothSenderAndReceiverBalanceGetsUpdated
	
	| accountSender accountReceiver |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	accountSender transfer: 5 * peso on: accountReceiver.
	
	self assert: (5 * peso) equals: accountSender balance.
	self assert: (105 * peso) equals: accountReceiver balance.
	

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/5/2022 18:27:31'!
test10
	| accountSender accountReceiver |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	accountSender transfer: 5 on: accountReceiver. 
	
	self assert: (accountSender hasRegisteredATransferWithdraw).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/5/2022 18:31:24'!
test11
	| accountSender accountReceiver |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	accountSender transfer: 5 on: accountReceiver. 

	self assert: (accountReceiver hasRegisteredATransferDeposit).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/5/2022 18:48:57'!
test12
	| accountSender accountReceiver transferDeposit|
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	accountSender transfer: 5 on: accountReceiver. 
	
	transferDeposit := accountReceiver transferTransactionDeposit.

	self assert: (accountSender getCounterPart: anAccount = transferDeposit).
	! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/5/2022 18:48:28'!
test13
	| accountSender accountReceiver transferWithdraw |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	accountSender transfer: 5 on: accountReceiver. 
	
	transferWithdraw := accountSender transferTransactionWithdraw .

	self assert: (accountReceiver getCounterPart: accountSender = transferWithdraw).
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


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


!Withdraw methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:48:57'!
getCounterPart: anAccount
! !

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

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'CS 6/5/2022 17:58:28'!
transfer: aValue on: anAccountToBeTransferred

	| transferDeposit transferWithdraw |
	
	transferWithdraw := Transfer createATransferWithdrawFrom: self to: anAccountToBeTransferred with: aValue.
	transferDeposit := Transfer createATransferDepositFrom: anAccountToBeTransferred to: self with: aValue.

	transferWithdraw processTransfer.
	transferDeposit processTransfer.
! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:54:00'!
getCounterPart: anAccount
	"^ transactions detect: [:aTransaction | 
		(aTransaction isTransactionTransfer) ifTrue: [
			(aTransaction transactionId = ) ifTrue: [
				 .
			].
		]. 
	].
	^ nil."! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:31:52'!
hasRegisteredATransferDeposit
	transactions do: [:aTransaction | 
		(aTransaction isTransactionTransfer) ifTrue: [
			(aTransaction isKindOf: Deposit) ifTrue: [
				^ true.
			].
		]. 
	].
	^ false.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:30:51'!
hasRegisteredATransferWithdraw
	
	transactions do: [:aTransaction | 
		(aTransaction isTransactionTransfer) ifTrue: [
			(aTransaction isKindOf: Withdraw) ifTrue: [
				^ true.
			].
		]. 
	].
	^ false.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:38:58'!
transferTransactionDeposit
	transactions do: [:aTransaction | 
		(aTransaction isTransactionTransfer) ifTrue: [
			(aTransaction isKindOf: Deposit) ifTrue: [
				^ aTransaction.
			].
		]. 
	].
	^ nil.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:38:43'!
transferTransactionWithdraw
	transactions do: [:aTransaction | 
		(aTransaction isTransactionTransfer) ifTrue: [
			(aTransaction isKindOf: Withdraw) ifTrue: [
				^ aTransaction.
			].
		]. 
	].
	^ nil.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'transferValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 13:29:26'!
assignedTransactionValue: aValue
	transferValue := aValue.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 13:46:24'!
from: anAccountSender to: anAccountReceiver  
	
	self subclassResponsibility.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:48:57'!
getCounterPart: anAccount
	self subclassResponsibility.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 13:39:44'!
processTransfer
	self subclassResponsibility.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 13:29:39'!
value
	^ transferValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 11:17:50'!
cannotTransferZeroPesosErrorDescription
	^ 'cannot Transfer Zero Pesos'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 16:43:09'!
createATransferDepositFrom: aSenderAccount to: aReceiverAccount with: aValue
	| transferDeposit |
	aValue = 0 ifTrue: [^ self error: self cannotTransferZeroPesosErrorDescription].
	transferDeposit := (TransferDeposit new).
	transferDeposit assignedTransactionValue: aValue.
	^  transferDeposit from: aReceiverAccount to: aSenderAccount .! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 13:46:24'!
createATransferWithdrawFrom: aSenderAccount to: aReceiverAccount with: aValue
	| transferWithdraw |
	aValue = 0 ifTrue: [^ self error: self cannotTransferZeroPesosErrorDescription].
	transferWithdraw := TransferWithdraw new.
	transferWithdraw assignedTransactionValue: aValue.
	^ transferWithdraw from: aSenderAccount to: aReceiverAccount ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #TransferDeposit
	instanceVariableNames: 'accountTransferReceiver accountTransferSender transferType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 13:46:24'!
from: anAccountSender to: anAccountReceiver  

	accountTransferReceiver := anAccountReceiver.
	accountTransferSender := anAccountSender.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:01:10'!
processTransfer
	| transferDeposit |
	transferDeposit := Deposit register: (self value) on: accountTransferReceiver.
	transferDeposit updateTransferData. ! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #TransferWithdraw
	instanceVariableNames: 'accountTransferReceiver accountTransferSender transferType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 13:46:24'!
from: anAccountSender to: anAccountReceiver  

	accountTransferReceiver := anAccountReceiver.
	accountTransferSender := anAccountSender.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 18:02:19'!
processTransfer
	| transferWithdraw |
	transferWithdraw := Withdraw register: (self value) on: accountTransferSender.
	transferWithdraw updateTransferData.! !
