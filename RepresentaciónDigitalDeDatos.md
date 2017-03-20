
Veremos de qué manera puede ser tratada mediante computadoras la información correspondiente a números, textos, imágenes y otros datos. Necesitaremos conocer las formas de representación de datos, y comenzaremos por los datos numéricos.


###Representación de datos numéricos

Hemos visto ejemplos de sistemas de numeración: en base 6, en base 10, o decimal, en base 2, o binario, en base 16, o hexadecimal, y en base 8, u octal; y sabemos convertir la representación de un número en cada una de estas bases, a los sistemas en las demás bases. Sin embargo, aún nos falta considerar la representación numérica de varios casos importantes:  

- Hemos utilizado estos sistemas para representar únicamente números **enteros**. Nos falta ver de qué manera representar números racionales, es decir aquellos que tienen una parte fraccionaria (los "decimales").
- Además estos enteros han sido siempre **no negativos**, es decir, sabemos representar únicamente el 0 y los naturales. Nos falta considerar los negativos.
- Por otra parte, no nos hemos planteado el problema de la **cantidad de dígitos**. Idealmente, un sistema de numeración puede usar infinitos dígitos para representar números arbitrariamente grandes. Si bien esto es matemáticamente correcto, las computadoras son objetos físicos que tienen unas ciertas limitaciones, y con ellas no es posible representar números de infinita cantidad de dígitos. 

En esta parte de la unidad mostraremos sistemas de representación utilizados en computación que permiten tratar estos problemas.


##Clasificación de los números
Es conveniente repasar la clasificación de los diferentes conjuntos de números y conocer las diferencias importantes entre éstos. Los títulos en el cuadro (tomado de Wikipedia) son referencias a los artículos enciclopédicos sobre cada uno de esos conjuntos.

