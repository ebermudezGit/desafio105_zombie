# Zombies
## Descripción
El ejercicio consiste en crear un juego en donde un grupo de zombies ‘persigue’ aun grupo de personas Los zombies y las personas tienen un nombre y una posición inicial de X e Y. Los zombies caminan y las personas corren, cuando un zombie esta cercano a una persona, hay que alertar a la persona. Si el zombie esta junto a una persona o en el mismo punto que una persona, la persona muere y se convierte en zombie.

El juego termina cuando todas las personas se han convertido en zombie.

## Estructura
Crearemos 2 clases, en archivos distintos para cada una de ellas.

1. Clase Zombie:
* Se debe inicializar con un nombre y posición X e Y. Si no se le pasa la posición X ó Y estas deben ser aleatorias (del uno al 10).
* Debe tener un método que haga ‘caminar’ al zombie, puede avanzar hacia adelante o hacia atrás, y puede moverse diagonalmente, todo esto de forma aleatoria. Solo se mueve un espacio.
* Debe tener un método que haga hablar al zombie y decir ‘BRAINNSS!!!’ al estar cerca de una persona.
* Debe tener un método que nos muestre el nombre y la posición del zombie, usando interpolación de variables, al imprimir (puts) al
zombie y no la información del objeto.

2. Clase Persona:

* Se debe inicializar con un nombre y posición X e Y. Si no se le pasa la posición X ó Y estas deben ser aleatorias (del uno al 10).
* Debe tener un método que haga ‘correr’ a la persona, puede avanzar hacia adelante o hacia atrás, y puede moverse diagonalmente,todo esto de forma aleatoria. Se mueve dos espacios.
* Debe tener un método que haga gritar a la persona esta en peligro.
* Debe tener un método que nos muestre el nombre y la posición de la persona, usando interpolación de variables, al imprimir (puts) a la persona y no la información del objeto.
* Debe tener un método que le avise que esta en peligro si hay zombies cerca. Un zombie esta cerca cuando esta a una distancia de 3 espacios de una persona).
* Debe tener un método donde muere y se convierte en zombie. (Una persona muere y se convierte en zombie cuando el zombie esta a una distancia de 1 espacio o en la misma posición de una persona)

## Juego
Se debe crear un archivo nuevo para ejecutar el juego, y este debe requerir los archivos de las clases para poder usarlas.
1. Crear un arreglo de X zombies
2. Crear un arreglo de X personas
3. Mostrar la cantidad de personas y zombies antes de empezar el juego
4. Hacer que las personas y zombies se muevan hasta que ya no queden personas.
* Los zombies caminan.
* Las personas corren.
* Por cada persona, comprobar si esta en peligro y si se ha convertido en zombie.
* Si se convirtió en zombie, quitarlo del arreglo de personas y crear un nuevo zombie con el nombre de la persona muerta.

## Desafio
1. Crear una clase Perro que tenga una posición X e Y inicial aleatoria y que se mueva 2 espacios. Cuando el perro esta cerca de un zombie, el perro mata al zombie.
2. Crear una clase arma, esta debe tener una posición X e Y inicial aleatoria, el arma no se mueve. Cuando una persona cae en la posición de un arma la recoge, y si al momento de ser ‘atacado’ por un zombie la persona tiene un arma, la persona mata al zombie.
