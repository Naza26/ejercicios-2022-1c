**Conceptos fundamentales**

Software / Programa: Modelo computable de un dominio de problema de la realidad (vs Secuencia de instrucciones)

Paradigma de Objetos: Objetos que colaboran entre sí mediante el envío de mensajes para resolver un problema.

Desarrollo de software: Proceso de aprendizaje, iterativo e incremental

Eje descriptivo, funcional e implementativo. Foco en eje descriptivo y funcional.

Filosofía Smalltalk:
- Ambiente de aprendizaje
- Fundacional del paradigma
- Ambiente vivo
- Imagen + VM
- Feedback inmediato
- “Todo es un objeto”
- Conceptos del paradigma

Objeto:

Representación de un ente de un dominio de problema
Se define a partir de los mensajes que sabe responder.

Nueva definición (más precisa): Representación del rol que desempeña un ente de la realidad en el contexto de un dominio de problema

Mensaje:

- Define el QUE de un objeto
- Define una responsabilidad
- Comportamiento definido a través de un método asociado a un objeto con el mismo nombre que el mensaje
- Conjunto de mensajes define la escencia de un objeto
- Son objetos

Método:

- Implementación de un mensaje
- Representa un conjunto de colaboraciones
- Define el CóMO
- 1 mensaje -> 1 o más métodos asociados
- Son objetos

self: Pseudo-variable que hace referencia al objeto receptor en el contexto de un método.

Colaboradores:

- Otro objeto con el que un objeto colabora
- También conocido como variables
- Interno: Lo conozco siempre, relación de cercanía (variable de instancia)
- Externo: Colabora para un mensaje puntual (parámetro)
- 4 caracteristicas de una colaboración:

  - Sincrónica: Se envia un mensaje y esperamos que el mismo sea respondido. No continuamos con la siguiente colaboracion.

  - Dirigida: Envio un mensaje que va a un objeto receptor. Al cual se a quien.

Ejemplo:

AlanTuring dateOfBirth.
Receptor	Mensaje	Emisor
AlanTuring	dateOfBirth	Yo en el ambiente
Siempre tiene se responde un objeto: En el caso de smalltalk si uno no pone el return explícito responde self.

Receptor desconoce al emisor: La respuesta a una colaboración es independiente del emisor.

Ejemplo:

January/1/2019 distanceTo: March/21/2019.
El objeto

March/21/2019
esta colaborando con el objeto

January/1/2019
a traves de este mensaje

distanceTo:

Closure:

- Objeto que representa un bloque de código
- Diferencia con método: No está asociado a un mensaje (es anónimo)
- Representan conjunto de colaboraciones.
- Estan bindeados al contexto. El closure esta unido al contexto.

Ejemplo:

  m1
      |t1 myClosure|
      t1 := 1.
      myClosure := [t1 := t1 + 1].
      ^myClosure
Si hago

  m1 value.
El resultado sera:

  m1 value. 2
Si hago nuevamente

  m1 value.
Devolvera:

  m1 value. 3
