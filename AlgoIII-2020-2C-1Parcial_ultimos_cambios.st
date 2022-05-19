!classDefinition: #CoffeeShopTest category: 'AlgoIII-2020-2C-1Parcial'!
TestCase subclass: #CoffeeShopTest
	instanceVariableNames: 'billGates adaLovelace alanKay salesSystem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!CoffeeShopTest methodsFor: 'setUp/tearDown' stamp: 'LL 9/22/2020 21:41:38'!
setUp

	adaLovelace := CoffeeShopCustomer named: 'Ada Lovelace' ofType: #Gold.
	alanKay := CoffeeShopCustomer named: 'Alan Kay' ofType: #Silver.
	billGates := CoffeeShopCustomer named: 'Bill Gates' ofType: #Normal! !


!CoffeeShopTest methodsFor: 'test objects' stamp: 'LL 9/20/2020 17:15:53'!
combo1

	^#Combo1! !

!CoffeeShopTest methodsFor: 'test objects' stamp: 'LL 9/20/2020 17:21:01'!
combo2

	^#Combo2! !


!CoffeeShopTest methodsFor: 'tests - sales' stamp: 'LL 9/22/2020 21:41:51'!
test01ThereAreNoSalesWhenSalesSystemIsCreated

	salesSystem := CoffeeShopSalesSystem new.

	self assert: (salesSystem salesMadeTo: adaLovelace) isEmpty! !

!CoffeeShopTest methodsFor: 'tests - sales' stamp: 'NR 5/19/2022 15:17:01'!
test02CanQuerySalesByCustomer

	salesSystem := CoffeeShopSalesSystem new.
	
	self generate: 1 to: adaLovelace ofCombo: self combo1.
	
	self assertNumberOfSales: 1 madeTo: adaLovelace of: self combo1.! !

!CoffeeShopTest methodsFor: 'tests - sales' stamp: 'NR 5/18/2022 11:53:58'!
test03SalesAreDistinguishedByCustomer

	salesSystem := CoffeeShopSalesSystem new.
	
	self generate: 2 to: adaLovelace ofCombo: self combo1.
	self generate: 1 to: alanKay ofCombo: self combo2.
	
	self assertNumberOfSales: 2 madeTo: adaLovelace of: self combo1.
	self assertNumberOfSales: 1 madeTo: alanKay of: self combo2.! !


!CoffeeShopTest methodsFor: 'tests - volume sold' stamp: 'NR 5/18/2022 12:42:12'!
test04VolumeSoldToCustomerIsZeroWhenCustomerHasNoSaleRegistered

	salesSystem := CoffeeShopSalesSystem new.
	
	self assertVolumeOf: 0*milliliter soldTo: adaLovelace.! !

!CoffeeShopTest methodsFor: 'tests - volume sold' stamp: 'NR 5/18/2022 12:42:54'!
test05VolumeIs_250_WhenOnlyCombo1WasSoldToCustomer

	salesSystem := CoffeeShopSalesSystem new.
	
	self generate: 1 to: adaLovelace ofCombo: self combo1.
	
	self assertVolumeOf: 250*milliliter soldTo: adaLovelace.! !

!CoffeeShopTest methodsFor: 'tests - volume sold' stamp: 'NR 5/18/2022 12:43:28'!
test06VolumeIs_100_WhenOnlyCombo2WasSoldToCustomer

	salesSystem := CoffeeShopSalesSystem new.
	
	self generate: 1 to: adaLovelace ofCombo: self combo2.
	
	self assertVolumeOf: 100*milliliter soldTo: adaLovelace.
	! !

!CoffeeShopTest methodsFor: 'tests - volume sold' stamp: 'NR 5/18/2022 12:43:58'!
test07VolumeSoldToCustomerIsTheSumOfAllSoldProducts

	salesSystem := CoffeeShopSalesSystem new.
	
	self generate: 1 to: adaLovelace ofCombo: self combo1.
	self generate: 1 to: adaLovelace ofCombo: self combo2.
	
	self assertVolumeOf: (250*milliliter)+(100*milliliter) soldTo: adaLovelace.! !


!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'LL 9/22/2020 21:48:39'!
test08NoRewardExpectedWhenCustomerHasNotBuyAnything

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem rewardOf: adaLovelace ifNone: [ ^self ].
	
	self failWith: 'No reward expected when customer has not buy anything'! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'NR 5/18/2022 20:10:14'!
