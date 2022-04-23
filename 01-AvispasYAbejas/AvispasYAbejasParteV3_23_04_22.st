!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: ''!

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'NR 4/23/2022 09:54:11'!
intentarReproducirse
	HabitatAvispas cantidadDeOrugas > 0 ifTrue: [
		HabitatAvispas incrementarCantidadDeHuevosDeAvispas.
		HabitatAvispas reducirCantidadDeOrugas.
	].
	"HabitatAvispas actualizarCantidadDeHuevosDeAvispas.
	HabitatAvispas actualizarCantidadDeOrugas."! !


!classDefinition: #HabitatAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #HabitatAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatAvispas class' category: 'AvispasYAbejasParte2'!
HabitatAvispas class
	instanceVariableNames: 'cantidadDeOrugas cantidadDeHuevosDeAvispas cantidadDePolillas'!

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

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/23/2022 09:47:55'!
incrementarCantidadDeHuevosDeAvispas
	cantidadDeHuevosDeAvispas := cantidadDeHuevosDeAvispas + 1! !

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

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/23/2022 09:51:26'!
reducirCantidadDeOrugas
	cantidadDeOrugas := cantidadDeOrugas - 1.! !

!HabitatAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/23/2022 10:17:02'!
reducirCantidadDePolillas
	cantidadDePolillas := cantidadDePolillas - 1.! !


!HabitatAvispas class methodsFor: '--** private fileout/in **--' stamp: 'NR 4/23/2022 11:07:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeOrugas := 0.
	cantidadDeHuevosDeAvispas := 0.
	cantidadDePolillas := 0.! !


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

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
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


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:52'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:57'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:03'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:09'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/21/2022 23:13:27'!
habitat
	^HabitatAvispas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/23/2022 10:01:13'!
hacerQueElHabitatTengaLosRecursosSuficientes
	HabitatAvispas incrementarCantidadDeOrugas.
	HabitatAvispas incrementarCantidadDeOrugas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:28'!
laAvispaLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/21/2022 23:50:36'!
laAvispaOriana
	^self! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/23/2022 10:07:16'!
laAvispaOrnella
	^self! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/23/2022 10:09:05'!
laAvispaPolly
	^self! !

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

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NR 4/23/2022 10:15:24'!
retrocederElHabitatAlInicioDeLosTiempos
	HabitatAvispas inicializarCantidadDeHuevosDeAvispas.
	HabitatAvispas inicializarCantidadDeOrugas.
	HabitatAvispas inicializarCantidadDePolillas.! !


!PruebasReproduccionDeAvispas class methodsFor: 'as yet unclassified' stamp: 'NR 4/23/2022 10:17:11'!
intentarReproducirse
	HabitatAvispas cantidadDeOrugas > 0 ifTrue: [
		HabitatAvispas 	incrementarCantidadDeHuevosDeAvispas .
		HabitatAvispas reducirCantidadDeOrugas.
	].
	HabitatAvispas cantidadDePolillas > 0 ifTrue: [
		HabitatAvispas 	incrementarCantidadDeHuevosDeAvispas .
		HabitatAvispas reducirCantidadDePolillas.
	]
	! !

HabitatAvispas initializeAfterFileIn!