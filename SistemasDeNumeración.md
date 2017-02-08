
## Sistemas de Numeración

En este primer tema de la unidad veremos las propiedades de los sistemas de numeración más importantes para el estudio de la arquitectura de computadoras, en especial los sistemas **binario y hexadecimal**.


## Contando con los dedos

Todos conocemos el método tradicional de contar con los dedos. Como tenemos cinco dedos
en cada mano, podemos contar hasta diez. Pero también podemos utilizar un método diferente 
del tradicional, que resulta ser muy interesante. 

- Con este método, al llegar a 5 con la mano derecha, representamos el 6 **sólo con un dedo 
de la izquierda**. Los dedos de la mano derecha **vuelven a 0**, y seguimos contando
con la derecha. 
- Cada vez que se agotan los dedos de la mano derecha levantamos un nuevo dedo de la izquierda, y la derecha vuelve a 0.  
- Cada dedo en alto de la mano izquierda significa que **se agotó la secuencia de la mano derecha una vez**.

Notemos que este método tiene mayor capacidad que el tradicional, ya que podemos contar hasta
diez y todavía nos queda mucho por contar con los dedos de ambas manos. 

Notemos además que esta ventaja se debe a que el método asigna **valores diferentes** a ambas
manos. La derecha vale la cantidad de dedos que muestre, pero la izquierda vale **seis por
su cantidad de dedos**. Esto se abrevia diciendo que se trata de un **sistema de numeración
posicional**. 

Al tratarse de un sistema posicional, podemos representar números relativamente
grandes con pocos dígitos. En este sistema, disponemos únicamente de **6 dígitos (0, 1, 2,
3, 4, 5)** porque ésos son los que podemos representar con cada mano, es decir, **en cada
posición**. Pero los números representables solamente dependen de cuántas manos (o, mejor 
dicho, de cuántas **posiciones**) podamos utilizar.

Dado un número no negativo que se pueda representar con dos manos, podemos saber qué dedos levantar 
en cada mano haciendo una sencilla cuenta de división entera (sin decimales): dividimos el número por 6 
y tomamos el cociente y el resto.  **El cociente es el número de la izquierda, y el resto, el de la derecha**.

Tomemos por ejemplo el número 15. Al dividir 15 por 6, el cociente es 2 y el resto es 3. En este sistema, 
escribimos el 15 como **dos dedos en la izquierda, y tres dedos en la derecha**, lo que podemos abreviar como **(2,3)**
o directamente **23** (que se pronuncia **dos tres** porque **no quiere decir veintitrés**, sino 
**quince**, sólo que escrito en este sistema).  Como el dígito 2 de la izquierda vale por 6, si hacemos la operación 
de sumar **$2 \times 6 + 3$** obtenemos, efectivamente, 15. 

- ¿Hasta qué número se puede representar en este sistema, sólo con dos manos? 
- Si agregamos una tercera mano, de un amigo, ¿hasta qué número llegamos? 
- Y con cuatro manos, ¿hasta qué número llegamos? 
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

