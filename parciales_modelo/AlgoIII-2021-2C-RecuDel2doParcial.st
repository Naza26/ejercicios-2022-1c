!classDefinition: #RecuperatorioTest category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
TestCase subclass: #RecuperatorioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!RecuperatorioTest methodsFor: 'private' stamp: 'NR 7/3/2022 17:03:53'!
aUna: ciudad leAgregoMultiplesZonasIndustrialesAPartirDe: zonaIndustrial

	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial! !

!RecuperatorioTest methodsFor: 'private' stamp: 'SF 12/19/2021 15:51:42'!
test00PodemosUsarMedidasDeElectricidadYAgua

	self assert: 10 * ep equals: 0 * ep + (10 * ep).
	self assert: 15 * wp equals: 0 * wp + (15 * wp).
	! !

!RecuperatorioTest methodsFor: 'private' stamp: 'NR 7/3/2022 15:38:26'!
test01ElServicioDeElectricidadBrinda500EnergyPoints

	| servicioDeElectricidad |
	servicioDeElectricidad := ServicioDeElectricidad 	new.
	
	self assert: servicioDeElectricidad obtenerFuenteDeServicios equals: 500 * ep
	! !

!RecuperatorioTest methodsFor: 'private' stamp: 'NR 7/3/2022 15:38:37'!
test02ElServicioDeAguaBrinda200WaterPoints

	| servicioDeAgua |
	servicioDeAgua := ServicioDeAgua 	new.
	
	self assert: servicioDeAgua obtenerFuenteDeServicios equals: 200 * wp
	! !

!RecuperatorioTest methodsFor: 'private' stamp: 'NR 7/3/2022 13:53:46'!
test03SePuedeConstruirUnaZonaResidencialConLosServiciosNecesarios

	| zonaResidencial servicioDeAgua servicioDeElectricidad ciudad |
	
	servicioDeAgua := ServicioDeAgua new.
	servicioDeElectricidad := ServicioDeElectricidad new.
	
	zonaResidencial := ZonaResidencial new.
	
	ciudad := Ciudad crearCiudadConServicioDeAgua: servicioDeAgua yConServicioDeElectricidad: servicioDeElectricidad.
	
	ciudad agregarZona: zonaResidencial.
	
	self assert: ciudad tasaDeConsumoDeElectricidad equals: 495 * ep.
	self assert: ciudad tasaDeConsumoDeAgua equals: 191 * wp.
	! !

!RecuperatorioTest methodsFor: 'private' stamp: 'NR 7/3/2022 13:59:25'!
test04SePuedeConstruirUnaZonaIndustrialConLosServiciosNecesarios

	| zonaIndustrial ciudad servicioDeAgua servicioDeElectricidad |
	
	servicioDeAgua := ServicioDeAgua new.
	servicioDeElectricidad := ServicioDeElectricidad new.
	
	zonaIndustrial := ZonaIndustrial new.
	
	ciudad := Ciudad crearCiudadConServicioDeAgua: servicioDeAgua yConServicioDeElectricidad: servicioDeElectricidad.
	
	ciudad agregarZona: zonaIndustrial.
	
	self assert: ciudad tasaDeConsumoDeElectricidad equals: 490 * ep.
	self assert: ciudad tasaDeConsumoDeAgua equals: 190 * wp.
	! !

!RecuperatorioTest methodsFor: 'private' stamp: 'NR 7/3/2022 16:31:53'!
test05SePuedeConstruirUnaZonaComercialConLosServiciosNecesariosCuandoUnaZonaResidencialYaFueCreada

	| zonaComercial ciudad servicioDeAgua servicioDeElectricidad zonaResidencial |
	
	servicioDeAgua := ServicioDeAgua new.
	servicioDeElectricidad := ServicioDeElectricidad new.
	
	zonaResidencial := ZonaResidencial new.
	zonaComercial := ZonaComercial new.
	
	ciudad := Ciudad crearCiudadConServicioDeAgua: servicioDeAgua yConServicioDeElectricidad: servicioDeElectricidad.
	
	ciudad agregarZona: zonaResidencial.
	ciudad agregarZona: zonaComercial.
	
	self assert: ciudad tasaDeConsumoDeElectricidad equals: 487 * ep.
	self assert: ciudad tasaDeConsumoDeAgua equals: 189 * wp.
	! !

