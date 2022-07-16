!classDefinition: #CicloReproductivoDeAvispasTest category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
TestCase subclass: #CicloReproductivoDeAvispasTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:43:18'!
test01EnElInicioDeLosTiemposHayUnaCantidadDeAvispasVivas

	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	self assert: 2 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:43:26'!
test02EnElInicioDeLosTiemposNoHayHuevosDeAvispas

	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:43:39'!
test03LasAvispasMuerenAlCambiarDeAño
	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	
	unHabitat avanzarUnAño.
	
	self assert: 0 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:44:52'!
test04AlReproducirseUnaAvispaAlSiguienteAñoGestanUnaAvispaDescendiente
	| unHabitat avispaQueDejaUnHuevo |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	unHabitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnHuevo := unHabitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	unHabitat avanzarUnAño.
	
	self assert: 1 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:47:23'!
test05ReproducirseUnaAvispaAlSiguienteAñoGestanUnaAvispaDescendientePeroNoPuedeGestarNingunaAlOtroAño
	| habitat avispaQueDejaUnaCria |
	habitat := Habitat conAvispasComeOrugas: 2.	
	habitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnaCria := habitat avispas first.
	avispaQueDejaUnaCria intentarReproducirse.
	
	habitat avanzarUnAño.
	habitat avanzarUnAño.
	
	self assert: 0 equals: habitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:35:59'!
test06AlReproducirseUnaAvispaComeOrugasAlSiguienteAñoGestanUnaDescendienteDeSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo |
	habitat := Habitat conAvispasComeOrugas: 2.	
	habitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnHuevo := habitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	habitat avanzarUnAño.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa firmaGenetica = avispaQueDejaUnHuevo firmaGenetica ]).
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:37:40'!
test07AlReproducirseUnaAvispaComePolillasAlSiguienteAñoGestanUnaDescendienteDeSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo |
	habitat := Habitat conAvispasComePolillas: 2.	
	habitat gestarCantidadDePolillas: 1.
	avispaQueDejaUnHuevo := habitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	habitat avanzarUnAño.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa firmaGenetica = avispaQueDejaUnHuevo firmaGenetica ]).
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'NR 7/16/2022 17:28:44'!
test08AlReproducirseUnaAvispaLadronaAlSiguienteAñoGestanUnaDescendienteDeSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo avispaQueRoba |
	habitat := Habitat conAvispasComeOrugas: 1 ladronas: 	1.
	habitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnHuevo := (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esAvispaComeOrugas]) first.
	avispaQueRoba := (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esAvispaLadrona]) first.
	avispaQueDejaUnHuevo intentarReproducirse.
	avispaQueRoba intentarReproducirse.
	
	habitat avanzarUnAño.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa firmaGenetica = avispaQueRoba firmaGenetica ]).
	! !


!classDefinition: #ReproduccionAvispasTests category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
TestCase subclass: #ReproduccionAvispasTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'NR 5/21/2022 18:12:26'!
test01CuandoUnAvispaComeOrugasSeReproducePorPrimeraVezDejaUnHuevo
	| unHabitat |
	
	unHabitat := Habitat conAvispasComeOrugas: 1.
	
	self intentarReproduccion: 1 en: unHabitat conUnaCantidadDeOrugas: 1.
	
	self assert: 1 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'NR 5/21/2022 18:13:05'!
test02CadaVezQueUnaAvispaComeOrugasSeReproduceDejaUnHuevoMas
	| unHabitat |
	
	unHabitat := Habitat conAvispasComeOrugas: 1.
	
	self intentarReproduccion: 2 en: unHabitat conUnaCantidadDeOrugas: 2.
	
	self assert: 2 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'NR 5/21/2022 18:14:43'!
test03ParaDejarUnHuevoUnaAvispaComeOrugasReduceLaPoblacionDeUnaOrugaANinguna
	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	
	self intentarReproduccion: 1 en: unHabitat conUnaCantidadDeOrugas: 1.
	
	self assert: 0 equals: unHabitat cantidadDeOrugas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'NR 5/21/2022 18:15:03'!
