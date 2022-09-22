!classDefinition: #TestsAlgoIII category: 'AlgoIII'!
TestCase subclass: #TestsAlgoIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII'!

!TestsAlgoIII methodsFor: 'tests' stamp: 'NR 9/19/2022 17:18:40'!
test01

	| materias cursoAlgoIII |
	materias := OrderedCollection new.
	materias add: #AlgoI.
	materias add: #AlgoII.
	materias add: #AlgebraII.
	
	cursoAlgoIII := AlgoIII new.
	
	
	self assert: (cursoAlgoIII estanLasCondicionesParaCursarAlgoIII: materias).
	
	"Mostrar como el test es valido y pasa"! !

!TestsAlgoIII methodsFor: 'tests' stamp: 'NR 9/19/2022 17:25:30'!
test02

	| cursoAlgoIII |
	
	cursoAlgoIII := AlgoIII new.
	
	
	self assert: 'Hello World!!' equals: cursoAlgoIII darBienvenida.
	
	"Cambiar para que iguale a Hello World y mostrar como el test falla en la asercion"! !

!TestsAlgoIII methodsFor: 'tests' stamp: 'NR 9/19/2022 17:28:36'!
test03

	| cursoAlgoIII notasDeParcial |
	
	cursoAlgoIII := AlgoIII new.
	
	notasDeParcial := OrderedCollection new.
	notasDeParcial add: 4.
	notasDeParcial add: 7.
	
	
	self assert: (cursoAlgoIII requisitosAprobacionCursadaCumplidos: notasDeParcial).
	
	"Remover el mensaje requisitosAprobacionCursadaCumplidos y mostrar como el programa lanza un error messageNotUnderstood"! !


!classDefinition: #AlgoIII category: 'AlgoIII'!
Object subclass: #AlgoIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII'!

!AlgoIII methodsFor: 'as yet unclassified' stamp: 'NR 9/18/2022 16:47:13'!
darBienvenida

	^ 'Bienvenidos a la materia Algoritmos y Programacion III'! !

!AlgoIII methodsFor: 'as yet unclassified' stamp: 'NR 9/18/2022 16:59:58'!
estanLasCondicionesParaCursarAlgoIII: unSetDeMaterias

	^ unSetDeMaterias includes: #AlgoII.! !

!AlgoIII methodsFor: 'as yet unclassified' stamp: 'NR 9/19/2022 17:45:29'!
requisitosAprobacionCursadaCumplidos: unSetDeNotas

	"unSetDeNotas do: [:unaNota |
		(unaNota < 4) ifTrue: [^ false].
	].
"
	| hayUnaNotaMenorACuatro |
	hayUnaNotaMenorACuatro := unSetDeNotas select: [:unaNota | (unaNota < 4)].
	
	^ hayUnaNotaMenorACuatro! !
