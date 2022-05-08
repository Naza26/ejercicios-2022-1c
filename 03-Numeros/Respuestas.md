**Respuestas**

**Aporte de los mensajes de DD**

En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

En double dispatch, el primer llamado determina con que tipo de objeto estamos trabajando, es decir si tenemos "1 + 1", el mensaje "+" es polimorfico porque hasta que no se le asigna un objeto puede actuar como Fraccion o Entero. 
El segundo llamado determina de que manera se va a colaborar con el objeto previo. Notamos que, vamos a tener cuatro mensajes polimorficos, ellos van a representar los distintos tipos de operaciones y combinatorias entre enteros y fracciones. Ejemplo:

  1 + 2 —> beAddedToAnInt —> anAdder = Entero

  1 + 2/5 —> beAddedToAnInt —> anAdder = Fraccion

  1/5 + 2 —> beAddedToAFraction —> anAdder = Entero

  1/5 + 3/5 —> beAddedToAFraction —> anAdder = Fraccion

**Lógica de instanciado**

Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

Con lo visto y sabido hasta ahora nos parece mejor a la hora de crear un objeto tener mensajes de clase que sepan crear el objeto con caracteristicas ya definidas, es decir, que el objeto no se cree vacio.
No nos parece correcto tener mensajes de instacias que inicialicen al objeto una vez creado, ya que la heuristica que estamos siguiendo en la materia nos indica que es una buena practica crear a un objeto con valores.

**Nombres de las categorías de métodos**

Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Con lo vimos y trabajamos hasta ahora categorizamos los metodos como privados, ya que no se debe conocer el "cómo" de un metodo si no el "qué". En este caso nosotras consideramos que los detalles de implementacion deberian ser privados hasta que necesiten ser modificados.

**Subclass Responsibility**

Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Ponemos "self subclassResponsibility" en el mensaje porque necesitamos que la superclase nos sirva de referencia para poder seguir creando subclases que dependan de ella.
Por ejemplo, si crearamos la subclase Complejo, esta tambien tendria que poder responder los mismos mensajes que la superclase. 
A la hora de programar la subclase "Complejo", esto nos va a dar la pauta de todos los mensajes que tendriamos que ver en la subclase Complejo y las modificaciones que tendriamos que hacerle a cada metodo asociado a ella.

**No rompas**

¿Por qué está mal/qué problemas trae romper encapsulamiento?

Romper encapsulamiento esta mal porque se exponen los colaboradores a otros metodos cuando cada uno de ellos deberia ser responsable de sus incumbencias sin tener que mostrar a los otros como estan funcionando los demas métodos. 
De esta manera se obtiene una correcta asignacion de responsabilidades y se respeta la modularidad de la POO.

**Extra**

Removimos los ifs dentro de Fibonacci utilizando polimorfismo.
Para esto creamos subclases de Entero y a su vez usamos un mensaje predefinidio en SmallTalk que nos permitia recorrer cada subclase para poder mandar esa subclase (el tipo) a cada llamado. 
La ventaja cualitativa de esto fue, no solo sacar el codigo repetido que nos generaban los Ifs (ya que lo unico que cambiaba era el tipo de cada subclase) sino que tambien, si en alfun momento necesitamos agregar una nueva subclase, no vamos a tener que agregar un If, esta va a ser recorrida dentro del "subclasses detect" ahorrandonos Ifs, asegurando escalabilidad y mantenibilidad.
