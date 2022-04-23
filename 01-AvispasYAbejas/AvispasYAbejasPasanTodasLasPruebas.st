!classDefinition: #AvispaLadrona category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaLadrona
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLadrona class' category: 'AvispasYAbejasParte2'!
AvispaLadrona class
	instanceVariableNames: ''!

!AvispaLadrona class methodsFor: 'as yet unclassified' stamp: 'CS 4/23/2022 15:44:01'!
firma
	^ 'RobadoraDeNidos'! !

!AvispaLadrona class methodsFor: 'as yet unclassified' stamp: 'CS 4/23/2022 17:09:06'!
intentarReproducirse
	| cantHuevosComenOrugas cantHuevosComenPolillas |
	cantHuevosComenOrugas := HabitatAvispas obtenerCantidadDeHuevosConFirmaGenetica: AvispaQueComenOrugas.
	cantHuevosComenOrugas > 0 ifTrue: [HabitatAvispas incrementarCantidadDeHuevosDeAvispas: AvispaLadrona. HabitatAvispas reducirCantDeHuevos: AvispaQueComenOrugas. ^nil].
	 
	cantHuevosComenPolillas := HabitatAvispas obtenerCantidadDeHuevosConFirmaGenetica: AvispaQueComenPolillas.
	cantHuevosComenPolillas > 0 ifTrue: [HabitatAvispas incrementarCantidadDeHuevosDeAvispas: AvispaLadrona. HabitatAvispas reducirCantDeHuevos: AvispaQueComenPolillas. ^nil].! !


!classDefinition: #AvispaQueComenOrugas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaQueComenOrugas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaQueComenOrugas class' category: 'AvispasYAbejasParte2'!
AvispaQueComenOrugas class
	instanceVariableNames: ''!

!AvispaQueComenOrugas class methodsFor: 'as yet unclassified' stamp: 'CS 4/23/2022 15:17:37'!
firma
	^ 'ComedoraDeOrugas'! !

!AvispaQueComenOrugas class methodsFor: 'as yet unclassified' stamp: 'CS 4/23/2022 15:25:14'!
intentarReproducirse
	HabitatAvispas cantidadDeOrugas > 0 ifTrue: [
		HabitatAvispas incrementarCantidadDeHuevosDeAvispas: self.
		HabitatAvispas reducirCantidadDeOrugas.
	] ifFalse: [ HabitatAvispas inicializarSinHuevosConFirmaGenetica: self].! !


!classDefinition: #AvispaQueComenPolillas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaQueComenPolillas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaQueComenPolillas class' category: 'AvispasYAbejasParte2'!
AvispaQueComenPolillas class
	instanceVariableNames: ''!

!AvispaQueComenPolillas class methodsFor: 'as yet unclassified' stamp: 'CS 4/23/2022 15:18:06'!
firma
	^ 'ComedoraDePolillas'! !

!AvispaQueComenPolillas class methodsFor: 'as yet unclassified' stamp: 'CS 4/23/2022 15:18:25'!
intentarReproducirse
	HabitatAvispas cantidadDePolillas > 0 ifTrue: [
		HabitatAvispas incrementarCantidadDeHuevosDeAvispas: self.
		HabitatAvispas reducirCantidadDePolillas.
	].! !


!classDefinition: #HabitatAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #HabitatAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatAvispas class' category: 'AvispasYAbejasParte2'!
HabitatAvispas class
	instanceVariableNames: 'cantidadDePolillas cantidadDeHuevosDeAvispas cantidadDeOrugas huevosConFirmaGenetica'!

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'CS 4/23/2022 15:54:33'!
actualizarCantDeHuevos: cantDeHuevosRobado deLaLadrona: unaAvispa
	huevosConFirmaGenetica at: unaAvispa firma put: cantDeHuevosRobado.
	! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/22/2022 00:15:00'!
actualizarCantidadDeOrugas
	^cantidadDeOrugas! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/22/2022 00:10:42'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevosDeAvispas
! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/22/2022 00:26:00'!
cantidadDeOrugas
	^cantidadDeOrugas! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/23/2022 10:12:22'!
cantidadDePolillas
	^cantidadDePolillas! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'CS 4/23/2022 15:37:02'!
incrementarCantidadDeHuevosDeAvispas: unaAvispa
	|cantHuevos|
	cantidadDeHuevosDeAvispas := cantidadDeHuevosDeAvispas  +1.
	cantHuevos  := huevosConFirmaGenetica at: unaAvispa firma ifAbsent:0.
	huevosConFirmaGenetica  at: unaAvispa firma put: cantHuevos +1.! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/23/2022 09:48:59'!
