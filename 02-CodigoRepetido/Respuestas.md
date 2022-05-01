**Respuestas:**


**Abstraccion de los tests 01 y 02:**

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

Nosotras no creamos algo nuevo. La realidad es que nos dimos cuenta que Smalltalk tiene una serie de mensajes predefinidos que nos servian para remover el codigo repetido y generar codigo mas legible, mas conciso y sobre todo, codigo mas mantenible en el tiempo. Nos referimos a mantenible porque los mensajes que nos presenta Smalltalk van a ser menos factibles/propensos a presentar fallas que implementaciones nuestras para manejar cada posible escenario de codigo que tengamos.

Sin embargo, creamos una nueva entidad. La nueva entidad que creamos fue la de medir tiempo, como una especie de cronometro que nos indica cuanto tiempo paso entre la realizacion de una cierta accion. En el caso del primer test el tiempo que paso entre que se creo un cliente y en el segundo test el tiempo que paso entre que se removio un cliente del libro de clientes.

**Como representar en Smalltalk:**

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés?
Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

Las formas que tenemos de representar entes de la realidad, es decir, objetos concretos que viven en la realidad, es a traves de instancias en Smalltalk.
En la realidad tenemos objetos concretos y esas cosas concretas pueden mappearse como instancias en un modelo. Cabe mencionar que es distinta la idea que tenemos de cada objeto en la realidad versus ese objeto concreto en si mismo.
La manera de representar la idea de ese objeto en la realidad a Smalltalk surge a traves de utilizar clases en el modelo.

Modelo   - - - - - - Realidad

Instancias    < - - -   Objetos Concretos

Clases   < - - - Idea de Objetos


**Teoria de Naur:**

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?
...

**Extras:**

*Planes de Mejora en el Modelo.*

Notamos en el modelo dado que, la clase CustomerBook tenia una categoria llamada errorMessages. Habian dos mensajes implementados que eran "customerAlreadyExistsErrorMessage" y "customerCanNotBeEmptyErrorMessage".
Nosotras creemos que, para que el modelo tenga consistencia, habria que agregar unos mensajes de error mas para poder mostrar luego en las pruebas y para respetar el funcionamiento del modelo en si.
Creemos esto ya que hay algunos mensajes que al lanzar una expcecion manejan el mensaje mostrado a traves de los mensajes mencionados anteriormente pero hay otros mensajes que no tienen ese manejo de excepciones con los mensajes extras que nostras agregariamos.
No implementamos esto ya que no era el objetivo del trabajo pero queriamos mencionar que nos parecia importante mantener la uniformidad y la consistencia del modelo y de los test cases.
Los mensajes que implementariamos serian:

- customerAlreadySuspendedErrorMessage
- customerIsInvalidErrorMessage

El primero lo usariamos en el Test 08.

El segundo lo usariamos en los Tests 04 y 07.

*Clases vacias deberian ser clases removidas o refactorizadas.*

Notamos que las clases Can´t Suspend y Not Found estan creadas pero vacias y sabemos que la catedra recomendo no estar en esta situacion asi que consideramos que el modelo necesita un refactoring o borrarlas para que no queden vacias. (Ademas confunde al programador, no sabe si las tiene que usar o no).

*Optamos por legibilidad.*

Optamos por no modificar los mensajes "signalCustomerAlreadyExists" y "signalCustomerNameCannotBeEmpty" ya que la manera en la que tendriamos que resolver no seria mas legible y tampoco simple. Por como esta hecho el modelo, y por las refactorizaciones optamos por dejar esos dos mensajes como vinieron dados.




