## **Conceptos fundamentales**

**Software / Programa**

- Modelo computable de un dominio de problema de la realidad (vs Secuencia de instrucciones)

- Paradigma de Objetos: Objetos que colaboran entre sí mediante el envío de mensajes para resolver un problema.

**Desarrollo de software:**

- Proceso de aprendizaje, iterativo e incremental
- Eje descriptivo, funcional e implementativo. Foco en eje descriptivo y funcional.

**Filosofía Smalltalk:**
- Ambiente de aprendizaje
- Fundacional del paradigma
- Ambiente vivo
- Imagen + VM
- Feedback inmediato
- “Todo es un objeto”

## **Conceptos del paradigma**

**Objeto:**

- Representación de un ente de un dominio de problema
- Se define a partir de los mensajes que sabe responder.
- Nueva definición (más precisa): Representación del rol que desempeña un ente de la realidad en el contexto de un dominio de problema

**Mensaje:**

- Define el QUE de un objeto
- Define una responsabilidad
- Comportamiento definido a través de un método asociado a un objeto con el mismo nombre que el mensaje
- Conjunto de mensajes define la escencia de un objeto
- Son objetos

**Método:**

- Implementación de un mensaje
- Representa un conjunto de colaboraciones
- Define el COMO
- 1 mensaje -> 1 o más métodos asociados
- Son objetos
- ```self```: Pseudo-variable que hace referencia al objeto receptor en el contexto de un método.

**Colaboradores:**

- Otro objeto con el que voy a colaborar. Relación de conocimiento. Variables.
- También conocido como variables
- Interno: Lo conozco siempre, relación de cercanía (variable de instancia)
- Externo: Colabora para un mensaje puntual (parámetro)
- **4 caracteristicas de una colaboración:**

  - **Sincrónica:** Se envia un mensaje y esperamos que el mismo sea respondido. No continuamos con la siguiente colaboracion.

  - **Dirigida:** Envio un mensaje que va a un objeto receptor. Al cual se a quien.

  - Ejemplo:
    ```
      AlanTuring dateOfBirth.
    ```

  | Receptor  | Mensaje | Emisor |
  | ------------- | ------------- |------------- |
  | AlanTuring  | dateOfBirth  | Yo en el ambiete|


  - **Siempre tiene se responde un objeto:** En el caso de ```smalltalk``` si uno no pone el ```return``` explícito responde ```self```.

  - **Receptor desconoce al emisor:** La respuesta a una colaboración es independiente del emisor.

```
  January/1/2019 distanceTo: March/21/2019.
```
El **objeto**

```
  March/21/2019
```

esta colaborando con el **objeto**

```
  January/1/2019
```
 
 a traves de este mensaje
 
```
  distanceTo:
```

Closure:

Objeto que representa un bloque de código
Diferencia con método: No está asociado a un mensaje (es anónimo)
Representan conjunto de colaboraciones.
Estan bindeados al contexto. El closure esta unido al contexto.

Ejemplo:

```
  m1
      |t1 myClosure|
      t1 := 1.
      myClosure := [t1 := t1 + 1].
      ^myClosure
```

Si hago

```
  m1 value.
```

El resultado sera:

```
  m1 value. 2
```

Si hago nuevamente 

```
  m1 value.
```

Devolvera:

```
 m1 value. 3
```

Acerca de los metodos y mensajes en smalltalk

```
  nombreMensaje
    "comentarios"
    |respuesta|
    respuesta := 'Hello world'
    ^respuesta
```

El ```^``` vendria a remplazar el return.

Se asigna el valor a una variable temporal con ```:=``` o tambien con ```_```.

Las variables se declaran entre ```| |```

Podemos concatenar strings a traves de ```,```

El punto separa las colaboraciones. Es una forma de decir que viene otra colaboración luego del ```.```


Subclasificación

Clase: Objeto que representa un concepto. Ej: Número, Auto.

Subclasificación: 

- Nos sirve para organizar el conocimiento en jerarquías (Ontología de conocimientos)
- Clase abstracta -> No tiene realizaciones concretas -> No existen entes de la realidad que puedo relacionar exclusivamente a ese concepto -> No existen instancias de esa clase.
- Tiene al menos un mensaje abstracto

Mensajes abstracto: 
- No tiene método asociado (en Smalltalk, creamos el método pero lo implementamos con “self subclassResponsibility”)

Heurísticas de diseño
- Modelar 1:1 entre ente de la realidad y objeto.
- Buscamos que el conjunto de mensajes sea minimal -> Bajo acoplamiento, alta cohesión.
- Guiarnos por el aspecto funcional conduce a buenos modelos.
- Detectar y quitar código repetido para generar un nuevo conocimiento / hacer explícito un concepto (“reíficar”)
- Nombrar a los objetos (incluyendo colaboradores externos, internos, temporales) según el rol que cumplen en cada contexto.
- Evitar romper encapsulamiento.
- Favorecer composicion/delegacion por sobre subclasificacion/herencia.

Algoritmo para Quitar código repetido

- Copiar lo repetido a otro lado
- Parametrizar lo que cambia
- Nombrar la nueva abstraccion
- Usar la nueva abstraccion

Buenas prácticas
- Categorizar los mensajes
- Implementar mensajes abstractos con “self subclassResponsibility”

Heuristica:

Solo las clases hoja deberian tener instancias

Polimorfismo: Si tenemos dos o mas objetos, son polimorficos entre si respecto de un conjunto de mensajes si dichos mensajes son semanticamente iguales. Es decir si los metodos asociados son iguales (tienen el mismo nombre de mensaje, hacen la misma funcion en la vida real aunque el metodo este escrito de manera diferente, tambien el resultado de lo que devuelven deberia ser lo mismo)

Favorecer el uso de polimorfismo por sobre los Ifs.

Simbolos (#):

Es una string que es idéntica (==) a otra string si sus caracteres son iguales.
Un objeto que es una cadena de texto única. Es algo similar a lo que te imaginas como símbolo conceptualmente.
Es util para representar un objeto que sólo se diferencia de otro en que no es el mismo, pero que no tiene ningún comportamiento en particular. Como el paquete de chicles acá.


Dos simbolos iguales, son identicos
Dos strings iguales, pueden no ser identicas
identico = misma instancia, mismo objeto
