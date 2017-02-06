
## Sistemas de Numeración

En este primer tema de la unidad veremos las propiedades de los sistemas de numeración más importantes para el estudio de la arquitectura de computadoras, en especial los sistemas **binario y hexadecimal**.


## Contando con los dedos

Todos conocemos el método tradicional de contar con los dedos. Como tenemos cinco dedos
en cada mano, podemos contar hasta diez. Pero también podemos utilizar un método diferente 
del tradicional, que resulta ser muy interesante. 

Con este método, al llegar a 5 con la mano derecha, representamos el 6 **sólo con un dedo 
de la izquierda**. Los dedos de la mano derecha **vuelven a 0**, y seguimos contando
con la derecha. 

Cada vez que se agotan los dedos de la mano derecha levantamos un nuevo dedo de la izquierda,
y la derecha vuelve a 0.  Cada dedo en alto de la mano izquierda significa que se agotó la secuencia de la mano 
derecha una vez. 

Notemos que este método tiene mayor capacidad que el tradicional, ya que podemos contar hasta
diez y todavía nos queda mucho por contar con los dedos de ambas manos. 

Notemos además que esta ventaja se debe a que el método asigna **valores diferentes** a ambas
manos. La derecha vale la cantidad de dedos que muestre, pero la izquierda vale **seis por
su cantidad de dedos**. Esto se abrevia diciendo que se trata de un **sistema de numeración
posicional**. Por otra parte, al ser posicional, podemos representar números relativamente
grandes con pocos dígitos. En este sistema, disponemos únicamente de **6 dígitos (0, 1, 2,
3, 4, 5)** porque ésos son los que podemos representar con cada mano, es decir, **en cada
posición**. Pero los números representables solamente dependen de cuántas manos (o, mejor 
dicho, de cuántas **posiciones**) podamos utilizar.

Dado un número no negativo que se pueda representar con dos manos, podemos saber qué dedos levantar 
en cada mano haciendo una sencilla cuenta de división entera (sin decimales): dividimos el número por 6 
y tomamos el cociente y el resto.  **El cociente es el número de la izquierda, y el resto, el de la derecha**.

Tomemos por ejemplo el número 15. Al dividir 15 por 6, el cociente es 2 y el resto es 3. En este sistema, 
escribimos el 15 como **dos dedos en la izquierda, y tres dedos en la derecha**, lo que podemos abreviar como **2,3**
o directamente **23** (que se pronuncia **dos tres** porque **no quiere decir veintitrés**, sino 
**quince**, sólo que escrito en este sistema).  Como el dígito 2 de la izquierda vale por 6, si hacemos la operación 
de sumar **$2 \times 6 + 3$** obtenemos, efectivamente, 15. 

- ¿Hasta qué número se puede representar en este sistema, sólo con dos manos? 
- Si agregamos una tercera mano, de un amigo, ¿hasta qué número llegamos? 
- ¿Y cómo se representa el 36? ¿Y el 37?
- Y, si el número no se puede representar con dos manos, ¿cómo es el procedimiento para saber qué
dedos levantar?



## Sistema posicional

## Sistema posicional

## Sistema decimal

Si reflexionamos sobre el sistema decimal, de diez dígitos, encontramos que las cifras de las decenas
y de las unidades (y de las centenas, y de las unidades de mil, etc.) también forman un sistema posicional, 
sólo que con 10 dígitos en lugar de los seis del sistema anterior. 
Cuando escribimos **15** en el sistema decimal, esta expresión equivale a decir "para saber de qué cantidad estoy hablando,
tome el 1 y multiplíquelo por 10, y luego sume el 5".

Cuando queremos pasar esa expresión a un sistema con otra cantidad de dígitos, 
el procedimiento de averiguar los dígitos que van en cada posición
se llama **conversión de base**. La **base** de un sistema es la cantidad de dígitos de que dispone, o sea que
el sistema decimal habitual es de base 10, mientras que el de los deditos es de base 6. 

Anteriormente escribíamos **15** en el sistema de base 6 como **23**. Sin embargo, necesitamos evitar la confusión 
entre ambos significados de **23**. Para esto usamos índices subscriptos que indican la base. Así, **quince** es
**$15_{(10}$** porque está en base diez (la del sistema decimal, habitual) y **$23_{(10}$** es **veintitrés**, pero 
**$23_{(6}$** es **dos tres en base 6**, y por lo tanto vale **quince**. Como 10 es nuestra base habitual, cuando 
no usemos índice subscripto estaremos sobreentendiendo que hablamos **en base 10**, Es decir, **$15_{(10}$** se
puede escribir, simplemente, **$15$**.

Notemos, de paso, que un mismo número puede escribirse de muchas maneras: en prácticamente cualquier base que 
se nos ocurra, sin necesidad de contar con los dedos; y que la forma habitual, en base 10, no es más
importante o mejor que las otras (salvo, claro, que ya estamos acostumbrados a ella). Otras culturas han desarrollado
otros sistemas de numeración y escriben los números de otra manera. Esto muestra que hay una **diferencia entre
número y numeral**, diferencia que es algo difícil de ver debido a la costumbre de identificar a los números con su
representación en decimal. 
- El **numeral** es lo que escribimos ($15$, **$15_{(10}$** o **$23_{(6}$**). 
- El **número** es la cantidad de la cual estamos hablando (la misma en los tres casos).


## Sistema binario

Comprender y manejar la notación en sistema binario es sumamente importante para el estudio de la computación. El sistema binario comprende únicamente dos dígitos, **0 y 1**. 

Las computadoras digitales, tal como las conocemos hoy, almacenan todos sus datos en forma de números binarios. Es **muy recomendable**, para la práctica de esta materia, adquirir velocidad y seguridad en la conversión de y a sistema binario.


## Sistema hexadecimal

Otro sistema de numeración importante es el hexadecimal o de base 16. En este sistema tenemos **más dígitos** que en el decimal, por lo cual tenemos que recurrir a "dígitos" nuevos, tomados del alfabeto. Así, A representa el 10, B el 11, etc.

El sistema hexadecimal nos resultará útil porque con él podremos expresar fácilmente números que llevarían muchos dígitos en sistema binario. 
- La conversión entre binarios y hexadecimales es sumamente directa.
- Al ser un sistema con más dígitos que el binario, la expresión de cualquier número será más corta.


## Especificando la base





## ¿Preguntas?



## ¡Preguntas!



## Preguntas



## Expresión general



## Expresión general



## Conversión de base



## De decimal a base $b$



## Decimal a base $b$



## De base $b$ a decimal



## ¿Más preguntas?



## Humor para nerds

## Humor para nerds



## Humor para nerds



## ¡Más preguntas!



## Y más preguntas



## Conversión de base $b_1$ a base $b_2$



## Equivalencias



## Equivalencias



## Equivalencias



## Binario a hexadecimal



## Binario a octal



## Y más preguntas