!RecuperatorioTest methodsFor: 'private' stamp: 'NR 7/3/2022 16:32:00'!
test06NoSePuedeConstruirUnaZonaComercialCuandoUnaZonaResidencialNoFueCreada

	| zonaComercial ciudad servicioDeAgua servicioDeElectricidad |
	
	servicioDeAgua := ServicioDeAgua new.
	servicioDeElectricidad := ServicioDeElectricidad new.
	
	zonaComercial := ZonaComercial new.
	
	ciudad := Ciudad crearCiudadConServicioDeAgua: servicioDeAgua yConServicioDeElectricidad: servicioDeElectricidad.
	
	self should: [ ciudad agregarZona: zonaComercial. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Ciudad errorDescripcionZonaResidencialNoConstruida ].
	! !

!RecuperatorioTest methodsFor: 'private' stamp: 'NR 7/3/2022 16:31:47'!
test07SePuedenConstruirMultiplesZonasResidencialesConLosServiciosNecesarios

	| ciudad servicioDeAgua servicioDeElectricidad zonaResidencial |
	
	servicioDeAgua := ServicioDeAgua new.
	servicioDeElectricidad := ServicioDeElectricidad new.
	
	zonaResidencial := ZonaResidencial new.
	
	ciudad := Ciudad crearCiudadConServicioDeAgua: servicioDeAgua yConServicioDeElectricidad: servicioDeElectricidad.
	
	ciudad agregarZona: zonaResidencial.
	ciudad agregarZona: zonaResidencial.
	ciudad agregarZona: zonaResidencial.
	
	self assert: ciudad tasaDeConsumoDeElectricidad equals: 485 * ep.
	self assert: ciudad tasaDeConsumoDeAgua equals: 173 * wp.
	! !

!RecuperatorioTest methodsFor: 'private' stamp: 'NR 7/3/2022 16:32:55'!
test08SePuedenConstruirMultiplesZonasIndustrialesConLosServiciosNecesarios

	| ciudad servicioDeAgua servicioDeElectricidad zonaIndustrial |
	
	servicioDeAgua := ServicioDeAgua new.
	servicioDeElectricidad := ServicioDeElectricidad new.
	
	zonaIndustrial := ZonaIndustrial new.
	
	ciudad := Ciudad crearCiudadConServicioDeAgua: servicioDeAgua yConServicioDeElectricidad: servicioDeElectricidad.
	
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	ciudad agregarZona: zonaIndustrial.
	
	self assert: ciudad tasaDeConsumoDeElectricidad equals: 470 * ep.
	self assert: ciudad tasaDeConsumoDeAgua equals: 170 * wp.
	! !

!RecuperatorioTest methodsFor: 'private' stamp: 'NR 7/3/2022 16:41:09'!
test09SePuedenConstruirMultiplesZonasComercialesConLosServiciosNecesarios

	| ciudad servicioDeAgua servicioDeElectricidad zonaComercial zonaResidencial |
	
	servicioDeAgua := ServicioDeAgua new.
	servicioDeElectricidad := ServicioDeElectricidad new.
	
	zonaResidencial :=  ZonaResidencial new.
	zonaComercial := ZonaComercial new.
	
	ciudad := Ciudad crearCiudadConServicioDeAgua: servicioDeAgua yConServicioDeElectricidad: servicioDeElectricidad.
	
	ciudad agregarZona: zonaResidencial.
	ciudad agregarZona: zonaComercial.
	ciudad agregarZona: zonaComercial.
	ciudad agregarZona: zonaComercial.
	
	self assert: ciudad tasaDeConsumoDeElectricidad equals: 471 * ep.
	self assert: ciudad tasaDeConsumoDeAgua equals: 185 * wp.
	! !

