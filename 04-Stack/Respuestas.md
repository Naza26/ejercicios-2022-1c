**Se pide extender el modelo para que además de representar al stack ilimitado ya construido, se puedan construir instancias de un stack limitado. Es decir, uno de que tenga una cantidad limitada de celdas y que no se puedan pushear más elementos que los disponibles en su capacidad.**

**Se pide además analizar cuál de los modelos anteriores cree que es más sencillo extender para representarla y hacerlo.**

**Además se deberán agregar los casos de tests que hagan falta para probar el nuevo tipo de stack.**


Hicimos el Extra. 

Agregamos los Test Cases a traves de una nueva clase. Sabemos que puede haber una mejor forma de agruparlo dentro una sola clase porque hay varios mensajes repetidos pero decidmos hacerlo de esta forma para simplificar las cosas.

Luego, con lo que respecta a la implementacion, nos parecio lo mejor la idea de sublclasificar dentro de OOStack una pila Limitada y Otra Ilimitada.
De esta manera, van a poder responder los mismos mensajes que heredan de la super clase y modificar el unico mensaje que cambiaba en particular para la subclase LimitedOOStack que era el push.
El push cambiaba ya que cada vez que se pusheaba debia chequear si no se estaba excediendo el limite maximo establecido para esa pila.
