!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: 'firstAccount secondAccount summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'CS 6/14/2022 17:18:24'!
test01ShouldReturnAccountSummaryZeroIfAccountHasNoTransaction
	
	
	self assert: (summary getReportOf: firstAccount) equals: 'balance = 0 pesos'.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'CS 6/14/2022 17:18:24'!
test02ShouldReturnAccountSummaryWhenAccountHasDepositTransaction

	Deposit register: 100 on: firstAccount.
	
	self assert: (summary getReportOf: firstAccount) equals: 'Depósito por 100 pesos. balance = 100 pesos'.
	
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'CS 6/14/2022 17:18:24'!
test03ShouldReturnAccountSummaryWhenAccountHasDepositAndWithdrawTransaction
		
	Deposit register: 50 on: firstAccount.
	Withdraw register: 50 on: firstAccount.
		
	self assert: (summary getReportOf: firstAccount) equals: 'Depósito por 50 pesos. Extracción por 50 pesos. balance = 0 pesos'.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'CS 6/14/2022 17:18:32'!
test04ShouldReturnCorrectAccountSummaryInBothAccountWhoHasSufferTransfer
	
	Deposit register: 50 on: firstAccount.
	Deposit register: 30 on: secondAccount.
	
	Transfer from: firstAccount to: secondAccount aValueOf: 20.

	summary := AccountSummary createAccountSummaryReport.
	
	self assert: (summary getReportOf: firstAccount) equals: 'Depósito por 50 pesos. Salida por transferencia de 20 pesos. balance = 30 pesos'.
	self assert: (summary getReportOf: secondAccount) equals: 'Depósito por 30 pesos. Entrada por transferencia de 20 pesos. balance = 50 pesos'.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'CS 6/14/2022 17:18:24'!
test05ShouldReturnCorrectAccountSummaryWhenAccountHasWithdrawTransaction

	Withdraw register: 50 on: firstAccount.
	
	self assert: (summary getReportOf: firstAccount) equals: 'Extracción por 50 pesos. balance = -50 pesos'.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'CS 6/14/2022 17:18:32'!
test06ShouldReturnCorrectAccountSummaryInAccountWhoHasSufferMultipleTransactions

	
	Deposit register: 100 on: firstAccount.
	Withdraw register: 50 on: firstAccount.
	
	Transfer from: firstAccount to: secondAccount aValueOf: 20.
	Transfer from: secondAccount to: firstAccount aValueOf: 30.
	
	summary := AccountSummary createAccountSummaryReport.
	
	self assert: (summary getReportOf: firstAccount ) equals: 'Depósito por 100 pesos. Extracción por 50 pesos. Salida por transferencia de 20 pesos. Entrada por transferencia de 30 pesos. balance = 60 pesos'! !


!AccountSummaryTest methodsFor: 'setUp' stamp: 'CS 6/14/2022 17:18:32'!
setUp

	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	summary := AccountSummary createAccountSummaryReport.! !


!classDefinition: #PortfolioSummaryTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioSummaryTest methodsFor: 'test' stamp: 'CS 6/15/2022 17:19:28'!
test01
	| portfolio portfolioSummary |

	portfolio := Portfolio named: 'Mi portfolio'.
	portfolioSummary := PortfolioSummary createPortfolioSummary.

	self assert: (portfolioSummary getPortfolioSummaryReportOf: portfolio) equals: 'Mi portfolio. '.! !

!PortfolioSummaryTest methodsFor: 'test' stamp: 'CS 6/15/2022 17:19:22'!
test02
	| portfolioSummary familyPortfolio myAccount |

	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia'.
	familyPortfolio addAnAccount: myAccount.
	
	portfolioSummary := PortfolioSummary new.
	
	self assert: (portfolioSummary getPortfolioSummaryReportOf: familyPortfolio) equals: 
	'Portfolio de la familia. Cuenta mia. '.! !

