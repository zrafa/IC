
# Sistemas de Numeración


En este primer tema de la unidad veremos las propiedades de los sistemas de numeración más importantes para el estudio de la arquitectura de computadoras, en especial los sistemas **binario y hexadecimal**.


## Un sistema diferente
Todos conocemos el método tradicional de contar con los dedos. Como tenemos cinco dedos
en cada mano, podemos contar hasta diez. Pero también podemos utilizar un método diferente 
del tradicional, que resulta ser muy interesante. 

- Con este método, al llegar a 5 con la mano derecha, representamos el 6 **sólo con un dedo 
de la izquierda**. Los dedos de la mano derecha **vuelven a 0**, y seguimos contando
con la derecha. 
- Cada vez que se agotan los dedos de la mano derecha levantamos un nuevo dedo de la izquierda, y la derecha vuelve a 0.
- Cada dedo en alto de la mano izquierda significa que **se agotó la secuencia de la mano derecha una vez**.

### Preguntas
- ¿Hasta qué número se puede representar en este sistema, sólo con dos manos? 
- Si agregamos una tercera mano, de un amigo, ¿hasta qué número llegamos? 
- ¿Y cómo se representa el 36? ¿Y el 37?
- Y con cuatro manos, ¿hasta qué número llegamos? 
- Y, si el número no se puede representar con dos manos, ¿cómo es el procedimiento para saber qué dedos levantar?


Notemos que este método tiene mayor capacidad que el tradicional, ya que podemos contar hasta
diez y todavía nos queda mucho por contar con los dedos de ambas manos. 

## Sistema posicional

Notemos además que esta ventaja se debe a que el método asigna **valores diferentes** a ambas
manos. La derecha vale la cantidad de dedos que muestre, pero la izquierda vale **seis por
su cantidad de dedos**. Esto se abrevia diciendo que se trata de un **sistema de numeración
posicional**. 

Al tratarse de un sistema posicional, podemos representar números relativamente
grandes con pocos dígitos. En este sistema, disponemos únicamente de **6 dígitos (0, 1, 2,
3, 4, 5)** porque ésos son los que podemos representar con cada mano, es decir, **en cada
posición**. Pero los números representables solamente dependen de cuántas manos (o, mejor 
dicho, de cuántas **posiciones**) podamos utilizar.

### Calculando cada posición

En este sistema, dado un número no negativo que se pueda representar con dos manos, podemos saber qué dedos levantar 
en cada mano haciendo una sencilla cuenta de división entera (sin decimales): dividimos el número por 6 
y tomamos el cociente y el resto.  **El cociente es el número de la izquierda, y el resto, el de la derecha**.

Tomemos por ejemplo el número 15. Al dividir 15 por 6, el cociente es 2 y el resto es 3. En este sistema, 
escribimos el 15 como **dos dedos en la izquierda, y tres dedos en la derecha**, lo que podemos abreviar como **(2,3)**
o directamente **23** (que se pronuncia **dos tres** porque **no quiere decir veintitrés**, sino 
**quince**, sólo que escrito en este sistema).  Como el dígito 2 de la izquierda vale por 6, si hacemos la operación 
de sumar **$2 \times 6 + 3$** obtenemos, efectivamente, 15. 


### Base de un sistema de numeración

La **base** de un sistema es la cantidad de dígitos de que dispone, o sea que
el sistema decimal habitual es de base 10, mientras que el de los deditos es de base 6. 

### Número y numeral

Notemos que un mismo número puede escribirse de muchas maneras: en prácticamente cualquier base que 
se nos ocurra, sin necesidad de contar con los dedos; y que la forma habitual, en base 10, no es más
importante o mejor que las otras (salvo, claro, que ya estamos acostumbrados a ella). Otras culturas han desarrollado
otros sistemas de numeración y escriben los números de otra manera. 

Esto muestra que hay una **diferencia entre
número y numeral**, diferencia que es algo difícil de ver debido a la costumbre de identificar a los números con su
representación en decimal. 