test04ParaDejarUnHuevoUnaAvispaComeOrugasDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	
	self intentarReproduccion: 1 en: unHabitat conUnaCantidadDeOrugas: 2.
	
	self assert: 1 equals: unHabitat cantidadDeOrugas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'NR 5/21/2022 18:20:25'!
test05CuandoNoHayOrugasUnaAvispaComeOrugasNoPuedeDejarHuevos
	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	
	self intentarReproduccion: 1 en: unHabitat conUnaCantidadDeOrugas: 0.
	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !


!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'NR 5/21/2022 18:21:23'!
test06CuandoUnaAvispaComePolillasSeReproduceDejaUnHuevo
	| unHabitat |
	unHabitat := Habitat conAvispasComePolillas: 1.
	
	self intentarReproduccion: 1 en: unHabitat conUnaCantidadDePolillas: 1.
	
	self assert: 1 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'NR 5/21/2022 18:22:06'!
test07ParaDejarUnHuevoUnaAvispaComePolillasReduceLaPoblacionDeUnaPolillaANinguna
	| unHabitat |
	unHabitat := Habitat conAvispasComePolillas: 1.
	
	self intentarReproduccion: 1 en: unHabitat conUnaCantidadDePolillas: 1.
	
	self assert: 0 equals: unHabitat cantidadDePolillas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'NR 5/21/2022 18:22:23'!
test08ParaDejarUnHuevoUnaAvispaComePolillasDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	| unHabitat |
	unHabitat := Habitat conAvispasComePolillas: 1.
	
	self intentarReproduccion: 1 en: unHabitat conUnaCantidadDePolillas: 2.
	
	self assert: 1 equals: unHabitat cantidadDePolillas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'NR 5/21/2022 18:22:37'!
test09CuandoNoHayPolillasUnaAvispaComePolillasNoPuedeDejarHuevos
	| unHabitat |
	unHabitat := Habitat conAvispasComePolillas: 1.
	
	self intentarReproduccion: 1 en: unHabitat conUnaCantidadDePolillas: 0.
	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !


!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 01:12:57'!
test10CuandoUnaAvispaComeOrugasSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaAReproducirse firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 01:12:57'!
test11CuandoUnaAvispaComeOrugasAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaAReproducirse firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 21:36:24'!
test12CuandoUnaAvispaComePolillasSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaComePolillas unaAvispaComeOrugas |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1.
	unHabitat gestarCantidadDePolillas: 1.
	unaAvispaComePolillas := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaComePolillas intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComePolillas firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComeOrugas firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 01:12:57'!
test13DosAvispasDelMismoTipoDejanHuevosDeLaMismaLineaGenetica
	| unHabitat unaAvispaComeOrugas otraAvispaComeOrugas |
	unHabitat := Habitat conAvispasComeOrugas: 2.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) last.
	
	unaAvispaComeOrugas intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComeOrugas firmaGenetica).
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaComeOrugas firmaGenetica).! !


!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test14CuandoUnaAvispaLadronaSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test15CuandoUnaAvispaLadronaSeReproduceLeSacaUnHuevoAOtraAvispa
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test16CuandoUnaAvispaLadronaSeReproduceSoloRobaUnHuevo
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test17CuandoUnaAvispaLadronaNoTieneRecursosNoDejaUnHuevo
	| unHabitat unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).! !


!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 5/20/2022 01:14:14'!
test18CuandoUnaAvispaLadronaSeReproduceRobaHuevosDeVariasAvispas
	| unHabitat unaAvispaASerRobada unaAvispaLadrona otraAvispaASerRobada |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unHabitat gestarCantidadDePolillas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaASerRobada := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	otraAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaASerRobada firmaGenetica).
	self assert: 2 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 5/20/2022 01:14:14'!