!PortfolioSummaryTest methodsFor: 'test' stamp: 'CS 6/15/2022 17:19:31'!
test03
	
	| familyPortfolio myAccount portfolioSummary childrenPortfolio |
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia'.
	familyPortfolio addAnAccount: myAccount. 
	familyPortfolio addAnAccount: childrenPortfolio. 
	
	portfolioSummary := PortfolioSummary new.
	
	self assert: (portfolioSummary getPortfolioSummaryReportOf: familyPortfolio) equals: 
	'Portfolio de la familia. Cuenta mia. Portfolio de hijos. '.! !

!PortfolioSummaryTest methodsFor: 'test' stamp: 'CS 6/15/2022 17:19:37'!
test04
	
	| angiesAccount familyPortfolio johnsAccount myAccount portfolioSummary childrenPortfolio |
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
		
	childrenPortfolio := Portfolio named: 'Portfolio de hijos'.
	childrenPortfolio addAnAccount: johnsAccount. 
	childrenPortfolio addAnAccount: angiesAccount. 
	
	familyPortfolio := Portfolio named: 'Portfolio de la familia'.
	familyPortfolio addAnAccount: myAccount. 
	familyPortfolio addAnAccount: childrenPortfolio. 
	
	portfolioSummary := PortfolioSummary new.
	
	self assert: (portfolioSummary getPortfolioSummaryReportOf: familyPortfolio) equals: 
	'Portfolio de la familia. Cuenta mia. Portfolio de hijos. Cuenta de Juan. Cuenta de Angeles. '.! !

!PortfolioSummaryTest methodsFor: 'test' stamp: 'CS 6/15/2022 17:19:45'!
test05
	
	| familyPortfolio myAccount portfolioSummary |
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	Deposit register: 100 on: myAccount.

	familyPortfolio := Portfolio named: 'Portfolio de la familia'.
	familyPortfolio addAnAccount: myAccount. 
		
	portfolioSummary := PortfolioSummary new.
	
	self assert: (portfolioSummary getPortfolioSummaryWithDetailsReportOf: familyPortfolio) equals: 
	'Portfolio de la familia. Cuenta mia. Depósito por 100. Balance = 100. Balance = 100. '! !

!PortfolioSummaryTest methodsFor: 'test' stamp: 'CS 6/15/2022 17:44:25'!
test06
	
	| familyPortfolio myAccount portfolioSummary johnsAccount |
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	Deposit register: 100 on: myAccount.
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	Deposit register: 100 on: johnsAccount.
	Withdraw register: 50 on: johnsAccount.
	
	"angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	Deposit register: 100 on: angiesAccount.
	Transfer from: johnsAccount to: angiesAccount aValueOf: 5. 
		
	childrenPortfolio := Portfolio named: 'Portfolio de hijos'.
	childrenPortfolio addAnAccount: johnsAccount. 
	childrenPortfolio addAnAccount: angiesAccount. "
	
	familyPortfolio := Portfolio named: 'Portfolio de la familia'.
	familyPortfolio addAnAccount: myAccount. 
	familyPortfolio addAnAccount: johnsAccount.
	"familyPortfolio addAnAccount: childrenPortfolio. "
		
	portfolioSummary := PortfolioSummary new.
	
	self assert: (portfolioSummary getPortfolioSummaryWithDetailsReportOf: familyPortfolio) equals: 
	'Portfolio de la familia. Cuenta mia. Depósito por 100. Balance = 100. Cuenta de Juan. Depósito por 100. Extracción por 50. Balance = 50. Balance = 150. '! !

