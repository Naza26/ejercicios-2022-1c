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

!AvispaLadrona class methodsFor: 'firmaDeLaAvispa' stamp: 'NR 4/24/2022 21:08:24'!
firma
	^'RobadoraDeNidos'! !


!AvispaLadrona class methodsFor: 'reproduccionDeLaAvispa' stamp: 'NR 4/24/2022 21:17:24'!
intentarReproducirse
	| cantHuevosComenOrugas cantHuevosComenPolillas |
	cantHuevosComenOrugas := HabitatAvispas obtenerCantidadDeHuevosConFirmaGenetica: AvispaQueComeOrugas.
	cantHuevosComenOrugas > 0 ifTrue: [HabitatAvispas incrementarCantidadDeHuevosDeAvispa: AvispaLadrona. HabitatAvispas reducirCantidadDeHuevosDeAvispa: AvispaQueComeOrugas. ^nil].
	 
	cantHuevosComenPolillas := HabitatAvispas obtenerCantidadDeHuevosConFirmaGenetica: AvispaQueComePolillas.
	cantHuevosComenPolillas > 0 ifTrue: [HabitatAvispas incrementarCantidadDeHuevosDeAvispa: AvispaLadrona. HabitatAvispas reducirCantidadDeHuevosDeAvispa: AvispaQueComePolillas. ^nil].! !


!classDefinition: #AvispaQueComeOrugas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaQueComeOrugas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaQueComeOrugas class' category: 'AvispasYAbejasParte2'!
AvispaQueComeOrugas class
	instanceVariableNames: ''!

!AvispaQueComeOrugas class methodsFor: 'reproduccionDeLaAvispa' stamp: 'NR 4/24/2022 21:17:07'!
intentarReproducirse
	HabitatAvispas cantidadDeOrugas > 0 ifTrue: [
		HabitatAvispas incrementarCantidadDeHuevosDeAvispa: self.
		HabitatAvispas reducirCantidadDeOrugas.
	] ifFalse: [ HabitatAvispas inicializarSinHuevosConFirmaGenetica: self].! !


!AvispaQueComeOrugas class methodsFor: 'firmaDeLaAvispa' stamp: 'NR 4/24/2022 21:08:34'!
firma
	^'ComedoraDeOrugas'! !


!classDefinition: #AvispaQueComePolillas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaQueComePolillas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaQueComePolillas class' category: 'AvispasYAbejasParte2'!
AvispaQueComePolillas class
	instanceVariableNames: ''!

!AvispaQueComePolillas class methodsFor: 'firmaDeLaAvispa' stamp: 'NR 4/24/2022 21:08:38'!
firma
	^'ComedoraDePolillas'! !