test19CuandoUnaAvispaLadronaSeReproduceNoVuelveARobarDeLaUltimaLineaGeneticaQueYaHaRobado
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 0 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse. 
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 5/20/2022 01:14:14'!
test20CuandoUnaAvispaLadronaSeReproduceNoRobaHuevosDeNingunaFirmaGeneticaALaQueLeHayaRobadoPreviamente
	| unHabitat unaAvispaASerRobada unaAvispaLadrona otraAvispaASerRobada |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unHabitat gestarCantidadDePolillas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaASerRobada := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	otraAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaASerRobada firmaGenetica).
	self assert: 2 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	! !


!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'NR 7/16/2022 17:29:16'!
elegirAvispasComeOrugasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esAvispaComeOrugas].! !

!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'NR 7/16/2022 17:29:25'!
elegirAvispasComePolillasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esAvispaComePolillas].! !

!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'NR 7/16/2022 17:29:34'!
elegirAvispasLadronasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esAvispaLadrona].! !


!ReproduccionAvispasTests methodsFor: 'private' stamp: 'NR 5/21/2022 18:11:50'!
intentarReproduccion: unaCantidadDeVeces en: unHabitat conUnaCantidadDeOrugas: cantidadDeOrugas


	| unaAvispaAReproducirse |
	unHabitat gestarCantidadDeOrugas: cantidadDeOrugas.
	
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaCantidadDeVeces timesRepeat: [unaAvispaAReproducirse intentarReproducirse].
	! !

!ReproduccionAvispasTests methodsFor: 'private' stamp: 'NR 5/21/2022 18:17:51'!
intentarReproduccion: unaCantidadDeVeces en: unHabitat conUnaCantidadDePolillas: cantidadDePolillas


	| unaAvispaAReproducirse |
	unHabitat gestarCantidadDePolillas: cantidadDePolillas.
	
	unaAvispaAReproducirse := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaCantidadDeVeces timesRepeat: [unaAvispaAReproducirse intentarReproducirse].
	! !


!classDefinition: #Avispa category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Object subclass: #Avispa
	instanceVariableNames: 'habitat firmasGeneticas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!Avispa methodsFor: 'initialization' stamp: 'NR 5/21/2022 17:05:37'!
initializeEn: unHabitat  

	habitat := unHabitat.
	firmasGeneticas := OrderedCollection with: self firmaGenetica.! !


!Avispa methodsFor: 'firma' stamp: 'NR 5/21/2022 16:46:25'!
firmaGenetica
	
	self subclassResponsibility.
	! !


!Avispa methodsFor: 'reproduccion' stamp: 'NR 5/21/2022 16:46:33'!
intentarReproducirse

	self subclassResponsibility.! !


!Avispa methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:28:44'!
esAvispaComeOrugas

	self subclassResponsibility.! !

!Avispa methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:28:49'!
esAvispaComePolillas

	self subclassResponsibility.! !

!Avispa methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:26:05'!
esAvispaLadrona

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Avispa class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa class
	instanceVariableNames: ''!

!Avispa class methodsFor: 'instance creation' stamp: 'NR 5/21/2022 17:05:48'!
enHabitat: unHabitat  
	^self new initializeEn: unHabitat.! !


!classDefinition: #AvispaComeOrugas category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa subclass: #AvispaComeOrugas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!AvispaComeOrugas methodsFor: 'firma' stamp: 'NR 5/21/2022 14:43:58'!
firmaGenetica

	^ #'come-orugas'.! !


!AvispaComeOrugas methodsFor: 'reproduccion' stamp: 'NR 7/16/2022 17:02:43'!
intentarReproducirse

	habitat tieneOrugas ifTrue: [
		habitat tomarUnaOruga.
		habitat dejarUnHuevoDeAvispa: self.
	].
	! !