!PortfolioSummaryTest methodsFor: 'test' stamp: 'CS 6/15/2022 18:06:49'!
test07
	
	| familyPortfolio myAccount portfolioSummary johnsAccount angiesAccount childrenPortfolio account |
	
	myAccount := ReceptiveAccount named: 'Cuenta Mia'. 
	Deposit register: 100 on: myAccount.
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	Deposit register: 100 on: johnsAccount.
	Withdraw register: 50 on: johnsAccount.
	
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	account := ReceptiveAccount new.
	Transfer from: account to: angiesAccount aValueOf: 5. 
		
	childrenPortfolio := Portfolio named: 'Portfolio de hijos'.
	childrenPortfolio addAnAccount: johnsAccount. 
	childrenPortfolio addAnAccount: angiesAccount. 
	
	familyPortfolio := Portfolio named: 'Portfolio de la familia'.
	familyPortfolio addAnAccount: myAccount. 
	familyPortfolio addAnAccount: childrenPortfolio. 
		
	portfolioSummary := PortfolioSummary new.
	
	self assert: (portfolioSummary getPortfolioSummaryWithDetailsReportOf: familyPortfolio) equals: 
	'Portfolio de la familia. Cuenta Mia. Depósito por 100. Balance = 100. Portfolio de hijos. Cuenta de Juan. Depósito por 100. Extracción por 50. Balance = 50. Cuenta de Angeles. Entrada por transferencia de 5. Balance = 5. Balance = 55. Balance = 155. '! !


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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'cs 6/11/2022 13:21:01'!
test12AWithdrawLegCanGetItsCounterPartLeg

	| accountSender accountReceiver transfer |
	
	accountSender := account1.
	accountReceiver := account2.
	
	self registerInitialAccountValuesFor: accountSender andFor: accountReceiver.
	
	transfer := Transfer from: accountSender to: accountReceiver aValueOf: 5* peso.
	
	self assert: (transfer getWithdrawLeg) equals: (transfer getDepositLeg) getCounterPartLeg.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'cs 6/11/2022 13:21:01'!
test13ADepositLegCanGetItsCounterPartLeg

	| accountSender accountReceiver transfer |
	
	accountSender := account1.
	accountReceiver := account2.
	
	self registerInitialAccountValuesFor: accountSender andFor: accountReceiver.
	
	transfer := Transfer from: accountSender to: accountReceiver aValueOf: 5* peso.
	
	self assert: (transfer getDepositLeg) equals: (transfer getWithdrawLeg) getCounterPartLeg.! !


!ReceptiveAccountTest methodsFor: 'private' stamp: 'NR 6/8/2022 16:58:14'!
registerInitialAccountValuesFor: firstAccount andFor: secondAccount

	Deposit register: 10 * peso on: firstAccount.
	Deposit register: 100 * peso on: secondAccount.! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: 'firstAccount secondAccount transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferNetTest methodsFor: 'tests' stamp: 'CS 6/14/2022 17:25:16'!
test01ShouldTransferNetBeZeroIfAccountHasNoTransaction
	
	self assert: (transferNet getReportOf: firstAccount ) equals: 0.! !

!TransferNetTest methodsFor: 'tests' stamp: 'CS 6/14/2022 17:25:51'!
test02ShouldTransferNetBeZeroIfAccountHasNotSufferATransfer

	Deposit register: 100 on: firstAccount.
	
	self assert: (transferNet getReportOf: firstAccount) equals: 0.! !

!TransferNetTest methodsFor: 'tests' stamp: 'CS 6/14/2022 17:26:19'!
test03ShouldTransferNetBeNegativeIfAccountHasSufferAWithdrawTransfer
	
	Transfer from: firstAccount to: secondAccount aValueOf: 20.
	
	self assert: (transferNet getReportOf: firstAccount) equals: -20.! !

!TransferNetTest methodsFor: 'tests' stamp: 'CS 6/14/2022 17:26:52'!
test04ShouldTransferNetBeCorrectIfAccountHasSufferATransfer
	
	Transfer from: firstAccount to: secondAccount aValueOf: 20.
	Transfer from: secondAccount to: firstAccount aValueOf: 30.
	
	self assert: (transferNet getReportOf: firstAccount) equals: 10.! !