!RecuperatorioTest methodsFor: 'private' stamp: 'NR 7/3/2022 17:03:53'!
test10NoSePuedenConstruirMultiplesZonasCuandoFaltanServicios

	| ciudad servicioDeAgua servicioDeElectricidad zonaIndustrial |
	
	servicioDeAgua := ServicioDeAgua new.
	servicioDeElectricidad := ServicioDeElectricidad new.
	
	zonaIndustrial := ZonaIndustrial new.
	
	ciudad := Ciudad crearCiudadConServicioDeAgua: servicioDeAgua yConServicioDeElectricidad: servicioDeElectricidad.
	
	self aUna: ciudad leAgregoMultiplesZonasIndustrialesAPartirDe: zonaIndustrial.
	
	self should: [ ciudad agregarZona: zonaIndustrial ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = ZonaIndustrial errorDescripcionRecursosInsuficientes ].
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RecuperatorioTest class' category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
RecuperatorioTest class
	instanceVariableNames: ''!

!RecuperatorioTest class methodsFor: 'class initialization' stamp: 'SF 12/19/2021 15:02:52'!
initialize

	"Este método está para crear unidades"
	"No lo deben tocar ni darle importancia durante el examen"
	
	| ep wp |
	ep := BaseUnit named: 'energypoint' sign: 'ep'.
	wp := BaseUnit named: 'waterpoint' sign: 'wp'.
	
	Smalltalk at: #ep put: ep.
	Smalltalk at: #wp put: wp.! !


!classDefinition: #Ciudad category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Object subclass: #Ciudad
	instanceVariableNames: 'servicioAgua servicioElectricidad zonas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!Ciudad methodsFor: 'aserciones' stamp: 'NR 7/3/2022 20:19:12'!
assertConstruccionZonaValidaPara: unaZonaAConstruir
	
	
	(self assertRecursosSuficientesPara: unaZonaAConstruir) ifFalse: [
	 	^ self error: unaZonaAConstruir class errorDescripcionRecursosInsuficientes.
	].

	(self esZonaComercial: unaZonaAConstruir) ifTrue: [
		self assertZonaResidencialYaCreada
	].
	! !

!Ciudad methodsFor: 'aserciones' stamp: 'NR 7/3/2022 20:19:23'!
assertRecursosSuficientesPara: unaZonaAConstruir

	^ (unaZonaAConstruir haySuficientesRecursosDeAgua: self tasaDeConsumoDeAgua)
	and: 
	(unaZonaAConstruir haySuficientesRecursosDeElectricidad: self tasaDeConsumoDeElectricidad)! !

!Ciudad methodsFor: 'aserciones' stamp: 'NR 7/3/2022 16:30:32'!
assertZonaResidencialYaCreada
	
	self hayZonaResidencialYaCreada.! !

!Ciudad methodsFor: 'aserciones' stamp: 'NR 7/3/2022 16:30:12'!
hayZonaResidencialYaCreada

	(zonas anySatisfy: [:unaZona | (self esZonaResidencial: unaZona)]) ifFalse: [
		^ self error: self class errorDescripcionZonaResidencialNoConstruida.
	].! !


!Ciudad methodsFor: 'tasas de consumo' stamp: 'NR 7/3/2022 13:53:27'!
tasaDeConsumoDeAgua

	^ servicioAgua.! !

!Ciudad methodsFor: 'tasas de consumo' stamp: 'NR 7/3/2022 13:53:36'!
tasaDeConsumoDeElectricidad

	^ servicioElectricidad.! !


!Ciudad methodsFor: 'tipos de zonas' stamp: 'NR 7/6/2022 17:39:37'!
esZonaComercial: unaZonaAConstruir

	^ unaZonaAConstruir esComercial.! !

!Ciudad methodsFor: 'tipos de zonas' stamp: 'NR 7/6/2022 17:39:44'!
esZonaIndustrial: unaZonaAConstruir

	^ unaZonaAConstruir esIndustrial.! !

!Ciudad methodsFor: 'tipos de zonas' stamp: 'NR 7/6/2022 17:39:51'!
esZonaResidencial: unaZonaAConstruir

	^ unaZonaAConstruir esResidencial.! !


!Ciudad methodsFor: 'actualizacion de tasas' stamp: 'NR 7/3/2022 20:16:15'!
actualizarTasaDeConsumoDeServiciosPara: unaZonaAConstruir

	unaZonaAConstruir procesarActualizacionDeConsumosPara: self.! !