!AvispaComeOrugas methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:24:37'!
esAvispaComeOrugas
	^ true.! !

!AvispaComeOrugas methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:24:44'!
esAvispaComePolillas
	^ false.! !

!AvispaComeOrugas methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:24:50'!
esAvispaLadrona
	^ false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaComeOrugas class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
AvispaComeOrugas class
	instanceVariableNames: ''!

!AvispaComeOrugas class methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:14:25'!
esTipoDeAvispa: unaFirmaGenetica

	^ unaFirmaGenetica = #'come-orugas'.! !


!classDefinition: #AvispaComePolillas category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa subclass: #AvispaComePolillas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!AvispaComePolillas methodsFor: 'firma' stamp: 'NR 5/21/2022 14:44:27'!
firmaGenetica

	^ #'come-polillas'.
	! !


!AvispaComePolillas methodsFor: 'reproduccion' stamp: 'NR 5/21/2022 17:55:15'!
intentarReproducirse

	habitat tienePolillas ifTrue: [
		habitat tomarUnaPolilla.
		habitat dejarUnHuevoDeAvispa: self.	
	].! !


!AvispaComePolillas methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:25:06'!
esAvispaComeOrugas
	^ false.! !

!AvispaComePolillas methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:25:12'!
esAvispaComePolillas
	^ true.! !

!AvispaComePolillas methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:25:17'!
esAvispaLadrona
	^ false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaComePolillas class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
AvispaComePolillas class
	instanceVariableNames: ''!

!AvispaComePolillas class methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:14:30'!
esTipoDeAvispa: unaFirmaGenetica

	^ unaFirmaGenetica = #'come-polillas'.! !


!classDefinition: #AvispaLadrona category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa subclass: #AvispaLadrona
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!AvispaLadrona methodsFor: 'firma' stamp: 'NR 5/21/2022 14:44:41'!
firmaGenetica

	^ #ladrona.
	! !


!AvispaLadrona methodsFor: 'reproduccion' stamp: 'NR 5/21/2022 17:54:37'!
intentarReproducirse

	| firmaRobada |
	
	(habitat tieneHuevosDeAvispasQueNoSeanDe: firmasGeneticas) ifTrue: [
		firmaRobada := habitat robarUnHuevoQueNoSeaDe: firmasGeneticas .
		habitat dejarUnHuevoDeAvispa: self.
		firmasGeneticas add: firmaRobada.
	].! !


!AvispaLadrona methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:25:32'!
esAvispaComeOrugas

	^ false.! !

!AvispaLadrona methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:25:40'!
esAvispaComePolillas

	^ false.! !

!AvispaLadrona methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:25:46'!
esAvispaLadrona

	^ true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLadrona class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
AvispaLadrona class
	instanceVariableNames: ''!

!AvispaLadrona class methodsFor: 'as yet unclassified' stamp: 'NR 7/16/2022 17:14:35'!
esTipoDeAvispa: unaFirmaGenetica

	^ unaFirmaGenetica = #ladrona.! !


!classDefinition: #Habitat category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Object subclass: #Habitat
	instanceVariableNames: 'avispas cantidadDeOrugas cantidadDePolillas cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!Habitat methodsFor: 'initialization' stamp: 'JMB 5/20/2022 01:07:16'!
initializeConAvispas: unasAvispasIniciales
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	avispas := unasAvispasIniciales! !


!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 01:09:25'!
avispas
	^ avispas! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/17/2022 21:13:53'!
cantidadDeAvispasVivas
	^ avispas size! !

!Habitat methodsFor: 'avispas' stamp: 'NR 5/21/2022 15:52:32'!
cantidadDeAvispasVivasCumplanCon: firmaGenetica 
	^ (self elegirAvispasQueCumplanCon: firmaGenetica) size! !