!TransferNetTest methodsFor: 'tests' stamp: 'CS 6/14/2022 17:27:17'!
test05ShouldTransferNetBeCorrectIfAccountHasSufferMultipleTransferTransactions
	
	Deposit register: 100 on: firstAccount.
	Transfer from: firstAccount to: secondAccount aValueOf: 20.
	Transfer from: secondAccount to: firstAccount aValueOf: 30.
	Transfer from: secondAccount to: firstAccount aValueOf: 30.
	
	self assert: (transferNet getReportOf: firstAccount) equals: 40.! !


!TransferNetTest methodsFor: 'setUp' stamp: 'CS 6/14/2022 17:25:04'!
setUp
	
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	transferNet := TransferNet createTransferNetReport.! !


!classDefinition: #AccountReport category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountReport
	instanceVariableNames: 'withdrawLeg depositLeg value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountReport methodsFor: 'private' stamp: 'CS 6/13/2022 21:31:22'!
getReportOf: anAccount
	self subclassResponsibility.! !

!AccountReport methodsFor: 'private' stamp: 'CS 6/13/2022 21:31:36'!
getTotalReport
	self subclassResponsibility.! !


!AccountReport methodsFor: 'adding' stamp: 'CS 6/14/2022 19:52:24'!
addDepositLegReportOf: aValue
	self subclassResponsibility.! !

!AccountReport methodsFor: 'adding' stamp: 'CS 6/14/2022 19:51:01'!
addDepositReportOf: aValue
	self subclassResponsibility.! !

!AccountReport methodsFor: 'adding' stamp: 'CS 6/14/2022 19:53:18'!
addWithdrawLegReportOf: aValue
	self subclassResponsibility.! !

!AccountReport methodsFor: 'adding' stamp: 'CS 6/14/2022 19:54:06'!
addWithdrawReportOf: aValue
	self subclassResponsibility.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Ejercicio'!
AccountReport subclass: #AccountSummary
	instanceVariableNames: 'accountSummaryReport'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountSummary methodsFor: 'private' stamp: 'CS 6/14/2022 19:49:13'!
getReportOf: anAccount

	accountSummaryReport := ''.
	(anAccount transactions) do: [ :aTransaction | aTransaction accept: self.].
	self addBalanceToReport: (anAccount balance).
	^ self getTotalReport.! !

!AccountSummary methodsFor: 'private' stamp: 'CS 6/12/2022 16:41:14'!
getTotalReport
	^ accountSummaryReport.! !


!AccountSummary methodsFor: 'initialize' stamp: 'cs 6/11/2022 18:51:37'!
initialize
	accountSummaryReport := ''.! !


!AccountSummary methodsFor: 'adding' stamp: 'CS 6/13/2022 20:44:16'!
addBalanceToReport: aBalance
	
	| balanceReport |
	balanceReport := 'balance = ',(aBalance asString), ' pesos'.
	accountSummaryReport := accountSummaryReport, balanceReport.! !

!AccountSummary methodsFor: 'adding' stamp: 'CS 6/14/2022 19:52:46'!
addDepositLegReportOf: aTransferDepositTransaction
	accountSummaryReport := accountSummaryReport, ('Entrada por transferencia de ', (aTransferDepositTransaction value) asString, ' pesos. ').
! !

!AccountSummary methodsFor: 'adding' stamp: 'CS 6/15/2022 16:28:30'!
addDepositReportOf: aDepositTransaction
	accountSummaryReport := accountSummaryReport, ('Depósito por ', (aDepositTransaction value) asString, ' pesos. ').! !

!AccountSummary methodsFor: 'adding' stamp: 'CS 6/12/2022 16:35:19'!
addReport: aTransactionReport
	accountSummaryReport := accountSummaryReport,aTransactionReport.! !

!AccountSummary methodsFor: 'adding' stamp: 'CS 6/14/2022 19:53:50'!
addWithdrawLegReportOf: aTransferWithdrawLegTransaction
	accountSummaryReport := accountSummaryReport, ('Salida por transferencia de ', (aTransferWithdrawLegTransaction value) asString, ' pesos. ').! !

