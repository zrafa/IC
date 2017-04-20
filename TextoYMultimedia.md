
En esta parte de la unidad veremos la forma de representar otras clases de información no numérica, como los textos y las imágenes.


##Codificación de texto

Cuando escribimos texto en nuestra computadora, estamos almacenando temporariamente en la
memoria una cierta secuencia de números que corresponden a los **caracteres**, o símbolos que tipeamos en nuestro teclado.

Estos caracteres tienen una **representación gráfica** en nuestro teclado, en la pantalla o en la
impresora, pero mientras están en la memoria no pueden ser otra cosa que **bytes**, es decir,
conjuntos de ocho dígitos binarios. 

Para lograr almacenar caracteres de texto necesitamos adoptar
una codificación, es decir, una tabla que asigne a cada carácter un patrón de bits fijo.  

Esta codificación debe ser universal: para poder compartir información entre usuarios, o
entre diferentes aplicaciones, se requiere algún estándar que sea comprendido y respetado 
por todos los usuarios y las aplicaciones. 




Inicialmente se estableció con este fin el **código ASCII**, que durante algún tiempo
fue una buena solución. El código ASCII relaciona cada secuencia de **siete bits** con un carácter 
(o **grafema**) específico de la **Tabla ASCII**. 

Es decir que hay $2^7 = 128$ posibles caracteres codificados por el código ASCII.

Sin embargo, el código ASCII es insuficiente para muchas aplicaciones: no contempla las
necesidades de diversos idiomas. Por ejemplo, nuestra letra Ñ no figura en la tabla ASCII. Tampoco
las vocales acentuadas, ni con diéresis, como tampoco decenas de otros caracteres de varios idiomas
europeos. Peor aún, con solamente 128 posibles patrones de bits, es imposible representar algunos
idiomas orientales como el chino, que utilizan miles de ideogramas.

Por este motivo se estableció más tarde una familia de nuevos estándares, llamada Unicode. 
Uno de los estándares o esquemas de codificación definidos por Unicode, el más utilizado actualmente, se llama
**UTF-8**. Este estándar mantiene la codificación que ya empleaba el código ASCII para su conjunto
de caracteres, pero agrega códigos de dos, tres y cuatro bytes para otros símbolos. El resultado es
que hoy, con UTF-8, se pueden representar todos los caracteres de cualquier idioma conocido.

Otro estándar utilizado, **ISO/IEC 8851**, codifica los caracteres de la mayoría de los idiomas de 
Europa occidental. 

El código ASCII, los diferentes esquemas de Unicode, y el estándar ISO/IEC 8851, coinciden en la
codificación de las letras del alfabeto inglés, que son comunes a la mayoría de los idiomas
occidentales, y en la codificación de símbolos usuales como los dígitos, símbolos matemáticos, y otros. 
Por este motivo son relativamente compatibles, aunque cuando el texto utiliza otros caracteres aparecen diferencias.


##Código ASCII

El código ASCII asigna patrones de siete bits a un conjunto de caracteres
que incluye:

- Las 25 letras del alfabeto inglés, mayúsculas y minúsculas;
- Los dígitos del 0 al 9,
- Varios símbolos matemáticos, de puntuación, etc.,
- El espacio en blanco,
- Y 32 caracteres no imprimibles. Estos caracteres no imprimibles son combinaciones de bits
que no tienen una representación gráfica, sino que sirven para diversas funciones de
comunicación de las computadoras con otros dispositivos.

En general, prácticamente todos los símbolos que figuran en nuestro teclado tienen un código
ASCII asignado. Como sólo se usan siete bits, el bit de mayor orden (el de más a la izquierda) de
cada byte siempre es cero, y por lo tanto los códigos ASCII toman valores de 0 a 127.


Una página HTML servida por un servidor Web es un documento de texto que suele estar codificado en el estándar UTF-8. El contenido de este texto no es exactamente lo que muestra el navegador, sino que el lenguaje HTML en el que está escrito el documento indica cómo debe ser representada gráficamente la página.

Las primeras líneas del documento HTML definen cuestiones relativas a la presentación que hará el navegador, como el idioma en el cual está escrita la página, el conjunto de caracteres que la codifica, el título que debe presentarse en la ventana de visualización, etc. Estas líneas se especifican en el lenguaje especial de la Web, el lenguaje de marcado de hipertexto, o HTML.

**Ejemplo**

Este ejemplo muestra tres vistas del mismo documento, con el objetivo de mostrar que el documento se compone simplemente de una secuencia de bytes. 

1) Con nuestro navegador podemos visualizar el texto de esa página pulsando las teclas CTRL+U. Lo mismo si descargamos la página hacia un archivo y usamos el comando **head**. Lo que se ve es diferente de lo que muestra el navegador: se trata del **código fuente** de la página HTML.


2) Con diferentes comandos o programas de visualización podemos ver, carácter por carácter, cómo está construido este texto. El comando **hexdump -bc** nos da la lista de los caracteres que componen el texto, con su notación en octal que aparece encima de cada uno de ellos.

Las letras acentuadas se representan con una serie de caracteres UTF-8 especiales, no pertenecientes a la zona visible del ASCII.

Los caracteres de control como el tabulador y el fin de línea no tienen un grafema asociado, sino que se representan por secuencias **\t** y **\n** respectivamente. Estos caracteres desplazan el cursor que escribe los caracteres en pantalla para organizar visualmente la presentación del texto, y también son parte del código fuente de la página.


3) Del mismo modo, el comando **hexdump -C** muestra cada uno de los grafemas de los caracteres acompañado de su codificación en hexadecimal. Esta vista no muestra los caracteres acentuados ni los de control, reemplazándolos por puntos. 


Otras clases de datos, diferentes del texto, también requieren codificación (porque siempre deben
ser almacenados en la memoria en forma de bits y bytes), pero su tratamiento es diferente.

Introducir en la computadora, por ejemplo, una imagen analógica (tal como un dibujo o una
pintura hecha a mano), o un fragmento de sonido tomado del ambiente, requiere un proceso previo
de **digitalización**. Digitalizar es convertir en digital la información que es analógica, es decir,
convertir un rango **continuo** de valores (lo que está en la naturaleza) a un conjunto **discreto** de
valores (que puede ser expresado en forma de números a ser ingresados en la computadora).


##Color

El color es un componente de información importante de las imágenes. Hay varias maneras de representarlo. Una forma es definir, para cada punto de la imagen, tres coordenadas que describen las intensidades de luz **roja, verde y azul** que conforman cada color. 

Cuando se crea una mezcla de rayos de luz de colores con esas intensidades, usando un proyector o una pantalla como los displays LED, las ondas luminosas individuales del rojo, verde y azul se suman formando otros colores. Este esquema de representación del color se llama **RGB** por las iniciales de los colores rojo, verde y azul en inglés.

Para cada punto, esas tres coordenadas son números en un cierto intervalo. El valor mínimo de una coordenada, el 0, representa la ausencia de ese color. El valor máximo, la intensidad máxima de ese color que se puede reproducir con el dispositivo de salida que lo está visualizando. Cuando las coordenadas se representan en un byte, cada coordenada puede ir entre 0 y 255. 

Así, la terna (0, 0, 0) representa el negro (ausencia de los tres colores), la terna (255, 255, 255) el blanco (valores máximos de los tres colores, sumados), etc.