!Ciudad methodsFor: 'actualizacion de tasas' stamp: 'NR 7/3/2022 16:19:51'!
actualizarTasaDeConsumosParaZonaComercial

	servicioAgua := servicioAgua - (2 * wp).
	servicioElectricidad := servicioElectricidad - (8 * ep).! !

!Ciudad methodsFor: 'actualizacion de tasas' stamp: 'NR 7/3/2022 16:19:59'!
actualizarTasaDeConsumosParaZonaIndustrial

	servicioAgua := servicioAgua - (10 * wp).
	servicioElectricidad := servicioElectricidad - (10 * ep).! !

!Ciudad methodsFor: 'actualizacion de tasas' stamp: 'NR 7/3/2022 16:20:03'!
actualizarTasaDeConsumosParaZonaResidencial

	servicioAgua := servicioAgua - (9 * wp).
	servicioElectricidad := servicioElectricidad - (5 * ep).! !


!Ciudad methodsFor: 'initialize' stamp: 'NR 7/3/2022 15:34:01'!
inicializarCiudadConServicioDeAgua: servicioDeAgua yConServicioDeElectricidad: servicioDeElectricidad

	servicioAgua := servicioDeAgua obtenerFuenteDeServicios.
	servicioElectricidad := servicioDeElectricidad obtenerFuenteDeServicios.
	zonas := OrderedCollection new.! !


!Ciudad methodsFor: 'agregado de zonas' stamp: 'NR 7/3/2022 15:31:33'!
agregarZona: unaZonaAConstruir

	self assertConstruccionZonaValidaPara: unaZonaAConstruir.

	zonas add: unaZonaAConstruir.	
	
	self actualizarTasaDeConsumoDeServiciosPara: unaZonaAConstruir.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ciudad class' category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Ciudad class
	instanceVariableNames: ''!

!Ciudad class methodsFor: 'descripcion de error' stamp: 'NR 7/3/2022 15:23:44'!
errorDescripcionZonaResidencialNoConstruida

	^ 'No hay una zona residencial creada'! !


!Ciudad class methodsFor: 'creacion' stamp: 'NR 7/3/2022 13:35:33'!
crearCiudadConServicioDeAgua: servicioDeAgua yConServicioDeElectricidad: servicioDeElectricidad

	^ Ciudad new inicializarCiudadConServicioDeAgua: servicioDeAgua yConServicioDeElectricidad: servicioDeElectricidad.! !


!classDefinition: #Servicio category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Object subclass: #Servicio
	instanceVariableNames: 'serviciosBasicos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!Servicio methodsFor: 'valor de fuente' stamp: 'NR 7/3/2022 15:48:46'!
obtenerFuenteDeServicios

	self subclassResponsibility.! !


!classDefinition: #ServicioDeAgua category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Servicio subclass: #ServicioDeAgua
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!ServicioDeAgua methodsFor: 'valor de fuente' stamp: 'NR 7/3/2022 15:33:47'!
obtenerFuenteDeServicios

	^ 200 * wp! !


!classDefinition: #ServicioDeElectricidad category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Servicio subclass: #ServicioDeElectricidad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!ServicioDeElectricidad methodsFor: 'valor de fuente' stamp: 'NR 7/3/2022 15:34:00'!
obtenerFuenteDeServicios

	^ 500 * ep! !


!classDefinition: #Zona category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Object subclass: #Zona
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!Zona methodsFor: 'testing' stamp: 'NR 7/3/2022 15:48:19'!
haySuficientesRecursosDeAgua: agua

	self subclassResponsibility.! !

!Zona methodsFor: 'testing' stamp: 'NR 7/3/2022 15:48:32'!
haySuficientesRecursosDeElectricidad: electricidad

	self subclassResponsibility.! !


!Zona methodsFor: 'private' stamp: 'NR 7/3/2022 20:14:46'!
procesarActualizacionDeConsumosPara: unaCiudad

	self subclassResponsibility.! !


!Zona methodsFor: 'tipo de zona' stamp: 'NR 7/6/2022 17:38:02'!
esComercial

	^ false.! !

!Zona methodsFor: 'tipo de zona' stamp: 'NR 7/6/2022 17:38:10'!
esIndustrial

	^ false.! !

!Zona methodsFor: 'tipo de zona' stamp: 'NR 7/6/2022 17:38:14'!
esResidencial

	^ false.! !