!AccountSummary methodsFor: 'adding' stamp: 'CS 6/14/2022 19:54:23'!
addWithdrawReportOf: aWithdrawTransaction
	accountSummaryReport := accountSummaryReport, ('Extracción por ', (aWithdrawTransaction value) asString, ' pesos. ')
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Ejercicio'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'cs 6/11/2022 19:00:06'!
createAccountSummaryReport
	^ self new.! !


!classDefinition: #PortfolioSummary category: 'ServiciosFinancieros-Ejercicio'!
AccountReport subclass: #PortfolioSummary
	instanceVariableNames: 'portfolioSummary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioSummary methodsFor: 'adding' stamp: 'CS 6/15/2022 17:25:56'!
addBalanceToReport: aBalance
	
	| balanceReport |
	balanceReport := 'Balance = ',(aBalance asString), '. '.
	portfolioSummary := portfolioSummary, balanceReport.! !

!PortfolioSummary methodsFor: 'adding' stamp: 'CS 6/15/2022 17:24:51'!
addDepositLegReportOf: aTransferDepositTransaction
	portfolioSummary := portfolioSummary, ('Entrada por transferencia de ', (aTransferDepositTransaction value) asString),'. '.! !

!PortfolioSummary methodsFor: 'adding' stamp: 'CS 6/15/2022 17:24:55'!
addDepositReportOf: aDepositTransaction
	portfolioSummary := portfolioSummary, ('Depósito por ', (aDepositTransaction value) asString),'. '.! !

!PortfolioSummary methodsFor: 'adding' stamp: 'CS 6/15/2022 17:38:48'!
addSummaryReportOf: anAccount   
	(anAccount hasAnAccount: anAccount) ifTrue: [
			portfolioSummary := portfolioSummary, anAccount getName ,'. '.
			(anAccount transactions) do: [:aTransaction | 
				aTransaction accept: self.
			].
	] ifFalse: [
		portfolioSummary := portfolioSummary, anAccount getName ,'. '.
		(anAccount accounts) do: [:anAccount1 |
			self addSummaryReportOf: anAccount1.
		].
	].! !

!PortfolioSummary methodsFor: 'adding' stamp: 'CS 6/15/2022 18:11:29'!
addSummaryReportWithDetailsOf: anAccount   
	(anAccount hasAnAccount: anAccount) ifTrue: [
			portfolioSummary := portfolioSummary, anAccount getName ,'. '.
			(anAccount transactions) do: [:aTransaction | aTransaction accept: self. ].
	] ifFalse: [
		portfolioSummary := portfolioSummary, anAccount getName ,'. '.
		(anAccount accounts) do: [:anotherAccount |
			self addSummaryReportWithDetailsOf: anotherAccount.
			self addBalanceToReport: (anotherAccount balance).
		].
	].! !

!PortfolioSummary methodsFor: 'adding' stamp: 'CS 6/15/2022 17:24:39'!
addWithdrawLegReportOf: aTransferWithdrawLegTransaction
	portfolioSummary := portfolioSummary, ('Salida por transferencia de ', (aTransferWithdrawLegTransaction value) asString), '. '.! !

!PortfolioSummary methodsFor: 'adding' stamp: 'CS 6/15/2022 17:25:03'!
addWithdrawReportOf: aWithdrawTransaction
	portfolioSummary := portfolioSummary, ('Extracción por ', (aWithdrawTransaction value) asString), '. '.! !


!PortfolioSummary methodsFor: 'private' stamp: 'CS 6/15/2022 17:19:07'!
getPortfolioSummaryReportOf: aPortfolio

	portfolioSummary := aPortfolio getName, portfolioSummary, '. '.
	(aPortfolio accounts) do: [:anAccount1 |
		self addSummaryReportOf: anAccount1 .
	].
	^ portfolioSummary.! !

