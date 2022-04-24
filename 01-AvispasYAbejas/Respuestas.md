
**Sobre implementar funcionalidad**
 
 En nuestro caso particular, nosotras trabajmos estos tests en clase y como estabamos recien acostumbrandonos a cuis y a seguir este paradigma, fuimos lo mas lento posible. Esto quiere decir que al principio, lo primero que haciamos era hacer que se cumpla el test agregando los mensajes que no estaban implentados y haciendo returns que cumplan con los tests. De esta manera, nuestros tests fueron pasando de manera progresiva, no pasaron los tres en simultaneo. Nosotras pensamos que este approach de ir haciendolo de a poco fue clave para entender las relaciones entre las Avispas y el Habitat por ejemplo, que al cominezo no era muy claro. Despues, con el tiempo, nos dimos cuenta como se relacionaban y logramos hacer que luego de tener hecha Avispa Oriana paso por paso, la Avispa Ornella y Polly saliera casi automaticamente.
  
  **Sobre código repetido**
  
  No tuvimos mucho codigo repetido porque nos abstuvimos a hacer el codigo modularizado y al mismo tiempo simple. En nuestro codigo la avispa es la que se encarga de revisar si el habitat es habitable, una vez que verifica que hay comida pone el huevo. Eligimos esta implementacion porque comparamos con la realidad, el habitat no sabe si es habitable o no, la avispa es la que antes de reproducirse chequea que este todo en condiciones, si hubieramos hecho que el habitat se verifique a si misma que es habitable no hubiera tenido sentido, repitiendo que lo hicimos comparado con la realidad y por eso optamos por esa implementacion.
  
  **Sobre código repetido 2**
  

Si hubiésemos trabajado con lo que vimos la última clase (objetos prototípicos), podríamos haber considerado tener una Avispa “padre” y que esta tuviera objetos hijos asociados (Avispa Oriana, Avispa Ornella, Avispa Polly y la Avispa Ladrona).
De esta manera, podríamos sacarnos de encima el código “repetido” de tener métodos iguales que responden a distintos objetos. Por ejemplo, intentarReproducirse en nuestro trabajo.
Para guardar la totalidad de huevos de todas las avispas sin distinción, lo que usamos fue un colaborador interno del Hábitat que nos devolvía la cantidad de huevos a través de un mensaje.
Luego, para casa huevo genético perteneciente a cada Avispa, lo que hicimos fue crear un diccionario que tenía como clave el tipo de animal que comía como alimento y cómo valor los huevos que generaba.
Usamos estas claves ya que Oriana y Ornella tenían que tener la misma clave, ellas eran Avispas comedoras de Orugas y Polly era una Avispa comedora de Polillas, con esa distinción hicimos un diccionario de la pinta: huevosConFirmaGenetica = {“comedorasDeXAlimento”: cantidadDeHuevos}
Y entonces a través de la firma de cada Avispa indexábamos en el diccionario.
Realmente no sabemos si la implementación está era la más sencilla o no, quizás se podría haber hecho de otra forma, pero haber elegido este approach no nos complicó las cosas a la hora de resolver las pruebas.