- [Números complejos](https://es.m.wikipedia.org/wiki/N%C3%BAmero_complejo)
- [Complejos](https://es.m.wikipedia.org/wiki/N%C3%BAmero_complejo)
- [Reales](https://es.m.wikipedia.org/wiki/N%C3%BAmero_real)
- [Racionales](https://es.m.wikipedia.org/wiki/N%C3%BAmero_racional)
- [Enteros](https://es.m.wikipedia.org/wiki/N%C3%BAmero_entero)
- [Naturales](https://es.m.wikipedia.org/wiki/N%C3%BAmero_natural)
- [Uno](https://es.m.wikipedia.org/wiki/Uno)
- [Naturales primos](https://es.m.wikipedia.org/wiki/N%C3%BAmero_primo)
- [Naturales compuestos](https://es.m.wikipedia.org/wiki/N%C3%BAmero_compuesto)
- [Cero](https://es.m.wikipedia.org/wiki/Cero)
- [Enteros negativos](https://es.m.wikipedia.org/wiki/Entero_negativo)
- [Fraccionarios](https://es.m.wikipedia.org/wiki/N%C3%BAmero_fraccionario)
- [Fracción propia](https://es.m.wikipedia.org/wiki/Fracci%C3%B3n_propia)
- [Fracción impropia](https://es.m.wikipedia.org/wiki/Fracci%C3%B3n_impropia)
- [Irracionales](https://es.m.wikipedia.org/wiki/N%C3%BAmero_irracional)
- [Irracionales algebraicos](https://es.m.wikipedia.org/wiki/N%C3%BAmero_algebraico)
- [Trascendentes](https://es.m.wikipedia.org/wiki/N%C3%BAmero_trascendente)
- [Imaginarios](https://es.m.wikipedia.org/wiki/N%C3%BAmero_imaginario)

**Preguntas**

- El **cero**, ¿es un natural?
- ¿Existen números naturales negativos? ¿Y racionales negativos?
- ¿Es correcto decir que un racional tiene una parte decimal que es, o bien finita, o bien periódica?
- ¿Puede haber dos expresiones diferentes para el mismo número, en el mismo sistema de numeración decimal?
- El número 0.9999... con 9 periódico, y el número 1, ¿son dos números diferentes o el mismo número? Si son diferentes, ¿qué número se encuentra entre ellos dos?
- El número 1 es a la vez natural y entero. ¿Por qué no puede haber un número que sea a la vez racional e irracional?
- ¿Por qué jamás podremos computar la sucesión completa de decimales de $\pi$?


###Datos enteros

Veremos tres sistemas de representación de datos numéricos enteros, llamados **signo-magnitud**, **complemento a 2** y **exceso a $2^{n-1}$**.

###Datos fraccionarios

Para representar fraccionarios consideraremos los sistemas de **punto fijo** y **punto flotante**.


###Rango de representación

Cada sistema de representación de datos numéricos tiene su propio **rango de representación** (que podemos abreviar **RR**), o intervalo de números representables. Nungún número fuera de este rango puede ser representado en dicho sistema. Conocer este intervalo es importante para saber con qué limitaciones puede enfrentarse un programa que utilice alguno de esos sistemas.

El rango de los números representados bajo un sistema está dado por sus **límites inferior y superior**, que definen qué zona de la recta numérica puede ser representada.  Como ocurre con todo intervalo numérico, el rango de representación puede ser escrito como $[a, b]$, donde $a$ y $b$ son sus límites inferior y superior, respectivamente. 

Por la forma en que están diseñados, algunos sistemas de representación sólo pueden representar números muy pequeños, o sólo positivos, o tanto negativos como positivos.  En general, el RR **será más grande cuantos más dígitos binarios**, o bits, tenga el sistema. Sin embargo, el RR depende también de la forma como el sistema **utilice** esos dígitos binarios, ya que un sistema puede ser más o menos **eficiente** que otro en el uso de esos dígitos, aunque la cantidad de dígitos sea la misma en ambos sistemas.

Por lo tanto, decimos que el rango de representación depende a la vez de la **cantidad de dígitos** y de la **forma de funcionamiento** del sistema de representación. 


###Representación sin signo

Consideremos primero qué ocurre cuando queremos representar números enteros **no negativos** (es decir, **positivos o cero**) sobre una cantidad fija de bits. Simplemente usamos el sistema binario de numeración, tal como lo conocemos, pero limitándonos a una cantidad fija de bits o dígitos binarios. ¿Cuál será el rango de representación?

El **cero** siempre puede representarse (es decir, el límite inferior del rango de representación será 0). Pero ¿cuál será el límite superior? Es decir, si la cantidad de dígitos binarios en este sistema es $k$, ¿cuál es el número más grande que podremos representar? 

Podemos estudiarlo de dos maneras.

**1. Usando combinatoria**

Contemos cuántos números diferentes podemos escribir con $k$ dígitos binarios. Imaginemos un número binario cualquiera con $k$ dígitos. El dígito de más a la derecha tiene únicamente dos posibilidades (0 o 1). Por cada una de éstas hay nuevamente dos posibilidades para el siguiente hacia la izquierda (lo que da las cuatro posibilidades 00, 01, 10, 11). Por cada una de éstas, hay dos posibilidades para el siguiente (dando las ocho posibilidades 000, 001, 010, 011, 100, 101, 110, 111), etc., y así hasta la posición $k$. No hay más posibilidades. Como hemos multiplicado 2 por sí mismo $k$ veces, la cantidad de números que se pueden escribir es $2^k$. Luego, el número más grande posible es $2^k - 1$. (**Pregunta**: ¿Por qué $2^k - 1$ y no $2^k$?).

**2. Usando álgebra**

El número más grande que podemos representar en un sistema sin signo a $k$ dígitos es, seguramente, aquel donde todos los $k$ dígitos valen **1**. La Expresión General que hemos visto nos dice que si un número $n$ está escrito en base 2, **con $k$ dígitos**, entonces 
$$n = x_{k-1}\times 2^{k-1} + ... + x_1\times2^1+x_0\times2^0$$ 
y, si queremos escribir el más grande de todos, deberán ser todos los $x_i$ iguales a 1. (**Pregunta**: ¿Por qué si el número $n$ tiene $k$ dígitos binarios, el índice del más significativo es $k-1$ y no $k$?)

Esta suma vale entonces 

$$ x_{k-1}\times 2^{k-1} + ... + x_1\times2^1+x_0\times2^0 = $$ 
$$  = 1\times 2^{k-1} + ... + 1\times2^1+1\times2^0 = $$ 
$$  = 2^{k-1} + ... + 2^1+2^0 = $$ 
$$  = 2^{k}-1 $$ 

Usando ambos argumentos hemos llegado a que el número más grande que podemos representar con $k$ dígitos binarios es $2^k-1$. Por lo tanto, **el rango de representación de un sistema sin signo a $k$ dígitos es $[0, 2^k - 1]$**. Todos los números representables en esta clase de sistemas son **positivos o cero**.

**Ejemplos**

- Para un sistema de representación sin signo a 8 bits: $[0, 2^8-1] = [0, 255]$
- Con 16 bits: $[0, 2^{16}-1] = [0, 65.535]$
- Con 32 bits: $[0, 2^{32}-1] = [0, 4.294.967.295]$


###Representación con signo

En la vida diaria manejamos continuamente números negativos, y los distinguimos de los positivos simplemente agregando un signo "menos". Representar esos datos en la memoria de la computadora no es tan directo, porque, como hemos visto, la memoria **solamente puede alojar ceros y unos**. Es decir, ¡no podemos simplemente guardar un signo "menos"! Lo único que podemos hacer es almacenar secuencias de ceros y unos.

Esto no era un problema cuando los números eran no negativos. Para poder representar, ahora, tanto números **positivos como negativos**, necesitamos cambiar la forma de representación. Esto quiere decir que una secuencia particular de dígitos binarios, que en un sistema sin signo tiene un cierto significado, ahora tendrá un significado diferente. Algunas secuencias, que antes representaban números positivos, ahora representarán negativos.

Veremos los **sistemas de representación con signo** llamados **Signo-magnitud (S-M)**, **Complemento a 2 (C2)** y **En exceso a $2^n - 1$**.

Es importante tener en cuenta que **solamente se puede operar entre datos representados con el mismo sistema de representación**, y que el **resultado** de toda operación **vuelve a estar representado en el mismo sistema**.


###Sistema de Signo-magnitud (S-M)

El sistema de **Signo-magnitud** no es el más utilizado en la práctica, pero es el más sencillo de comprender. Se trata simplemente de utilizar un bit (el de más a la izquierda) para representar el signo. Si este bit tiene valor 0, el número representado es positivo; si es 1, es negativo. Los demás bits se utilizan para representar la magnitud, es decir, el valor absoluto del número en cuestión.

**Ejemplos**

- $7_{(10} = 00000111_{(2}$
- $-7_{(10} = 10000111_{(2}$

Como estamos reservando un bit para expresar el signo, ese bit ya no se puede usar para representar magnitud; y como el sistema tiene una cantidad de bits fija, el RR ya no podrá representar el número máximo que era posible con el sistema **sin signo**.


###Rango de representación de SM(k)

- De los $k$ bits del sistema de signo-magnitud a k bits, hay uno reservado para el signo, lo que implica que quedan $k-1$ para representar el valor absoluto. 
- Estos $k-1$ bits son un número **no negativo** (porque son el valor absoluto de algún número). Al ser un número no negativo de $k-1$ bits, puede representarse con el sistema sin signo sobre $k-1$ bits: es decir, SS(k-1). Este número tendrá un valor máximo representable **que coincide con el límite superior del rango de representación de SS(k-1)**. 
- Sabemos que el rango de representación de SS(k) es $[0, 2^k-1]$. Por lo tanto, el rango de SS(k-1), reemplazando, será $[0, 2^{k-1} -1]$.
- Esto quiere decir que el número de máximo valor absoluto representable en SM(k) es $2^{k-1}-1$. 
- Pero en SM(k) también se puede representar su opuesto negativo, simplemente cambiando el bit más alto por 1. El opuesto del máximo positivo representable es a su vez el número más pequeño, negativo, representable: $-(2^{k-1}-1)$.

Con lo cual hemos calculado tanto el límite inferior como el superior del rango de representación, que, finalmente, es $[-(2^{k-1}-1),2^{k-1}-1]$.


###Limitaciones de Signo-Magnitud
Si bien **SM(k)** es simple, no es tan efectivo, por varias razones:

- Existen dos representaciones del 0 ("positiva" y "negativa"), lo cual desperdicia un representante.
- Esto acorta el rango de representación.
- La aritmética en SM no es fácil, ya que cada operación debe comenzar por averiguar si los operandos son positivos o negativos, operar con los valores absolutos y ajustar el resultado de acuerdo al signo reconocido anteriormente.
- El problema aritmético se agrava con la existencia de las dos representaciones del cero: cada vez que un programa quisiera comparar un valor resultado de un cómputo con 0, debería hacer **dos** comparaciones.

Por estos motivos, el sistema de SM rápidamente dejó de usarse y se diseñó un sistema que eliminó estos problemas, el sistema de **complemento a 2**.


Para comprender el sistema de complemento a 2 es necesario primero conocer la **operación** de complementar a 2.

##Operación de Complemento a 2

La **operación** de complementar a 2 consiste aritméticamente en obtener el **opuesto** de un número (el que tiene signo opuesto).

Para obtener el complemento a 2 de un número escrito en base 2, **se invierte cada uno de los bits (reemplazando 0 por 1 y viceversa) y al resultado se le suma 1**. 

El resultado de esta operación ($C_2(a)$) es el opuesto del número original $a$, y por lo tanto tiene la propiedad de que $a$ y $C_2(a)$ suman 0:

$$C_2(a) + a = 0$$

**Ejemplos**

- Busquemos el complemento a 2 de $111010$. Invirtiendo todos los bits, obtenemos $000101$. Sumando 1, queda $000110$.
- Busquemos el complemento a 2 de $0011$. Invirtiendo todos los bits, obtenemos $1100$. Sumando 1, queda $1101$.


##Sistema de Complemento a 2

Ahora que contamos con la **operación de complementar a 2**, podemos ver cómo se construye el **sistema de representación en Complemento a 2**.

Para representar un número $a$ en Complemento a 2 a k bits:

- Si $a$ es positivo o cero, lo representamos como en SM(k), es decir, lo escribimos en base 2 a k bits. El dígito binario de más a la izquierda es 0.
- Si $a$ es negativo, tomamos su valor absoluto y lo complementamos a 2. El dígito binario de más a la izquierda es 1.

**Ejemplos**

- Representemos el número 17 en complemento a 2 con 8 bits. Como es positivo, lo escribimos en base 2, obteniendo $00010001$, y eso es todo. 
- Representemos el número -17 en complemento a 2 con 8 bits. Como es negativo, escribimos su valor absoluto en base 2, que es $00010001$, y lo complementamos a 2. El resultado final es $11101111$.


###Conversión de C2 a decimal

Para convertir un número $n$ escrito en el sistema de complemento a 2, a decimal, lo primero es determinar el signo. Si el bit más alto es 1, $n$ es negativo. En otro caso, $n$ es positivo. 

- Si $n$ es positivo, se interpreta el número como en el sistema sin signo, es decir, se utiliza la Expresión General para hacer la conversión de base como normalmente.
- Si $n$ es negativo, se lo complementa a 2, obteniendo el opuesto de $n$. Este número, que ahora es positivo, se convierte a base 10 como en el caso anterior, y finalmente se le agrega el signo "-" para reflejar el hecho de que es negativo.

**Ejemplos**

- Convertir a decimal $n = 00010001$. Es positivo, luego aplicamos la Expresión General dando $17_{(10}$.
- Convertir a decimal $n = 11101111$. Es negativo, luego lo complementamos a 2 obteniendo $00010001$. Aplicamos la Expresión General obteniendo $17_{(10}$. Como $n$ era negativo, agregamos el signo menos y obtenemos el resultado final $-17_{(10}$.

