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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CS 6/5/2022 13:31:47'!
test10
	| accountSender accountReceiver transferTransaction |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	transferTransaction := accountSender transfer: 5 on: accountReceiver.
	
	"transferTypeOfTransaction := getCounterPartFrom: TransferDeposit madeBy: anAccount.

transferTypeOfTransaction devuelve TransferWithdraw affecting anotherAccount
y viceversa:
transferTypeOfTransaction := getCounterPartFrom: TransferWithdraw madeBy: anAccount.

transferTypeOfTransaction devuelve TransferDeposit affecting anotherAccount"! !


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
	instanceVariableNames: 'value typeOfTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 15:14:29'!
assignTransferType: transferType
	typeOfTransfer := transferType.! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 16:11:21'!
isTransferType

	^false.! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 15:43:21'!
isTransferWithdraw

	^false! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'CSYNR 6/2/2022 21:38:30'!
processBalance: aBalance
	^ aBalance + self value.! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'CSYNR 6/2/2022 21:31:46'!
valueInBalance
	^ self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value typeOfTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 15:14:34'!
assignTransferType: transferType
	typeOfTransfer := transferType.! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 15:43:13'!
isTransferDeposit

	^false! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 16:11:26'!
isTransferType

	^false.! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'CSYNR 6/2/2022 21:38:30'!
processBalance: aBalance
	^ aBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions typeOfTransfer'
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

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'CS 6/5/2022 13:40:46'!
transfer: aValue on: anAccountToBeTransferred

	| transferDeposit transferWithdraw |
	
	transferWithdraw := Transfer createATransferWithdrawFrom: self to: anAccountToBeTransferred with: aValue.
	transferDeposit := Transfer createATransferDepositFrom: anAccountToBeTransferred to: self with: aValue.
	
	transferWithdraw processTransfer.
	transferDeposit processTransfer.! !


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

!Transfer class methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 13:46:24'!
createATransferDepositFrom: aSenderAccount to: aReceiverAccount with: aValue
	| transferDeposit |
	aValue = 0 ifTrue: [^ self error: self cannotTransferZeroPesosErrorDescription].
	transferDeposit := (TransferDeposit new).
	transferDeposit assignedTransactionValue: aValue.
	^  transferDeposit from: aSenderAccount to: aReceiverAccount .! !

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

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 13:45:13'!
processTransfer
	Deposit register: (self value) on: accountTransferReceiver.! !


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

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 13:45:42'!
processTransfer
	Withdraw register: (self value) on: accountTransferSender.! !