test09GoldCustomerGetsRewardedWithOneCombo2With50PercentItsPriceWhenRule1Holds

	| adaLovelaceReward |

	salesSystem := CoffeeShopSalesSystem new.
	
	self generate: 1 to: adaLovelace ofCombo: self combo1.
	self generate: 1 to: adaLovelace ofCombo: self combo2.

	adaLovelaceReward := salesSystem rewardOf: adaLovelace ifNone: [ self fail ].
	
	self assertACustomerRewardGiven: adaLovelaceReward withThePriceOf: (60*peso) forAQuantityOf: 1.
	self assert: adaLovelaceReward isForCombo2. "esto es lo unico que me quedo repetido en los tests"! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'NR 5/18/2022 20:08:41'!
test10SilverCustomerGetsRewardedWithOneCombo2With75PercentItsPriceWhenRule1Holds

	| alaKayReward |

	salesSystem := CoffeeShopSalesSystem new.
	
	self generate: 1 to: alanKay ofCombo: self combo1.
	self generate: 1 to: alanKay ofCombo: self combo2.

	alaKayReward := salesSystem rewardOf: alanKay ifNone: [ self fail ].
	
	self assertACustomerRewardGiven: alaKayReward withThePriceOf: (120*3/4*peso) forAQuantityOf: 1.
	self assert: (alaKayReward isForCombo2).
! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'NR 5/18/2022 20:09:02'!
test11NormalCustomerGetsRewardedWithOneCombo2With90PercentItsPriceWhenRule1Holds

	| billGatesReward |

	salesSystem := CoffeeShopSalesSystem new.
	
	self generate: 1 to: billGates ofCombo: self combo1.
	self generate: 1 to: billGates ofCombo: self combo2.

	billGatesReward := salesSystem rewardOf: billGates ifNone: [ self fail ].
	
	self assertACustomerRewardGiven: billGatesReward withThePriceOf: (120*9/10*peso) forAQuantityOf: 1.
	self assert: (billGatesReward isForCombo2).
! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'NR 5/19/2022 15:51:38'!
test12GoldCustomerGetsRewardedWithOneCombo1At75PesosWhenRule2Holds

	| adaLovelaceReward |

	salesSystem := CoffeeShopSalesSystem new.
	
	self generate: 2 to: adaLovelace ofCombo: self combo1.
	self generate: 1 to: adaLovelace ofCombo: self combo2.

	adaLovelaceReward := salesSystem rewardOf: adaLovelace ifNone: [ self fail ].

	self assertACustomerRewardGiven: adaLovelaceReward withThePriceOf: (75*peso) forAQuantityOf: 2.
	self assert: (adaLovelaceReward isForCombo1).! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'NR 5/18/2022 20:09:29'!
test13SilverCustomerGetsRewardedWithOneCombo1At83PesosWhenRule2Holds

	| alanKayReward |

	salesSystem := CoffeeShopSalesSystem new.
	
	self generate: 2 to: alanKay ofCombo: self combo1.
	self generate: 1 to: alanKay ofCombo: self combo2.

	alanKayReward := salesSystem rewardOf: alanKay ifNone: [ self fail ].	
	
	self assertACustomerRewardGiven: alanKayReward withThePriceOf: (83*peso) forAQuantityOf: 2.
	self assert: (alanKayReward isForCombo1).
! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'NR 5/18/2022 20:09:41'!
test14NormalCustomerGetsRewardedWithOneCombo1At97PesosWhenRule2Holds

	| billGatesReward |

	salesSystem := CoffeeShopSalesSystem new.
	
	self generate: 2 to: billGates ofCombo: self combo1.
	self generate: 1 to: billGates ofCombo: self combo2.

	billGatesReward := salesSystem rewardOf: billGates ifNone: [ self fail ].
	
	self assertACustomerRewardGiven: billGatesReward withThePriceOf: (97*peso) forAQuantityOf: 2.
	self assert: (billGatesReward isForCombo1).
! !


!CoffeeShopTest methodsFor: 'private' stamp: 'NR 5/18/2022 20:07:05'!
assertACustomerRewardGiven: aReward withThePriceOf: rewardPrice forAQuantityOf: aRewardQuantity

	self assert: aRewardQuantity equals: aReward quantity.
	self assert: rewardPrice equals: aReward price.
! !