!AvispaQueComePolillas class methodsFor: 'reproduccionDeLaAvispa' stamp: 'NR 4/24/2022 21:17:07'!
intentarReproducirse
	HabitatAvispas cantidadDePolillas > 0 ifTrue: [
		HabitatAvispas incrementarCantidadDeHuevosDeAvispa: self.
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

!HabitatAvispas class methodsFor: 'cantidadDeAlimentoEnHabitat' stamp: 'NR 4/22/2022 00:26:00'!
cantidadDeOrugas
	^cantidadDeOrugas! !

!HabitatAvispas class methodsFor: 'cantidadDeAlimentoEnHabitat' stamp: 'NR 4/23/2022 10:12:22'!
cantidadDePolillas
	^cantidadDePolillas! !


!HabitatAvispas class methodsFor: 'cantidadDeHuevosEnHabitat' stamp: 'NR 4/22/2022 00:10:42'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevosDeAvispas
! !


!HabitatAvispas class methodsFor: 'incrementoDeAlimentoDelHabitat' stamp: 'NR 4/23/2022 09:48:59'!
incrementarCantidadDeOrugas
	cantidadDeOrugas := cantidadDeOrugas + 1! !

!HabitatAvispas class methodsFor: 'incrementoDeAlimentoDelHabitat' stamp: 'NR 4/23/2022 10:13:26'!
incrementarCantidadDePolillas
	cantidadDePolillas := cantidadDePolillas + 1! !


!HabitatAvispas class methodsFor: 'actualizacionesDeHuevosEnHabitat' stamp: 'NR 4/24/2022 21:26:19'!
actualizarCantidadDeHuevos: cantDeHuevosRobados deLaLadrona: unaAvispa
	huevosConFirmaGenetica at: unaAvispa firma put: cantDeHuevosRobados.
	! !

!HabitatAvispas class methodsFor: 'actualizacionesDeHuevosEnHabitat' stamp: 'NR 4/24/2022 21:17:07'!
incrementarCantidadDeHuevosDeAvispa: unaAvispa
	|cantHuevos|
	cantidadDeHuevosDeAvispas := cantidadDeHuevosDeAvispas  +1.
	cantHuevos  := huevosConFirmaGenetica at: unaAvispa firma ifAbsent:0.
	huevosConFirmaGenetica  at: unaAvispa firma put: cantHuevos +1.! !

!HabitatAvispas class methodsFor: 'actualizacionesDeHuevosEnHabitat' stamp: 'NR 4/24/2022 21:17:24'!
reducirCantidadDeHuevosDeAvispa: unaAvispa
	| cantHuevos |
	cantHuevos  := huevosConFirmaGenetica at: unaAvispa firma ifAbsent:0.
	huevosConFirmaGenetica  at: unaAvispa firma put: cantHuevos -1.! !


!HabitatAvispas class methodsFor: 'creacionInicialDelHabitat' stamp: 'CS 4/24/2022 16:36:06'!
inicializarHabitat
	cantidadDeHuevosDeAvispas := 0.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	huevosConFirmaGenetica := Dictionary new.! !

!HabitatAvispas class methodsFor: 'creacionInicialDelHabitat' stamp: 'CS 4/23/2022 15:26:00'!
inicializarSinHuevosConFirmaGenetica: unaAvispa
	huevosConFirmaGenetica at: unaAvispa firma put: 0.! !


!HabitatAvispas class methodsFor: 'cantidadDeHuevosConFirmaGeneticaEnHabitat' stamp: 'NR 4/24/2022 21:24:16'!
obtenerCantidadDeHuevosConFirmaGenetica: unaAvispa
	^huevosConFirmaGenetica at: unaAvispa firma ifAbsent: 0.! !


!HabitatAvispas class methodsFor: 'reduccionDeAlimentoDelHabitat' stamp: 'NR 4/23/2022 09:51:26'!
reducirCantidadDeOrugas
	cantidadDeOrugas := cantidadDeOrugas - 1.! !

!HabitatAvispas class methodsFor: 'reduccionDeAlimentoDelHabitat' stamp: 'NR 4/23/2022 10:17:02'!
reducirCantidadDePolillas
	cantidadDePolillas := cantidadDePolillas - 1.! !


!HabitatAvispas class methodsFor: '--** private fileout/in **--' stamp: 'NR 4/24/2022 21:32:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDePolillas := 0.
	cantidadDeHuevosDeAvispas := 0.
	cantidadDeOrugas := 0.
	huevosConFirmaGenetica := ((Dictionary new)).! !


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

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/24/2022 21:12:04'!
laAvispaOriana
	^AvispaQueComeOrugas ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/24/2022 21:12:04'!
laAvispaOrnella
	^AvispaQueComeOrugas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/24/2022 21:12:18'!
laAvispaPolly
	^AvispaQueComePolillas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/23/2022 10:06:19'!
queElHabitatTengaDosOrugasMas
	HabitatAvispas incrementarCantidadDeOrugas.
	HabitatAvispas incrementarCantidadDeOrugas.	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/23/2022 10:18:01'!
queElHabitatTengaDosPolillasMas
	HabitatAvispas incrementarCantidadDePolillas.
	HabitatAvispas incrementarCantidadDePolillas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'CS 4/24/2022 16:38:53'!
queElHabitatTengaUnaOrugaMas
	HabitatAvispas cantidadDeOrugas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/23/2022 10:13:33'!
queElHabitatTengaUnaPolillaMas
	HabitatAvispas incrementarCantidadDePolillas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'CS 4/24/2022 16:36:30'!
retrocederElHabitatAlInicioDeLosTiempos
	HabitatAvispas inicializarHabitat.! !

HabitatAvispas initializeAfterFileIn!