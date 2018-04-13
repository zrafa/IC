## ¿Por qué $2^{k-1} + ... + 2^1 + 2^0 = 2^{k} - 1$?

### Razonamiento 1
Si escribimos k "unos", éste es el número más grande que podemos escribir con esa cantidad de dígitos.

Al sumarle 1 a este número máximo de k dígitos, obtenemos un número que tiene un dígito más ($k+1$ dígitos). Ese número, como es el primero de todos los que podemos escribir con exactamente k+1 dígitos, es un uno seguido de k ceros.

Por ejemplo, si k fuera 4, el máximo binario a 4 dígitos es 1111. Sumándole 1 obtengo 10000 que está escrito con 5 dígitos.

Pero este número de la forma 10000 no es otro que $2^k$. Entonces resulta que $1111 + 1 = 2^4$, y despejando $1111 = 2^4 - 1$.

El mismo argumento vale para cualquier otro k que consideremos.

### Razonamiento 2 

¿Cómo se deduce que $2^{k-1} + ... + 2^1 + 2^0 = 2^{k} - 1$?

Esta es una identidad conocida que se suele usar en Álgebra. Una demostración podría ser así:

Llamemos 'a' al primer miembro de la igualdad para simplificar un poco:

$a = 2^{k-1} + 2^{k-2} + ... + 2^1 + 2^0$

Y ahora multipliquemos ambos miembros por 2. Si dos expresiones son iguales, al multiplicar *ambas* por 2 van a seguir siendo iguales.

$2a = 2 \times [2^{k-1} + 2^{k-2} + ... + 2^1 + 2^0]$

Operemos en el segundo miembro, distribuyendo el factor 2:

$2a = 2^k + 2^{k-1} + ... + 2^2 + 2^1$

Ahora sumemos y restemos 1 al segundo miembro, con lo cual no cambiamos su valor:

$2a = 2^k + 2^{k-1} + ... + 2^2 + 2^1 + 1 - 1$

Y reescribamos un 1 como $2^0$:

$2a = 2^k + 2^{k-1} + ... + 2^2 + 2^1 + 2^0 - 1$


Pero ahora, en el centro de esta expresión de varios sumandos aparece de vuelta 'a' (lo que ponemos entre corchetes):

$2a = 2^k + [ 2^{k-1} + ... + 2^2 + 2^1 + 2^0 ] - 1$

Luego 
$2a = 2^k + a -1$

Ahora despejamos llevando el 'a' del segundo miembro al primero:

$2a - a = 2^k - 1$

$a = 2^k - 1$

Pero ¿quién era 'a'? Reemplacemos:

$2^{k-1} + 2^{k-2} + ... + 2^1 + 2^0 = 2^k - 1$

Que era lo que queríamos demostrar. 