!CoffeeShopTest methodsFor: 'private' stamp: 'NR 5/18/2022 11:51:15'!
assertNumberOfSales: aNumberOfSales madeTo: aCustomer of: aCombo

	| salesToAdaLovelace |
	
	salesToAdaLovelace := salesSystem salesMadeTo: aCustomer.
	self assert: aNumberOfSales equals: salesToAdaLovelace size.
	self assert: aNumberOfSales equals: (salesToAdaLovelace count: [ :aProduct | aProduct = aCombo ])! !

!CoffeeShopTest methodsFor: 'private' stamp: 'NR 5/18/2022 12:41:23'!
assertVolumeOf: milliliters soldTo: aCustomer

	self assert: milliliters equals: (salesSystem volumeSoldTo: aCustomer). ! !

!CoffeeShopTest methodsFor: 'private' stamp: 'NR 5/18/2022 20:13:09'!
generate: xNumberOfSales to: aCustomer ofCombo: aCombo

	xNumberOfSales timesRepeat:  [salesSystem registerSaleTo: aCustomer of: aCombo].! !


!classDefinition: #CoffeeShopCustomer category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #CoffeeShopCustomer
	instanceVariableNames: 'name type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!CoffeeShopCustomer methodsFor: 'type' stamp: 'LL 9/21/2020 13:05:10'!
type

	^type! !


!CoffeeShopCustomer methodsFor: 'initialization' stamp: 'LL 9/21/2020 13:00:45'!
initializeNamed: aName ofType: aType

	name := aName.
	type := aType ! !


!CoffeeShopCustomer methodsFor: 'printing' stamp: 'LL 9/22/2020 18:57:07'!
printOn: aStream

	aStream
		nextPutAll: 'Customer named ';
		nextPutAll: name! !


!CoffeeShopCustomer methodsFor: 'as yet unclassified' stamp: 'NR 5/19/2022 14:56:40'!
isTypeOfCustomer: aTypeOfCustomer
	
	self subclassResponsibility.! !

!CoffeeShopCustomer methodsFor: 'as yet unclassified' stamp: 'NR 5/19/2022 15:35:16'!
priceToPayForCombo1

	self subclassResponsibility.! !

!CoffeeShopCustomer methodsFor: 'as yet unclassified' stamp: 'NR 5/19/2022 15:42:53'!
priceToPayForCombo2

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CoffeeShopCustomer class' category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopCustomer class
	instanceVariableNames: ''!

!CoffeeShopCustomer class methodsFor: 'instance creation' stamp: 'LL 9/21/2020 13:00:21'!
named: aName ofType: aType

	^self new initializeNamed: aName ofType: aType! !


!classDefinition: #Gold category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopCustomer subclass: #Gold
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Gold methodsFor: 'as yet unclassified' stamp: 'NR 5/19/2022 14:55:53'!
isTypeOfCustomer: aTypeOfCustomer

	^ aTypeOfCustomer = #Gold.
	

	! !

!Gold methodsFor: 'as yet unclassified' stamp: 'NR 5/19/2022 15:35:16'!
priceToPayForCombo1

	^ 75*peso.! !

!Gold methodsFor: 'as yet unclassified' stamp: 'NR 5/19/2022 15:43:03'!
priceToPayForCombo2

	^ (120*peso)/2
	
	
	"aProduct = #Combo1 ifTrue: [ ^150*peso ].
	aProduct = #Combo2 ifTrue: [ ^120*peso ].

	self error: 'Invalid combo type'"! !


!classDefinition: #Normal category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopCustomer subclass: #Normal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Normal methodsFor: 'as yet unclassified' stamp: 'NR 5/19/2022 14:56:14'!
isTypeOfCustomer: aTypeOfCustomer

	^ aTypeOfCustomer = #Normal.

	! !

!Normal methodsFor: 'as yet unclassified' stamp: 'NR 5/19/2022 15:35:16'!
priceToPayForCombo1

	^ 97*peso.! !

!Normal methodsFor: 'as yet unclassified' stamp: 'NR 5/19/2022 15:43:12'!
priceToPayForCombo2

	^ (120*peso)*9/10.! !


!classDefinition: #Silver category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopCustomer subclass: #Silver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Silver methodsFor: 'as yet unclassified' stamp: 'NR 5/19/2022 14:56:29'!
isTypeOfCustomer: aTypeOfCustomer
	
	^ aTypeOfCustomer = #Silver.! !

