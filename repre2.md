
**Ejemplo de suma sin overflow**

Si usamos el sistema de complemento a 2 con $k$ bits y queremos sumar dos números cuyo resultado quedará dentro del rango de representación, sabemos que ese resultado será válido. Del mismo modo, si la suma no puede ser representada en $k$ bits, habrá desbordamiento u *overflow*. Pero las computadoras no tienen forma de saber a priori esta condición. Por eso necesitan alguna forma de detectar las situaciones de overflow, y el modo más fácil para ellas es comprobar los dos últimos bits de la fila de bits de acarreo o *carry*. 

El último bit de la fila de carry, el que se posiciona en la última de las $k$ columnas de la representación, se llama *carry-in*. El siguiente bit de carry, el que ya no puede acarrearse sobre ningún dígito válido porque se han rebasado los $k$ dígitos de la representación, se llama el *carry-out*. Si, luego de efectuar una suma en C2, los valores de los bits de *carry-in* y *carry-out* son iguales, entonces la computadora detecta que el resultado no ha desbordado y que la suma es válida. La operación de suma se ha efectuado exitosamente.


# TEST 1 NUEVO


# TEST 2 NUEVO