!Habitat methodsFor: 'avispas' stamp: 'NR 7/16/2022 17:22:59'!
elegirAvispasQueCumplanCon: unTipoDeAvispa 
	^ avispas select: unTipoDeAvispa.! !


!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 12:05:53'!
cantidadDeHuevosConLaFirmaGenetica: unaFirmaGenetica
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica ifAbsent: [ 0 ]! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 12:14:19'!
cantidadDeHuevosDeAvispas
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica values sum: [ : unaCantidadDeHuevos | unaCantidadDeHuevos ] ifEmpty: [ 0 ]! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'NR 5/21/2022 15:59:10'!
dejarUnHuevoDeAvispa: unaAvispa
	| cantidadDeHuevos |
	cantidadDeHuevos := self cantidadDeHuevosConLaFirmaGenetica: unaAvispa firmaGenetica.
	self contabilizar: cantidadDeHuevos + 1 a: unaAvispa firmaGenetica.! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 22:33:05'!
robarUnHuevoQueNoSeaDe: firmasGeneticasExcluidas
	| cantidadDeHuevos unaFirmaGeneticaARobar |
	unaFirmaGeneticaARobar := self firmaGeneticaARobarQueNoSea: firmasGeneticasExcluidas.
	cantidadDeHuevos := self cantidadDeHuevosConLaFirmaGenetica: unaFirmaGeneticaARobar.
	self contabilizar: cantidadDeHuevos - 1 a: unaFirmaGeneticaARobar.
	^ unaFirmaGeneticaARobar! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'NR 5/21/2022 17:28:17'!
tieneHuevosDeAvispasQueNoSeanDe: unasFirmasGeneticas "este mensaje lo tengo que sacar, no? no se esta usando en ningun lado"

	| cantidad firmaGenetica indice |
	cantidad := 0.
	indice := 1.
	[ indice <= unasFirmasGeneticas size] whileTrue: [
		firmaGenetica := unasFirmasGeneticas at: indice.
		cantidad := cantidad + (self cantidadDeHuevosConLaFirmaGenetica: firmaGenetica).
		indice := indice + 1.		
	].
	
	^ self cantidadDeHuevosDeAvispas > cantidad! !


!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 16:41:14'!
cantidadDeOrugas
	^ cantidadDeOrugas! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:07:25'!
cantidadDePolillas
	^ cantidadDePolillas! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 09:57:44'!
gestarCantidadDeOrugas: unaCantidadDeOrugasAGestar 
	cantidadDeOrugas := cantidadDeOrugas + unaCantidadDeOrugasAGestar ! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:07:45'!
gestarCantidadDePolillas: unaCantidadDePolillasAGestar 
	cantidadDePolillas := cantidadDePolillas + unaCantidadDePolillasAGestar! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 10:06:37'!
tieneOrugas
	^ cantidadDeOrugas > 0! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:18:20'!
tienePolillas
	^ cantidadDePolillas > 0! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 09:59:06'!
tomarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:09:15'!
tomarUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1! !


!Habitat methodsFor: 'ciclo' stamp: 'NR 5/21/2022 17:46:54'!
avanzarUnAño
	| avispasNuevas cantidad |
	avispasNuevas := OrderedCollection new.
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica keys do: [ : unaFirmaGenetica |
		cantidad := 		cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica.
		cantidad timesRepeat: [
			avispasNuevas add: (self nuevaAvispaConFirma: unaFirmaGenetica).
		].
	].
	avispas := avispasNuevas.
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new.! !


!Habitat methodsFor: 'privados' stamp: 'JMB 5/18/2022 16:38:08'!
contabilizar: unaCantidadDeHuevos a: unaFirmaGenetica
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica put: unaCantidadDeHuevos! !