!Silver methodsFor: 'as yet unclassified' stamp: 'NR 5/19/2022 15:35:16'!
priceToPayForCombo1

	^ 83*peso.! !

!Silver methodsFor: 'as yet unclassified' stamp: 'NR 5/19/2022 15:43:23'!
priceToPayForCombo2

	^ (120*peso)*3/4.! !


!classDefinition: #CoffeeShopReward category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #CoffeeShopReward
	instanceVariableNames: 'price quantity product'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!CoffeeShopReward methodsFor: 'accessing' stamp: 'LL 9/20/2020 17:54:42'!
price

	^price! !

!CoffeeShopReward methodsFor: 'accessing' stamp: 'LL 9/21/2020 16:31:13'!
quantity

	^quantity ! !


!CoffeeShopReward methodsFor: 'initialization' stamp: 'LL 9/22/2020 19:08:08'!
initializeOf: aProduct at: aPrice quantity: aQuantity

	product := aProduct.
	price := aPrice.
	quantity := aQuantity
	! !


!CoffeeShopReward methodsFor: 'testing' stamp: 'LL 9/22/2020 19:07:57'!
isForCombo1
	
	^product = #Combo1! !

!CoffeeShopReward methodsFor: 'testing' stamp: 'LL 9/22/2020 19:07:57'!
isForCombo2
	
	^product = #Combo2! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CoffeeShopReward class' category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopReward class
	instanceVariableNames: ''!

!CoffeeShopReward class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 17:53:14'!
of: aComboType at: aPrice quantity: aQuantity

	^self new initializeOf: aComboType at: aPrice quantity: aQuantity
! !


!classDefinition: #CoffeeShopSalesSystem category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #CoffeeShopSalesSystem
	instanceVariableNames: 'sales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!CoffeeShopSalesSystem methodsFor: 'product volume' stamp: 'LL 9/22/2020 19:51:19'!
volumeOf: aProduct

	aProduct = #Combo1 ifTrue: [ ^250*milliliter ].
	aProduct = #Combo2 ifTrue: [ ^100*milliliter ].

	self error: 'Invalid product'
	! !


!CoffeeShopSalesSystem methodsFor: 'initialization' stamp: 'LL 9/20/2020 17:17:34'!
initialize

	sales := Dictionary new! !


!CoffeeShopSalesSystem methodsFor: 'selling' stamp: 'NR 5/18/2022 20:22:24'!
registerSaleTo: aCustomer of: aProduct

	| salesToCustomer |

	salesToCustomer := sales at: aCustomer ifAbsentPut: [ OrderedCollection new ].
	salesToCustomer add: aProduct! !

