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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/4/2022 14:12:53'!
test08AnAccountCannotTransferZeroPesos
	
	| accountSender accountReceiver |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	self should: [ accountSender transfer: 0 * peso on: accountReceiver ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = ReceptiveAccount cannotTransferZeroPesosErrorDescription ].
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/4/2022 17:01:28'!
test09WhenATransferTransactionSucceedsBothSenderAndReceiverBalanceGetsUpdated
	
	| accountSender accountReceiver |
	
	accountSender := ReceptiveAccount  new.
	Deposit register: 10 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.
	
	accountSender transfer: 5 on: accountReceiver.
	
	self assert: (5 * peso) equals: accountSender balance.
	self assert: (105 * peso) equals: accountReceiver balance.
	

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/4/2022 16:08:36'!
test10SenderAccountKnowsTransferredTransaction
	
	| accountSender accountReceiver |
		
	accountSender := ReceptiveAccount  new.
	Deposit register: 50 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.

	accountSender transfer: 10 on: accountReceiver.
	
	self assert: (accountSender hasRegisteredTransferWithdraw).
	
	"Sender Account sufrio una extracccion a raiz de una transferencia"
	

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/4/2022 16:37:27'!
test11ReceiverAccountKnowsTransferredTransaction
	
	| accountSender accountReceiver |
		
	accountSender := ReceptiveAccount  new.
	Deposit register: 50 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.

	accountSender transfer: 10 on: accountReceiver.
	
	self assert: (accountReceiver hasRegisteredTransferDeposit).
	
	"Receiver Account sufrio un deposito a raiz de una transferencia"
	

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/4/2022 16:44:55'!
test12SenderAndReceiverAccountKnowsTransferredTransaction
	
	| accountSender accountReceiver |
		
	accountSender := ReceptiveAccount  new.
	Deposit register: 50 * peso on: accountSender.

	accountReceiver := ReceptiveAccount  new.
	Deposit register: 100 * peso on: accountReceiver.

	accountSender transfer: 10 on: accountReceiver.
	
	self assert: (accountSender hasRegisteredTransferWithdraw).
	self deny: (accountSender hasRegisteredTransferDeposit).
	self assert: (accountReceiver hasRegisteredTransferDeposit).
	self deny: (accountReceiver hasRegisteredTransferWithdraw).
	

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


!AccountTransaction class methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 19:52:49'!
register: aValue from: aSenderAccount to: aReceiverAccount

	| transferForReceiverAccount transferForSenderAccount |
	(aValue = 0) ifTrue: [^self error: ReceptiveAccount cannotTransferZeroPesosErrorDescription ]. "transfer deberia lanzar la excepcion"
	
	"Aca registramos la extraccion para la cuenta que manda y el deposito para la cuenta que reciba"
	Withdraw register: aValue on: aSenderAccount.
	Deposit register: aValue on: aReceiverAccount.
	
	"Aca registramos la transferencia para ambas cuentas"
	transferForSenderAccount := self register: aValue on: aSenderAccount.
	transferForReceiverAccount := self register: aValue on: aReceiverAccount.
	
	transferForSenderAccount assignTransferWithdrawDone.
	transferForReceiverAccount assignTransferDepositDone.
	! !


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


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transfer
	instanceVariableNames: 'value isTransferWithdraw isTransferDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 16:51:55'!
assignTransferDepositDone

	isTransferWithdraw := false.
	isTransferDeposit := true.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 16:50:57'!
assignTransferWithdrawDone

	isTransferWithdraw := true.
	isTransferDeposit := false.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 14:09:36'!
initializeFor: aValue

	value := aValue ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 16:52:56'!
isTransferDepositDone
	^ isTransferDeposit and: (isTransferWithdraw not).! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 16:11:32'!
isTransferType

	^true.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 16:50:09'!
isTransferWithdrawDone
	^ isTransferWithdraw and: (isTransferDeposit not).! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 16:59:52'!
processBalance: aBalance
	^ aBalance.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 13:50:18'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 13:51:01'!
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
	instanceVariableNames: 'transactions'
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

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 6/4/2022 15:52:54'!
transfer: aValue on: anAccountToBeTransferred
	
	^Transfer register: aValue * peso from: self to: anAccountToBeTransferred.
	! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 16:37:48'!
hasRegisteredTransferDeposit

	| isTransferFound |
	isTransferFound := transactions detect: [ :aTransaction | aTransaction isTransferType].
	^ (isTransferFound isKindOf: Transfer) and: (isTransferFound isTransferDepositDone).
	
	"estamos rompiendo encapsulamiento porque estamos accediendo a un mensaje que nos devuelve el colab interno de account transacion"! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'NR 6/4/2022 16:35:34'!
hasRegisteredTransferWithdraw

	| isTransferFound |
	isTransferFound := transactions detect: [ :aTransaction | aTransaction isTransferType].
	^ (isTransferFound isKindOf: Transfer) and: (isTransferFound isTransferWithdrawDone).
	
	"estamos rompiendo encapsulamiento porque estamos accediendo a un mensaje que nos devuelve el colab interno de account transacion"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'CSYNR 6/2/2022 21:56:50'!
cannotTransferZeroPesosErrorDescription
	^ 'cannot Transfer Zero Pesos'! !