!Habitat methodsFor: 'privados' stamp: 'JMB 5/18/2022 22:28:47'!
firmaGeneticaARobarQueNoSea: firmasGeneticasExcluidas
	
	| firmasConHuevosQueNoSonFirmaGeneticaExcluida |
	firmasConHuevosQueNoSonFirmaGeneticaExcluida := cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica keys select: [:firma | 
		(firmasGeneticasExcluidas includes: firma) not and: [(self cantidadDeHuevosConLaFirmaGenetica: firma) > 0]].
	^ firmasConHuevosQueNoSonFirmaGeneticaExcluida first! !

!Habitat methodsFor: 'privados' stamp: 'NR 7/16/2022 17:14:57'!
nuevaAvispaConFirma: unaFirmaGenetica
	
	| tipoDeAvispa |
	
	tipoDeAvispa := Avispa subclasses detect: [ :subclass | (subclass esTipoDeAvispa: unaFirmaGenetica) ].
	^ tipoDeAvispa enHabitat: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Habitat class
	instanceVariableNames: ''!

!Habitat class methodsFor: 'instance creation' stamp: 'NR 5/21/2022 17:05:48'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas
	| unasAvispas habitat |
	
	habitat := self new.
	unasAvispas := ((1 to: unaCantidadDeAvispasComeOrugas) collect: [ : each | AvispaComeOrugas enHabitat: habitat ]) asOrderedCollection.
	
	^habitat initializeConAvispas: unasAvispas  ! !

!Habitat class methodsFor: 'instance creation' stamp: 'NR 5/21/2022 17:05:48'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas 
	| unasAvispas habitat |
	
	habitat := self new.
	
	unasAvispas := ((1 to: unaCantidadDeAvispasComeOrugas) collect: [ : each | AvispaComeOrugas enHabitat: habitat ]) asOrderedCollection.
	
	unasAvispas addAll: ((1 to: unaCantidadDeAvispasComeOrugas) collect: [ : each | AvispaComePolillas enHabitat: habitat ]) asOrderedCollection.
	
	^habitat initializeConAvispas: unasAvispas ! !

!Habitat class methodsFor: 'instance creation' stamp: 'NR 5/21/2022 17:05:48'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas ladronas: unaCantidadDeAvispasLadronas 
	| unasAvispas habitat |
	
	habitat := self new.
	
	unasAvispas := ((1 to: unaCantidadDeAvispasComeOrugas) collect: [ : each | AvispaComeOrugas enHabitat: habitat ]) asOrderedCollection.
	
	unasAvispas addAll: ((1 to: unaCantidadDeAvispasComeOrugas) collect: [ : each | AvispaComePolillas enHabitat: habitat ]) asOrderedCollection.
	
		unasAvispas addAll: ((1 to: unaCantidadDeAvispasComeOrugas) collect: [ : each | AvispaLadrona enHabitat: habitat ]) asOrderedCollection.
	
	^habitat initializeConAvispas: unasAvispas ! !

!Habitat class methodsFor: 'instance creation' stamp: 'NR 5/21/2022 17:05:48'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas ladronas: unaCantidadDeAvispasLadronas 
	| unasAvispas habitat |
	
	habitat := self new.
		
	unasAvispas := ((1 to: unaCantidadDeAvispasComeOrugas) collect: [ : each | AvispaComeOrugas enHabitat: habitat ]) asOrderedCollection.
	
	unasAvispas addAll: ((1 to: unaCantidadDeAvispasComeOrugas) collect: [ : each | AvispaLadrona enHabitat: habitat ]) asOrderedCollection.
	
	^habitat initializeConAvispas: unasAvispas! !

!Habitat class methodsFor: 'instance creation' stamp: 'NR 5/21/2022 17:05:48'!
conAvispasComePolillas: unaCantidadDeAvispasComePolillas
	| unasAvispas habitat |
	
	habitat := self new.
	
	unasAvispas :=  ((1 to: unaCantidadDeAvispasComePolillas) collect: [ : each | AvispaComePolillas enHabitat: habitat ]) asOrderedCollection.
	
	^habitat initializeConAvispas: unasAvispas.! !
