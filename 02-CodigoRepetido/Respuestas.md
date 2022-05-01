**Respuestas:**


**Abstraccion de los tests 01 y 02:**

...

**Como representar en Smalltalk:**

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés?
Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

Las formas que tenemos de representar entes de la realidad, es decir, objetos concretos que viven en la realidad, podemos representarlo en Smalltalk a traves de instancias.
En la realidad tenemos objetos concretos y esas cosas concretas pueden mappearse como instancias en un modelo. Cabe mencionar que es distinta la idea que tenemos de cada objeto en la realidad versus ese objeto concreto en si mismo.
La manera de representar la idea de ese objeto en la realidad a Smalltalk surge a traves de utiliar clases en el Modelo.

Modelo         -        Realidad

Instancias    < - - -   Objetos Concretos

Clases   < - - - Idea de Objetos


**Teoria de Naur:**

...

**Extra:**

Planes de Mejora en el Modelo.

Notamos en el modelo dado que, la clase CustomerBook tenia una categoria llamada errorMessages. Habian dos mensajes implementados que eran "customerAlreadyExistsErrorMessage" y "customerCanNotBeEmptyErrorMessage".
Nosotras creemos que, para que el modelo tenga consistencia, habria que agregar unos mensajes de error mas para poder mostrar luego en las pruebas y para respetar el funcionamiento del modelo en si.
Creemos esto ya que hay algunos mensajes que al lanzar una expcecion manejan el mensaje mostrado a traves de los mensajes mencionados anteriormente pero hay otros mensajes que no tienen ese manejo de excepciones con los mensajes extras que nostras agregariamos.
No implementamos esto ya que no era el objetivo del trabajo pero queriamos mencionar que nos parecia importante mantener la uniformidad y la consistencia del modelo y de los test cases.
Los mensajes que implementariamos serian:

- customerAlreadySuspendedErrorMessage
- customerIsInvalidErrorMessage

El primero lo usariamos en el Test 08, de esta manera ... description: CustomerBook customerAlreadySuspendedErrorMessage.

El segundo lo usariamos en los Tests 04 y 07, de esta manera ... description: CustomerBook customerIsInvalidErrorMessage. respectivamente.