* El **numeral** es lo que escribimos ($15$, **$15_{(10}$** o **$23_{(6}$**). 
* El **número** es la cantidad de la cual estamos hablando (la misma en los tres casos).


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

Veremos algunos casos interesantes de conversiones de base. Serán especialmente importantes los casos donde el número de origen o de destino de la conversión esté en base 10, nuestro sistema habitual, pero también nos dedicaremos a algunas conversiones de base donde ninguna de ellas sea 10.


## Decimal a base $b$

Conversión de base 10 a otras bases## Conversión de base 10 a otras bases

El procedimiento para convertir un número escrito en base 10 a cualquier otra base (llamémosla **base destino**) es siempre el mismo y se basa en la división entera (sin decimales): 

- Dividir el número original por la base destino, anotando cociente y resto
- Mientras se pueda seguir dividiendo:
   - Volver al paso anterior reemplazando el número original por el nuevo cociente

Notemos que cada uno de los restos obtenidos es con toda seguridad **menor que la base destino**, ya que, en otro caso, podríamos haber seguido adelante con la división entera.

Notemos también que el último cociente es también **menor que la base destino**, por el mismo motivo de antes (podríamos haber proseguido la división).

Lo que acabamos de decir garantiza que tanto el último cociente, como todos los restos aparecidos en el proceso, **pueden ser dígitos de un sistema en la base destino** al ser todos menores que ella.

Finalmente, gracias a la Expresión General, escribimos los dígitos de nuestro número convertido usando **el último cociente y todos los restos en orden inverso a como aparecieron**. Ésta es la expresión de nuestro número original en la base destino.

- ¿Cómo podemos usar la Expresión General para explicar por qué este procedimiento es correcto, al menos para el caso de convertir **61 a base 3**?



## De base $b$ a decimal

Conversión de otras bases a base 10## Conversión de otras bases a base 10

La conversión en el sentido opuesto, de una base $b$ cualquiera a base 10, se realiza simplemente aplicando la Expresión General. Cada uno de los dígitos del número original (ahora en base $b$ arbitraria) es el coeficiente de alguna potencia de la base original. Esta potencia depende de la posición de dicho dígito. Una vez que escribimos todos los productos de los dígitos originales por las potencias de la base, hacemos la suma y nos queda el resultado: el número original convertido a base 10.

Es de la mayor importancia cuidar de que las potencias de la base que intervienen en el cálculo estén **ordenadas y completas**. Es fácil si escribimos estas potencias a partir de la derecha, comenzando por la que tiene exponente 0, y vamos completando los términos de derecha a izquierda hasta agotar las posiciones del número original.


## ¿Más preguntas?



## Humor para nerds

## Y más preguntas



## Conversión de $b_1$ a $b_2$

Conversión entre bases arbitrarias## Conversión entre bases arbitrarias

Hemos visto los casos de conversión entre base 10 y otras bases, en ambos sentidos. Ahora veamos los casos donde ninguna de las bases origen o destino son la base 10.

La buena noticia es que, en general, **esto ya sabemos hacerlo**. Si tenemos dos bases $b1$ y $b2$ cualesquiera, ninguna de las cuales es 10, sabiendo hacer las conversiones anteriores podemos hacer la conversión de $b1$ a $b2$ sencillamente haciendo **dos conversiones pasando por la base 10**. Si queremos convertir de $b1$ a $b2$, convertimos primero **de $b1$ a base 10**, aplicando el procedimiento ya visto, y luego **de base 10 a $b2$**. Eso es todo.

Pero en algunos casos especiales podemos aprovechar cierta relación existente entre las bases a convertir: por ejemplo, cuando son **2 y 16**, o **2 y 8**. La base 2 es la del sistema **binario**, y las bases 16 y 8 son las del sistema **hexadecimal** y del sistema **octal** respectivamente. 

En estos casos, como 16 y 8 son potencias de 2 (la otra base), podemos aplicar un truco matemático para hacer la conversión en un solo paso y con muchísima facilidad. Por fortuna son estos casos especiales los que se presentan con mayor frecuencia en nuestra disciplina.



## Equivalencias

Para poder aplicar este truco se necesita la tabla de equivalencias entre los dígitos de los diferentes sistemas. Si no logramos memorizarla, conviene al menos saber reproducirla, asegurándose de saber **contar** en las bases 2, 8 y 16 para reconstruir la tabla si es necesario. Pero con la práctica, se logra memorizarla fácilmente.


## Equivalencias

Notemos que:

- El sistema octal tiene ocho dígitos **(0 ... 7)** y cada uno de ellos se puede representar con **tres dígitos binarios**.


## Equivalencias

Notemos que:

- El sistema hexadecimal tiene dieciséis dígitos **(0 ... F)** y cada uno de ellos se puede representar con **cuatro dígitos binarios**.


## Binario a hexadecimal

Conversión entre sistemas binario y hexadecimal## Conversión entre sistemas binario y hexadecimal

El truco para convertir de base 2 a base 16 consiste simplemente en agrupar los dígitos binarios de a cuatro, y reemplazar cada grupo de cuatro dígitos por su equivalente en base 16 según la tabla anterior.

Si hace falta completar un grupo de cuatro dígitos binarios, se completa con ceros a la izquierda.

Si el problema es convertir, inversamente, de base 16 a base 2, de igual forma reemplazamos cada dígito hexadecimal por los cuatro dígitos binarios que lo representan.


## Binario a octal

Conversión entre sistemas binario y octal## Conversión entre sistemas binario y octal

El problema de convertir entre bases 2 y 8 es igual de sencillo. Basta con reemplazar cada grupo de **tres** dígitos binarios (completando con ceros a la izquierda si hace falta) por el dígito octal equivalente. Lo mismo si la conversión es en el otro sentido.


## Y más preguntas

## Y hasta un jueguito
