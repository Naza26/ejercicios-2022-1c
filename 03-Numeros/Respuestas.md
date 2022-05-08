**Respuestas**

**Aporte de los mensajes de DD**

En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

En double dispatch, el primer llamado determina con que tipo de objeto estamos trabajando, es decir si tenemos "one + one", el mensaje + es polimorfico porque hasta que no se le asigna un objeto puede actuar como Fraccion o Entero. El segundo llamado determina de que manera se va a colaborar con el objeto previo. Notamos que, vamos a tener cuatro mensajes polimorficos, ellos van a representar los distintos tipos de operaciones y convinatorias entre enteros y fracciones. Ejemplo:

  1 + 2 —> beAddedToAnInt —> anAdder = Entero

  1 + 2/5 —> beAddedToAnInt —> anAdder = Fraccion

  1/5 + 2 —> beAddedToAFraction —> anAdder = Entero

  1/5 + 3/5 —> beAddedToAFraction —> anAdder = Fraccion

**Lógica de instanciado**

Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

Con lo visto y sabido hasta ahora nos parece mejor a la hora de crear un objeto tener mensajes de clase que sepan crear el objeto con caracteristicas ya definidas, es decir, el objeto no se cree vacio. No nos parece correcto tener mensajes de instacias que inicialicen al objeto una vez creado, ya que la heuristica que estamos siguiendo en la materia nos indica que es una buena practica crear a un objeto con valores.

**Nombres de las categorías de métodos**

Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Con lo vimos y trabajamos hasta ahora categorizamos los metodos como privados, ya que no se debe conocer el como de un metodo si no el que. Los detalles de implementacion deberian ser privados hasta que necesiten ser modificados.

**Subclass Responsibility**

Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Ponemos el mensaje "self subclassResponsibility" porque necesitamos que la superclase nos sirva de referencia para poder seguir creando subclases que dependan de ella, es decir, si creamos la subclase Complejo, esta tambien tiene que poder responder los mismos mensajes que la superclase.

**No rompas**

¿Por qué está mal/qué problemas trae romper encapsulamiento?

Romper encapsulamiento esta mal porque se exponen los colaboradores a otros metodos cuando cada uno de ellos deberia ser responsable de sus incumbencias, sin tener que mostrar a los otros como estan funcionando los demas metodos. De esta manera se obtiene una correcta asignacion de responsabilidades y se respeta la modularidad de la POO.