!classDefinition: #ZonaComercial category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Zona subclass: #ZonaComercial
	instanceVariableNames: 'tasaDeConsumoDeAgua cantidadDeZonasResidenciales tasaDeConsumoDeElectricidad'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!ZonaComercial methodsFor: 'testing' stamp: 'NR 7/3/2022 15:45:53'!
haySuficientesRecursosDeAgua: agua

	^ agua >= (2 * wp).! !

!ZonaComercial methodsFor: 'testing' stamp: 'NR 7/3/2022 15:45:34'!
haySuficientesRecursosDeElectricidad: electricidad

	^ electricidad >= (8 * ep).! !


!ZonaComercial methodsFor: 'private' stamp: 'NR 7/3/2022 20:14:34'!
procesarActualizacionDeConsumosPara: unaCiudad

	unaCiudad actualizarTasaDeConsumosParaZonaComercial.! !


!ZonaComercial methodsFor: 'tipo de zona' stamp: 'NR 7/6/2022 17:38:39'!
esComercial

	^ true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ZonaComercial class' category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
ZonaComercial class
	instanceVariableNames: ''!

!ZonaComercial class methodsFor: 'descripcion de error' stamp: 'NR 7/2/2022 16:37:09'!
errorDescripcionRecursosInsuficientes

	^ 'No hay suficientes recursos para crear la zona'! !


!classDefinition: #ZonaIndustrial category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Zona subclass: #ZonaIndustrial
	instanceVariableNames: 'tasaDeConsumoDeAgua cantidadDeZonasResidenciales tasaDeConsumoDeElectricidad'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!ZonaIndustrial methodsFor: 'testing' stamp: 'NR 7/3/2022 15:45:09'!
haySuficientesRecursosDeAgua: agua

	^ agua >= (10 * wp).! !

!ZonaIndustrial methodsFor: 'testing' stamp: 'NR 7/3/2022 15:45:23'!
haySuficientesRecursosDeElectricidad: electricidad

	^ electricidad >= (10 * ep).! !


!ZonaIndustrial methodsFor: 'private' stamp: 'NR 7/3/2022 20:14:23'!
procesarActualizacionDeConsumosPara: unaCiudad

	unaCiudad actualizarTasaDeConsumosParaZonaIndustrial.! !


!ZonaIndustrial methodsFor: 'tipo de zona' stamp: 'NR 7/6/2022 17:38:57'!
esIndustrial

	^ true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ZonaIndustrial class' category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
ZonaIndustrial class
	instanceVariableNames: ''!

!ZonaIndustrial class methodsFor: 'descripcion de error' stamp: 'NR 7/2/2022 17:10:52'!
errorDescripcionRecursosInsuficientes

	^ 'No hay suficientes recursos para crear la zona'! !


!classDefinition: #ZonaResidencial category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Zona subclass: #ZonaResidencial
	instanceVariableNames: 'tasaDeConsumoDeAgua tasaDeConsumoDeElectricidad cantidadDeZonasResidenciales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!ZonaResidencial methodsFor: 'testing' stamp: 'NR 7/3/2022 15:44:42'!
haySuficientesRecursosDeAgua: agua

	^ agua >= (9 * wp).! !

!ZonaResidencial methodsFor: 'testing' stamp: 'NR 7/3/2022 15:44:56'!
haySuficientesRecursosDeElectricidad: electricidad

	^ electricidad >= (5 * ep).! !


!ZonaResidencial methodsFor: 'private' stamp: 'NR 7/3/2022 20:13:47'!
procesarActualizacionDeConsumosPara: unaCiudad

	unaCiudad actualizarTasaDeConsumosParaZonaResidencial.! !


!ZonaResidencial methodsFor: 'tipo de zona' stamp: 'NR 7/6/2022 17:39:18'!
esResidencial

	^ true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ZonaResidencial class' category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
ZonaResidencial class
	instanceVariableNames: ''!

!ZonaResidencial class methodsFor: 'descripcion de error' stamp: 'NR 7/2/2022 16:37:09'!
errorDescripcionRecursosInsuficientes

	^ 'No hay suficientes recursos para crear la zona'! !

RecuperatorioTest initialize!