incrementarCantidadDeOrugas
	cantidadDeOrugas := cantidadDeOrugas + 1! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/23/2022 10:13:26'!
incrementarCantidadDePolillas
	cantidadDePolillas := cantidadDePolillas + 1! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/22/2022 00:13:28'!
inicializarCantidadDeHuevosDeAvispas
	cantidadDeHuevosDeAvispas := 0! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/22/2022 00:18:09'!
inicializarCantidadDeOrugas
	cantidadDeOrugas := 0
	! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/23/2022 10:15:04'!
inicializarCantidadDePolillas
	cantidadDePolillas := 0! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'CS 4/23/2022 15:16:55'!
inicializarHuevosConFirmaGenetica
	huevosConFirmaGenetica := Dictionary new.! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'CS 4/23/2022 15:26:00'!
inicializarSinHuevosConFirmaGenetica: unaAvispa
	huevosConFirmaGenetica at: unaAvispa firma put: 0.! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'CS 4/23/2022 15:39:08'!
obtenerCantidadDeHuevosConFirmaGenetica: unaAvispa
	
	^ huevosConFirmaGenetica at: unaAvispa firma ifAbsent: 0.! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'CS 4/23/2022 17:07:30'!
reducirCantDeHuevos: unaAvispa
	| cantHuevos |
	cantHuevos  := huevosConFirmaGenetica at: unaAvispa firma ifAbsent:0.
	huevosConFirmaGenetica  at: unaAvispa firma put: cantHuevos -1.! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/23/2022 09:51:26'!
reducirCantidadDeOrugas
	cantidadDeOrugas := cantidadDeOrugas - 1.! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/23/2022 10:17:02'!
reducirCantidadDePolillas
	cantidadDePolillas := cantidadDePolillas - 1.! !


!HabitatAvispas class methodsFor: '--** private fileout/in **--' stamp: 'CS 4/23/2022 17:11:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDePolillas := 1.
	cantidadDeHuevosDeAvispas := 1.
	cantidadDeOrugas := 1.
	huevosConFirmaGenetica := ((Dictionary new) add: ('ComedoraDeOrugas'->1); yourself).! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'CS 4/23/2022 15:32:19'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'CS 4/23/2022 15:57:35'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^ HabitatAvispas obtenerCantidadDeHuevosConFirmaGenetica: self laAvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'CS 4/23/2022 15:15:33'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^ HabitatAvispas obtenerCantidadDeHuevosConFirmaGenetica: self laAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'CS 4/23/2022 15:41:04'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^ HabitatAvispas obtenerCantidadDeHuevosConFirmaGenetica: self laAvispaOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'CS 4/23/2022 15:27:34'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^ HabitatAvispas obtenerCantidadDeHuevosConFirmaGenetica: self laAvispaPolly .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/21/2022 23:13:27'!
habitat
	^HabitatAvispas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'CS 4/23/2022 15:12:13'!
hacerQueElHabitatTengaLosRecursosSuficientes
	HabitatAvispas incrementarCantidadDeOrugas.
	HabitatAvispas incrementarCantidadDeOrugas.
	HabitatAvispas incrementarCantidadDePolillas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'CS 4/23/2022 15:43:00'!
laAvispaLara
	^AvispaLadrona.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'CS 4/23/2022 15:13:15'!
laAvispaOriana
	^AvispaQueComenOrugas ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'CS 4/23/2022 15:11:14'!
laAvispaOrnella
	^AvispaQueComenOrugas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'CS 4/23/2022 15:11:24'!
laAvispaPolly
	^AvispaQueComenPolillas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/23/2022 10:06:19'!
queElHabitatTengaDosOrugasMas
	HabitatAvispas incrementarCantidadDeOrugas.
	HabitatAvispas incrementarCantidadDeOrugas.	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/23/2022 10:18:01'!
queElHabitatTengaDosPolillasMas
	HabitatAvispas incrementarCantidadDePolillas.
	HabitatAvispas incrementarCantidadDePolillas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/22/2022 00:17:21'!
queElHabitatTengaUnaOrugaMas
	HabitatAvispas actualizarCantidadDeOrugas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/23/2022 10:13:33'!
queElHabitatTengaUnaPolillaMas
	HabitatAvispas incrementarCantidadDePolillas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'CS 4/23/2022 15:17:16'!
retrocederElHabitatAlInicioDeLosTiempos
	HabitatAvispas inicializarCantidadDeHuevosDeAvispas.
	HabitatAvispas inicializarCantidadDeOrugas.
	HabitatAvispas inicializarCantidadDePolillas.
	HabitatAvispas inicializarHuevosConFirmaGenetica.! !


HabitatAvispas initializeAfterFileIn!