!PortfolioSummary methodsFor: 'private' stamp: 'CS 6/15/2022 17:38:17'!
getPortfolioSummaryWithDetailsReportOf: aPortfolio
	portfolioSummary := aPortfolio getName, portfolioSummary, '. '.
	(aPortfolio accounts) do: [:anAccount |
		self addSummaryReportWithDetailsOf: anAccount.   
		self addBalanceToReport: (anAccount balance).
	].
	self addBalanceToReport: (aPortfolio balance).
	^ portfolioSummary.! !


!PortfolioSummary methodsFor: 'initialization' stamp: 'CS 6/14/2022 19:06:32'!
initialize
	portfolioSummary := ''.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioSummary class' category: 'ServiciosFinancieros-Ejercicio'!
PortfolioSummary class
	instanceVariableNames: ''!

!PortfolioSummary class methodsFor: 'as yet unclassified' stamp: 'CS 6/14/2022 19:02:48'!
createPortfolioSummary
	^ self new.! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Ejercicio'!
AccountReport subclass: #TransferNet
	instanceVariableNames: 'accountTransferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferNet methodsFor: 'private' stamp: 'CS 6/14/2022 19:54:38'!
getReportOf: anAccount 
	(anAccount transactions) do: [ :aTransaction | aTransaction accept: self ].
	^ self getTotalReport.! !

!TransferNet methodsFor: 'private' stamp: 'CS 6/14/2022 17:24:13'!
getTotalReport
	^ accountTransferNet.! !


!TransferNet methodsFor: 'adding' stamp: 'CS 6/14/2022 19:55:53'!
addDepositLegReportOf: aTransferDepositTransaction
	accountTransferNet :=  accountTransferNet + (aTransferDepositTransaction value).! !

!TransferNet methodsFor: 'adding' stamp: 'CS 6/14/2022 19:56:01'!
addDepositReportOf: aDepositTransaction
	accountTransferNet :=  accountTransferNet + 0.! !

!TransferNet methodsFor: 'adding' stamp: 'CS 6/14/2022 19:56:17'!
addWithdrawLegReportOf: aTransferWithdrawLegTransaction
	accountTransferNet :=  accountTransferNet - (aTransferWithdrawLegTransaction value).! !

!TransferNet methodsFor: 'adding' stamp: 'CS 6/14/2022 19:56:23'!
addWithdrawReportOf: aWithdrawTransaction
	accountTransferNet :=  accountTransferNet + 0.! !


!TransferNet methodsFor: 'initialize' stamp: 'CS 6/14/2022 17:24:13'!
initialize 
	accountTransferNet := 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'ServiciosFinancieros-Ejercicio'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'as yet unclassified' stamp: 'cs 6/11/2022 19:10:10'!
createTransferNetReport
	^ self new.! !


!classDefinition: #AccountServices category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountServices
	instanceVariableNames: 'name'
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

!AccountServices methodsFor: 'private' stamp: 'CS 6/14/2022 17:48:56'!
addName: aName
	self subclassResponsibility.! !

!AccountServices methodsFor: 'private' stamp: 'CS 6/14/2022 18:56:24'!
getName
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


!Portfolio methodsFor: 'main protocol' stamp: 'CS 6/14/2022 21:07:47'!
accounts
	
	| copyOfAccounts |
	copyOfAccounts := accounts copy.
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

!Portfolio methodsFor: 'private' stamp: 'CS 6/14/2022 17:48:32'!
addName: aName
	name := aName.! !

!Portfolio methodsFor: 'private' stamp: 'CS 6/14/2022 18:04:20'!
getName
	^ name! !


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

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'CS 6/14/2022 18:19:44'!
named: aPortfolioName

	| portfolio |
	portfolio := self new.

	portfolio addName: aPortfolioName.
		
	^ portfolio.! !

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


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'CS 6/14/2022 21:12:39'!
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

!ReceptiveAccount methodsFor: 'private' stamp: 'CS 6/14/2022 17:45:25'!
addName: aName
	name := aName.! !