* El **numeral** es lo que escribimos ($15$, **$15_{(10}$** o **$23_{(6}$**). 
* El **número** es la cantidad de la cual estamos hablando (la misma en los tres casos).

### Indicando la base

Anteriormente escribíamos **15** en el sistema de base 6 como **23**. Sin embargo, necesitamos evitar la confusión entre ambos significados de **23**. Para esto usamos índices subscriptos que indican la base. Así, 

- **Quince** es **$15_{(10}$** porque está en base diez (la del sistema decimal, habitual), y 
- **$23_{(10}$** es **veintitrés**, 
- pero **$23_{(6}$** es **dos tres en base 6**, y por lo tanto vale **quince**.

Como 10 es nuestra base habitual, cuando no usemos índice subscripto estaremos sobreentendiendo que hablamos **en base 10**. Es decir, **$15_{(10}$** se puede escribir, simplemente, **$15$**.

Cuando queremos pasar un número escrito en una base a un sistema con otra cantidad de dígitos, 
el procedimiento de averiguar los dígitos que van en cada posición
se llama **conversión de base**. Más adelante veremos procedimientos de conversión de base para cualquier caso que aparezca.




## Sistema decimal
Si reflexionamos sobre el sistema decimal, de diez dígitos, encontramos que 
también forma un sistema posicional, 
sólo que con 10 dígitos en lugar de los seis del sistema anterior. 

Cuando escribimos **15** en el sistema decimal, esta expresión equivale a decir "para saber de qué cantidad estoy hablando,
tome el 1 y multiplíquelo por 10, y luego sume el 5".

Si el número (o, mejor dicho, el **numeral**) tiene más dígitos, esos dígitos van multiplicados por **potencias de 10** que van creciendo hacia la izquierda. La cifra de las unidades está multiplicada por la potencia de 10 de exponente 0 (es decir, por $10^0$, que es igual a 1).

Esto se cumple para todos los sistemas posicionales, sólo que con potencias **de la base correspondiente**.


## Sistema binario
Comprender y manejar la notación en sistema binario es sumamente importante para el estudio de la computación. El sistema binario comprende únicamente dos dígitos, **0 y 1**. 

Igual que ocurre con el sistema decimal, los numerales se escriben como suma de dígitos del sistema multiplicados por potencias de la base. En este sistema, cada 1 en una posición indica que sumamos una potencia de 2. Esa potencia de 2 es $2^n$, donde $n$ es la posición, y las posiciones se cuentan desde 0. 

Por ejemplo, 

$$10 = 1\times8 + 0\times4 + 1\times2 + 0\times1 = 1010_{(2}$$  

y 

$$15 = 1\times8 + 1\times4 + 1\times2 + 1\times1 = 1111_{(2}$$  

### Trucos para conversión rápida

Las computadoras digitales, tal como las conocemos hoy, almacenan todos sus datos en forma de números binarios. Es **muy recomendable**, para la práctica de esta materia, adquirir velocidad y seguridad en la conversión de y a sistema binario. 

Una manera de facilitar esto es memorizar los valores de algunas potencias iniciales de la base 2:

$2^7$ ||| $2^6$ ||| $2^5$ ||| $2^4$ ||| $2^3$ ||| $2^2$ ||| $2^1$ ||| $2^0$ 
 ----:||| ----:||| ----:||| ----:||| ----:||| ----:||| ----:||| ---:
$128$ ||| $64$ ||| $32$ ||| $16$ ||| $8$ ||| $4$ ||| $2$ ||| $1$ 

¿Qué utilidad tiene memorizar esta tabla? Que nos permite convertir mentalmente algunos casos simples de números en sistema decimal, a base 2.
Por ejemplo, el número **40** equivale a **32 + 8**, que son ambas potencias de 2. Luego, la expresión de 40 en sistema binario será **101000**.

Otro truco interesante consiste en ver que si un numeral está en base 2, **multiplicarlo por 2 equivale a desplazar un lugar a la izquierda todos sus dígitos, completando con un 0 al final**. Así, si sabemos que $40_{(10} = 101000_{(2}$, ¿cómo escribimos rápidamente **80**, que es $40\times2$? Tomamos la expresión de 40 en base 2 y la desplazamos a la izquierda agregando un 0: $1010000_{(2} = 80_{(10}$.

De todas maneras, estos no son más que trucos que pueden servir en no todos los casos. Más adelante veremos el procedimiento de conversión general correcto.



**Preguntas**

- ¿Cuál es el truco para calcular rápidamente la expresión binaria de 20, si conocemos la de 40?
- ¿Cómo calculamos la de 40, si conocemos la de 10?
- ¿Cómo podemos expresar estas reglas en forma general?


## Sistema hexadecimal
Otro sistema de numeración importante es el hexadecimal o de base 16. En este sistema tenemos **más dígitos** que en el decimal, por lo cual tenemos que recurrir a "dígitos" nuevos, tomados del alfabeto. Así, A representa el 10, B el 11, etc.

El sistema hexadecimal nos resultará útil porque con él podremos expresar fácilmente números que llevarían muchos dígitos en sistema binario. 

- La conversión entre binarios y hexadecimales es sumamente directa.
- Al ser un sistema con más dígitos que el binario, la expresión de cualquier número será más corta.






## Una expresión general
Como hemos visto intuitivamente en el sistema de contar con los dedos, y como hemos confirmado repasando los sistemas decimal, binario y hexadecimal, los sistemas posicionales tienen una cosa muy importante en común: las cifras de un **numeral** escrito en cualquier base no son otra cosa que los **factores por los cuales hay que multiplicar las sucesivas potencias de la base** para saber a qué **número** nos estamos refiriendo.

Por ejemplo, el numeral **2017** escrito en base 10 no es otra cosa que la suma de:

$$2 \times 1000 + 0 \times 100 + 1 \times 10 + 7 \times 1 = $$ 
$$2 \times 10^3 + 0 \times 10^2 + 1 \times 10^1 + 7 \times 10^0$$ 

Los dígitos 2, 0, 1 y 7 multiplican, respectivamente, a $10^3$, $10^2$, $10^1$ y $10^0$, que son potencias de la base 10. Este **numeral** designa al **número** 2017 porque esta cuenta, efectivamente, da **2017**.

Sin embargo, si el número está expresado en otra base, la cuenta debe hacerse con potencias de esa otra base. Si hablamos de $2017_{(8}$, entonces las cifras 2, 0, 1 y 7 multiplican a $8^3$, $8^2$, $8^1$ y $8^0$. Este **numeral** designa al **número** 1039 porque esta cuenta, efectivamente, da **1039**.



Este análisis permite enunciar una ley o expresión general que indica cómo se escribe un número $n$ cualquiera, no negativo, en una base $b$:
$$n = x_{k} \times b^k + \ldots + x_{2} \times b^{2} + x_1 \times b^1 +x_{0} \times b^0$$

Esta ecuación puede escribirse más sintéticamente en notación de sumatoria como:

$$n = \sum_{i=0}^{k}{x_i \times b^i}$$

En estas ecuaciones (que son equivalentes): 

- Los números $x_i$ son las cifras del numeral.
- Los números $b^i$ son potencias de la base, cuyos exponentes crecen de derecha a izquierda y comienzan por 0.
- Las potencias están **ordenadas y completas**, y son tantas como las cifras del numeral. 
- Los números $x_i$ son necesariamente **menores que $b$**, ya que son dígitos en un sistema de numeración que tiene $b$ dígitos.
 




## Conversión de base
Veremos algunos casos interesantes de conversiones de base. Serán especialmente importantes los casos donde el número de origen o de destino de la conversión esté en base 10, nuestro sistema habitual, pero también nos dedicaremos a algunas conversiones de base donde ninguna de ellas sea 10.


###  Conversión de base 10 a otras bases

El procedimiento para convertir un número escrito en base 10 a cualquier otra base (llamémosla **base destino**) es siempre el mismo y se basa en la división entera (sin decimales): 

- Dividir el número original por la base destino, anotando cociente y resto
- Mientras se pueda seguir dividiendo:
    - Volver al paso anterior reemplazando el número original por el nuevo cociente
- Finalmente escribimos los dígitos de nuestro número convertido usando **el último cociente y todos los restos en orden inverso a como aparecieron**. 

Ésta es la expresión de nuestro número original en la base destino.

- Notemos que cada uno de los restos obtenidos es con toda seguridad **menor que la base destino**, ya que, en otro caso, podríamos haber seguido adelante con la división entera.
- Notemos también que el último cociente es también **menor que la base destino**, por el mismo motivo de antes (podríamos haber proseguido la división).
- Lo que acabamos de decir garantiza que tanto el último cociente, como todos los restos aparecidos en el proceso, **pueden ser dígitos de un sistema en la base destino** al ser todos menores que ella.


**Pregunta**

¿Cómo podemos usar la Expresión General para explicar por qué este procedimiento es correcto, al menos para el caso de convertir **61 a base 3**?



###  Conversión de otras bases a base 10

La conversión en el sentido opuesto, de una base $b$ cualquiera a base 10, se realiza simplemente aplicando la Expresión General. Cada uno de los dígitos del número original (ahora en base $b$ arbitraria) es el coeficiente de alguna potencia de la base original. Esta potencia depende de la posición de dicho dígito. Una vez que escribimos todos los productos de los dígitos originales por las potencias de la base, hacemos la suma y nos queda el resultado: el número original convertido a base 10.

Es de la mayor importancia cuidar de que las potencias de la base que intervienen en el cálculo estén **ordenadas y completas**. Es fácil si escribimos estas potencias a partir de la derecha, comenzando por la que tiene exponente 0, y vamos completando los términos de derecha a izquierda hasta agotar las posiciones del número original.




## Preguntas
¿Cómo sería un sistema de **contar con los dedos en base 2**? Dedo arriba = 1, dedo abajo = 0...

- ¿Cómo hacemos el 1, el 2, el 3...?
- ¿Hasta qué número podemos contar con una mano? ¿Y con dos manos?
- ¿Y cómo se indica el **4** en este sistema?




## Conversión entre bases arbitrarias

Hemos visto los casos de conversión entre base 10 y otras bases, en ambos sentidos. Ahora veamos los casos donde ninguna de las bases origen o destino son la base 10.

La buena noticia es que, en general, **esto ya sabemos hacerlo**. Si tenemos dos bases $b_1$ y $b_2$ cualesquiera, ninguna de las cuales es 10, sabiendo hacer las conversiones anteriores podemos hacer la conversión de $b_1$ a $b_2$ sencillamente haciendo **dos conversiones pasando por la base 10**. Si queremos convertir de $b_1$ a $b_2$, convertimos primero **de $b_1$ a base 10**, aplicando el procedimiento ya visto, y luego **de base 10 a $b_2$**. Eso es todo.

Pero en algunos casos especiales podemos aprovechar cierta relación existente entre las bases a convertir: por ejemplo, cuando son **2 y 16**, o **2 y 8**. La base 2 es la del sistema **binario**, y las bases 16 y 8 son las del sistema **hexadecimal** y del sistema **octal** respectivamente. 

En estos casos, como 16 y 8 son potencias de 2 (la otra base), podemos aplicar un truco matemático para hacer la conversión en un solo paso y con muchísima facilidad. Por fortuna son estos casos especiales los que se presentan con mayor frecuencia en nuestra disciplina.



## Equivalencias entre sistemas
Para poder aplicar este truco se necesita la tabla de equivalencias entre los dígitos de los diferentes sistemas. Si no logramos memorizarla, conviene al menos saber reproducirla, asegurándose de saber **contar** en las bases 2, 8 y 16 para reconstruir la tabla si es necesario. Pero con la práctica, se logra memorizarla fácilmente.


Notemos que:

- El sistema octal tiene ocho dígitos **(0 ... 7)** y cada uno de ellos se puede representar con **tres dígitos binarios**:
  	- 000
  	- 001
  	- 010
  	- 011
  	- 100
  	- 101
  	- 110
  	- 111


Notemos que:

- El sistema hexadecimal tiene dieciséis dígitos **(0 ... F)** y cada uno de ellos se puede representar con **cuatro dígitos binarios**:
  	- 0000
  	- 0001
  	- 0010
  	- 0011
  	- 0100
  	- 0101
  	- 0110
  	- 0111
  	- 1000
  	- 1001
  	- 1010
  	- 1011
  	- 1100
  	- 1101
  	- 1110
  	- 1111



###  Conversión entre sistemas binario y hexadecimal

El truco para convertir de base 2 a base 16 consiste simplemente en agrupar los dígitos binarios de a cuatro, y reemplazar cada grupo de cuatro dígitos por su equivalente en base 16 según la tabla anterior.

Si hace falta completar un grupo de cuatro dígitos binarios, se completa con ceros a la izquierda.

Si el problema es convertir, inversamente, de base 16 a base 2, de igual forma reemplazamos cada dígito hexadecimal por los cuatro dígitos binarios que lo representan.


###  Conversión entre sistemas binario y octal

El problema de convertir entre bases 2 y 8 es igual de sencillo. Basta con reemplazar cada grupo de **tres** dígitos binarios (completando con ceros a la izquierda si hace falta) por el dígito octal equivalente. Lo mismo si la conversión es en el otro sentido.





