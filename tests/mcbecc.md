# mcbecc

Compilador de un subconjunto del lenguaje C hacia código de máquina de MCBE.

## Lenguaje de entrada

### Programa

- Un programa constituido por una única función, main().
- Sentencias terminadas por punto y coma

```
int main()
{
   ...sentencias...
}
```

### Constantes
- Únicamente constantes enteras en formato decimal

### Variables

- Variables enteras 
- Deben estar declaradas 
- Sus nombres pueden contener dígitos pero deben comenzar por una letra
- Opcionalmente, inicializadas en la declaración

```
int main()
{
   int a;
   int b = 1;
   int cad2;
   int d8;
}
```

### Asignaciones

- Asignación de constantes a variables
- Asignación de variables a variables

```
int main()
{
   int a;
   int b = 1;
   
   a = 2;
   b = a;
}
```


### Operaciones aritméticas

- Sumas y restas entre exactamente dos operandos
- Los operandos pueden ser variables o constantes

```
int main()
{
   int a;
   int b = 1;
   
   a = 2;
   b = a + 3;
   a = 2 + b;
}
```

#### Acumulador

- Cuando las mismas variables aparecen en ambos miembros de la asignación se obtiene una construcción de "acumulador"

```
int main()
{
   int b = 1;
   
   b = b + 3;
}
```
#### Operador de autoincremento y autodecremento

- Una variable puede incrementar o decrementar en 1 su valor con la sintaxis siguiente

```
int main()
{
   int b = 1;
   int c;
   c = 6;
   b++; // b queda con valor 2
   c--; // c queda con valor 5
}
```
## Entrada y salida

- Dos funciones, in() y out().
- La función de entrada in() recibe como argumento la dirección de una variable. Espera el ingreso de un número a cargo del usuario.

```
int main()
{
   int b = 1;

   in(&b);
}
```
- La función de salida out() recibe como argumento la variable cuyo contenido se desea imprimir.

```
int main()
{
   int b = 1;

   out(b);
}
```

## Ejemplos

- Un programa que recibe un dato del usuario, le suma 1 y lo imprime.

```
int main()
{
   int a;
   
   in(&a);
   a++;
   out(a);
}
```