!CoffeeShopSalesSystem methodsFor: 'selling' stamp: 'LL 9/20/2020 17:24:49'!
salesMadeTo: aCustomer

	^sales at: aCustomer ifAbsent: [ #() ]! !

!CoffeeShopSalesSystem methodsFor: 'selling' stamp: 'LL 9/22/2020 19:51:19'!
volumeSoldTo: aCustomer

	 ^(self salesMadeTo: aCustomer) sum: [ :aProduct | self volumeOf: aProduct ] ifEmpty: [ 0*milliliter ]! !


!CoffeeShopSalesSystem methodsFor: 'rewarding' stamp: 'NR 5/18/2022 20:14:18'!
rewardOf: aCustomer ifNone: noneBlock 

	| salesToCustomer volumeSoldToCustomer rewardRule |

	"salesToCustomer := self salesMadeTo: aCustomer." "esto esta aca al pedo me parece"
	volumeSoldToCustomer := self volumeSoldTo: aCustomer.
	
	rewardRule := RewardRule for: volumeSoldToCustomer ifNone: [^noneBlock value].
	^rewardRule createRewardFor: aCustomer.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CoffeeShopSalesSystem class' category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopSalesSystem class
	instanceVariableNames: ''!

!CoffeeShopSalesSystem class methodsFor: 'initialization' stamp: 'LL 9/23/2020 08:50:03'!
initialize

	Smalltalk at: #milliliter put: (BaseUnit named: 'milliliter')! !


!classDefinition: #RewardRule category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #RewardRule
	instanceVariableNames: 'product'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 19:03:50'!
createRewardFor: aCustomer 
	
	self subclassResponsibility ! !

!RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 10:51:26'!
productQuantity

	self subclassResponsibility ! !

!RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 10:51:33'!
rewardedProduct

	self subclassResponsibility ! !


!RewardRule methodsFor: 'product price' stamp: 'NR 5/19/2022 15:47:39'!
priceOf: aProduct "este mensaje ya no lo voy a necesitar porque manejo esta info desde las subclases de customer"

	aProduct = #Combo1 ifTrue: [ ^150*peso ].
	aProduct = #Combo2 ifTrue: [ ^120*peso ].

	self error: 'Invalid combo type'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RewardRule class' category: 'AlgoIII-2020-2C-1Parcial'!
RewardRule class
	instanceVariableNames: ''!

!RewardRule class methodsFor: 'testing' stamp: 'LL 9/22/2020 19:53:22'!
isFor: volumeSoldToCustomer 
		
	self subclassResponsibility ! !


!RewardRule class methodsFor: 'instance creation' stamp: 'LL 9/22/2020 19:53:42'!
for: volumeSoldToCustomer ifNone: aNoneBlock

	^self subclasses 
		detect: [ :aRuleClass | aRuleClass isFor: volumeSoldToCustomer ] 
		ifFound: [ :aRuleClass | aRuleClass new ]
		ifNone: aNoneBlock ! !


!classDefinition: #Combo1RewardRule category: 'AlgoIII-2020-2C-1Parcial'!
RewardRule subclass: #Combo1RewardRule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Combo1RewardRule methodsFor: 'reward creation' stamp: 'NR 5/19/2022 15:35:16'!
createRewardFor: aCustomer 
	
	| typeOfCustomer |
	
	product := self rewardedProduct.
	
	"aCustomer type = #Gold ifTrue: [ price := 75*peso ].
	aCustomer type = #Silver ifTrue: [ price := 83*peso ].
	aCustomer type = #Normal ifTrue: [ price := 97*peso ]."
	
	typeOfCustomer := CoffeeShopCustomer subclasses detect: [ :subclass | (subclass isTypeOfCustomer: aCustomer type)].
	
	^CoffeeShopReward of: product at: (typeOfCustomer priceToPayForCombo1) quantity: self productQuantity! !

!Combo1RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 19:54:35'!
productQuantity
	
	^2! !

!Combo1RewardRule methodsFor: 'reward creation' stamp: 'NR 5/19/2022 15:16:24'!
rewardedProduct

	^#Combo1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combo1RewardRule class' category: 'AlgoIII-2020-2C-1Parcial'!
Combo1RewardRule class
	instanceVariableNames: ''!

!Combo1RewardRule class methodsFor: 'testing' stamp: 'LL 9/22/2020 19:53:22'!
isFor: volumeSoldToCustomer 

	^volumeSoldToCustomer > (500*milliliter)! !


!classDefinition: #Combo2RewardRule category: 'AlgoIII-2020-2C-1Parcial'!
RewardRule subclass: #Combo2RewardRule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Combo2RewardRule methodsFor: 'reward creation' stamp: 'NR 5/19/2022 15:47:01'!
createRewardFor: aCustomer 
	
	| typeOfCustomer |
	
	product := self rewardedProduct.
	
	"aCustomer type = #Gold ifTrue: [ price := (self priceOf: product)/2 ].
	aCustomer type = #Silver ifTrue: [ price := (self priceOf: product)*3/4 ].
	aCustomer type = #Normal ifTrue: [ price := (self priceOf: product)*9/10 ]."
	
	typeOfCustomer := CoffeeShopCustomer subclasses detect: [ :subclass | (subclass isTypeOfCustomer: aCustomer type)].
	
	^CoffeeShopReward of: product at: typeOfCustomer priceToPayForCombo2 quantity: self productQuantity! !

!Combo2RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 10:23:07'!
productQuantity

	^1! !

!Combo2RewardRule methodsFor: 'reward creation' stamp: 'NR 5/19/2022 15:15:19'!
rewardedProduct
	
	^#Combo2! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combo2RewardRule class' category: 'AlgoIII-2020-2C-1Parcial'!
Combo2RewardRule class
	instanceVariableNames: ''!

!Combo2RewardRule class methodsFor: 'testing' stamp: 'LL 9/22/2020 19:53:22'!
isFor: volumeSoldToCustomer 

	^volumeSoldToCustomer between: 300*milliliter and: 500*milliliter
	! !

CoffeeShopSalesSystem initialize!