!ReceptiveAccount methodsFor: 'private' stamp: 'CS 6/14/2022 18:56:15'!
getName
	^ name.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'CS 6/14/2022 17:45:08'!
named: aName
	| account |
	account := self new.
	account addName: aName.
	^ account.! !


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


!AccountTransaction methodsFor: 'report' stamp: 'CS 6/15/2022 16:29:38'!
accept: anAccountReport
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


!Deposit methodsFor: 'balance' stamp: 'CSYNR 6/2/2022 21:38:30'!
processBalance: aBalance
	^ aBalance + self value.! !


!Deposit methodsFor: 'report' stamp: 'CS 6/15/2022 16:29:31'!
accept: anAccountReport
	anAccountReport addDepositReportOf: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLegs category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferLegs
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLegs methodsFor: 'intialize' stamp: 'cs 6/11/2022 13:04:10'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLegs methodsFor: 'value' stamp: 'cs 6/11/2022 13:14:41'!
value

	^transfer getTransferValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLegs class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLegs class
	instanceVariableNames: ''!

!TransferLegs class methodsFor: 'as yet unclassified' stamp: 'cs 6/11/2022 12:58:09'!
of: aTransfer on: anAccount
	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLegs subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDepositLeg methodsFor: 'balance' stamp: 'cs 6/11/2022 13:00:22'!
processBalance: aBalance
	^ aBalance + self value.! !


!TransferDepositLeg methodsFor: 'private' stamp: 'cs 6/11/2022 13:21:01'!
getCounterPartLeg
	^ transfer getWithdrawLeg.! !


!TransferDepositLeg methodsFor: 'report' stamp: 'CS 6/15/2022 16:29:17'!
accept: anAccountReport
	anAccountReport addDepositLegReportOf: self.  ! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLegs subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdrawLeg methodsFor: 'private' stamp: 'cs 6/11/2022 13:21:01'!
getCounterPartLeg
	^ transfer getDepositLeg.! !


!TransferWithdrawLeg methodsFor: 'report' stamp: 'CS 6/15/2022 16:29:22'!
accept: anAccountReport
	anAccountReport addWithdrawLegReportOf: self. ! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'cs 6/11/2022 13:00:27'!
processBalance: aBalance
	^ aBalance - self value.! !


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


!Withdraw methodsFor: 'balance' stamp: 'CSYNR 6/2/2022 21:38:30'!
processBalance: aBalance
	^ aBalance - self value.! !


!Withdraw methodsFor: 'report' stamp: 'CS 6/15/2022 16:29:25'!
accept: anAccountReport
	anAccountReport addWithdrawReportOf: (self value). ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'withdrawLeg depositLeg value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'private' stamp: 'cs 6/11/2022 13:13:16'!
createTransferFrom: aWithdraw to: aDeposit with: aValue
	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit.! !

!Transfer methodsFor: 'private' stamp: 'cs 6/11/2022 13:16:47'!
getDepositLeg
	^ depositLeg.! !

!Transfer methodsFor: 'private' stamp: 'cs 6/11/2022 13:13:40'!
getTransferValue
	 ^ value.! !

!Transfer methodsFor: 'private' stamp: 'cs 6/11/2022 13:16:34'!
getWithdrawLeg
	^ withdrawLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'CS 6/5/2022 11:17:50'!
cannotTransferZeroPesosErrorDescription
	^ 'cannot Transfer Zero Pesos'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'cs 6/11/2022 13:15:30'!
from: anAccountSender to: anAccountReceiver aValueOf: aValue

	| transfer depositLeg withdrawLeg |
	
	aValue = 0 ifTrue: [self error: self cannotTransferZeroPesosErrorDescription].
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: anAccountSender.
	depositLeg := TransferDepositLeg of: transfer on: anAccountReceiver.
	
	^transfer createTransferFrom: withdrawLeg to: depositLeg with: aValue. 	! !
