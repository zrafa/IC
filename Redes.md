


#Redes de computadoras

Un conjunto de computadoras conectadas para compartir información u otros recursos es una **red** de computadoras. En cualquier red se distinguen por lo menos tres elementos de hardware:

- Las computadoras conectadas se llaman **hosts** o nodos terminales.
- Los **enlaces** que conectan las computadoras. Los enlaces suelen llamarse **punto a punto** cuando conectan únicamente dos nodos, o **compartidos** cuando al mismo enlace se conectan más de dos nodos.
- Otros **nodos intermedios**, los **routers**, que sirven para encaminar el tráfico de información entre los nodos terminales.

Para utilizar la red, todos los nodos que están conectados a ella, ya sean terminales o intermedios, corren software de red como **protocolos** y **aplicaciones de red**. Los protocolos son, por un lado, convenciones que establecen con todo detalle cómo se realiza una comunicación, y por otro lado, los componentes de software que implementan esa forma de comunicación. 

Las aplicaciones de red son aplicaciones **distribuidas**, es decir, se componen de al menos dos partes, preparadas para comunicarse unas con otras, y esas partes funcionan en nodos terminales de la red diferentes. Cada aplicación de red utiliza un protocolo, porque la interacción entre las partes debe estar perfectamente determinada para que los nodos se entiendan sin errores ni ambigüedades. Un protocolo puede ser utilizado por varias aplicaciones.

Hoy, la mayoría de las redes están interconectadas por una única red global llamada **Internet**. Para conectarse a Internet, todos los nodos, terminales e intermedios, ejecutan un protocolo básico llamado **IP (Internet Protocol)**, y se puede decir que, desde el punto de vista del software, constituyen una sola red. 

Sin embargo, desde el punto de vista de la administración, dentro de Internet existen numerosas redes. Cada red es propiedad de una persona u organización que tiene el control sobre los nodos y enlaces de esa red, decide qué nodos pertenecen o no pertenecen a ella, y qué protocolos y aplicaciones utilizan. 

Estas diferentes redes se pueden clasificar por su tamaño. 

- Una red cuyos límites (o **diámetro**) son pequeños, se llama una **red de área local o LAN (Local Area Network)**. Típicamente, una LAN está contenida en una oficina, piso o edificio.
- Una red que abarca el área de una ciudad (y por lo tanto, cuyos enlaces utilizan espacios públicos) suele llamarse **red metropolitana o MAN (Metropolitan Area Network)**.
- Una red mayor, que cubre distancias entre ciudades, países o continentes, se llama una **red de área extensa o WAN (Wide Area Network)**. Las redes de los **proveedores de servicios de Internet (ISPs)** suelen clasificarse como WANs.


##Modelo de Internet

Las redes pueden estudiarse y comprenderse mediante modelos jerárquicos compuestos por capas, donde cada pieza de hardware o de software pertenece a una capa o nivel. 

Cada capa corresponde a un conjunto de problemas relacionados, y a las soluciones posibles. Para funcionar, cada capa se apoya en las soluciones provistas por la capa inmediatamente inferior.

* Aplicación

   En la capa de Aplicación se encuentran los protocolos sobre los cuales se basan directamente las aplicaciones distribuidas.

* Transporte

    La capa de Transporte soluciona el problema de la entrega de datos entre **procesos** de nodos diferentes.

* Red

    La capa de Red soluciona el problema de la entrega de datos entre **nodos** de diferentes redes.

* Enlace 

    La capa de Enlace soluciona el problema de la entrega de datos entre **nodos de la misma red**.

* Física

    La capa Física define la forma como se codifican y transmiten las señales que representan la información.


##Switches 
En las redes de área local, o LAN, encontramos enlaces compartidos. El cableado de una oficina, un aula o un edificio es un único medio de comunicación compartido por todos los nodos de la red. El cableado se concentra en un punto de conmutación llamado **switch** o, justamente, conmutador, que distribuye el tráfico entre los nodos conectados. Un switch tiene muchas **interfaces** donde se conectan cables punto a punto hacia los nodos de la LAN. 

Es posible conectar switches entre sí para mejor distribución del tráfico, formando una **topología** de estrella o de árbol. Todo el conjunto de switches y enlaces de la LAN constituye un enlace compartido, ya que todos los nodos de la LAN pueden comunicarse a través de él.

Los switches y los nodos de las redes de área local ejecutan un protocolo de enlace definido por la norma **IEEE 802.3**. Este protocolo deriva de uno anterior, llamado **Ethernet**. Aunque el diseño original de Ethernet era diferente del de 802.3, y el hardware sobre el que funcionaba Ethernet era muy diferente del de los switches actuales, este nombre de Ethernet sigue usándose informalmente para las redes construidas con switches 802.3.

Un switch 802.3 conduce unas unidades de tráfico básicas, los **frames o tramas** 802.3, entre los nodos de la red de área local, conectados al enlace compartido formado por todos los switches y cableado de la LAN. La misión de este protocolo de enlace termina donde termina la red de área local. Los frames o tramas jamás salen fuera de la LAN. Por eso decimos que la función de **nivel de enlace** de una red es entregar el tráfico **entre nodos adyacentes**. Es decir, los que se encuentran sobre el mismo enlace.



##Routers
Suele definirse a Internet como "red de redes". 
Las grandes redes, y en particular Internet, se componen interconectando redes a través de enlaces, a veces de gran longitud. 
Entre cada dos de estas redes siempre existe un **router**.  

El router presta el servicio que no alcanza a prestar el nivel de enlace, que es el de enviar el tráfico fuera de la red de origen. El nivel al que pertenecen los routers se llama **nivel de red**.

Los routers son los elementos que toman las decisiones de **enrutamiento** o ruteo, al determinar por cuál de sus interfaces, que a veces son muchas, debe ser enviada la información que reciben. Esta tarea de enrutar la información se cumple mediante software de enrutamiento. 

El hardware y el sistema operativo de los routers pueden estar altamente especializados en la tarea de ruteo, pero también es perfectamente posible construir un router a partir de una computadora corriente de escritorio y un sistema operativo multipropósito. Es decir que los routers no son sino computadoras, con un sistema operativo y un hardware similares a los que encontramos en muchas otras computadoras, pero dedicadas a la tarea del enrutamiento. 

Dependiendo del ambiente donde deben trabajar y de la cantidad de tráfico que deben procesar, los routers pueden adoptar muchas formas físicas y tamaños.

- Los routers pueden ser pequeños y baratos, para uso doméstico. 


- Algunos pueden dar servicio a muchos nodos terminales al incluir múltiples dispositivos de nivel de enlace, como un switch 802.3 de varias interfaces, y un **punto de acceso** para una **red inalámbrica** secundaria basada en tecnología de radio.


- Algunos, de muy altas prestaciones, usados por los proveedores de servicios de Internet, son **modulares** y pueden ser configurados a medida de las necesidades. Cada módulo contiene **interfaces** especializadas en alguna tecnología de enlace, lo que les permite conectar redes de tecnologías completamente diferentes.



##Interfaces

La interfaz es el punto de conexión entre un enlace y un nodo de la red. Es la pieza de hardware que convierte bits a señales capaces de viajar por la red, y viceversa. Cuando un nodo debe comunicar algo a otro, prepara su mensaje en una zona de la memoria, y entrega esos contenidos binarios a la interfaz a través de un bus de comunicación. 

La interfaz contiene el hardware necesario para traducir ese **tren de bits** a señales eléctricas (cuando los enlaces son cableados), de radio (cuando el enlace es inalámbrico), o luminosas (cuando el enlace es de fibra óptica). 

Las modernas interfaces de red pueden funcionar a **velocidades de transmisión** de muchos bits por segundo. Una LAN cableada actual funciona comúnmente en velocidades de 1 a 10 Gb/s o Gbps (gigabits por segundo). Una LAN inalámbrica suele funcionar a una velocidad de transmisión mucho menor (y, además, variable, dependiendo de condiciones físicas ambientales que tienden a limitar la velocidad de transmisión).

El tren de bits viaja en forma de señales físicas por el enlace hasta llegar a la interfaz del nodo destino dentro de la red de área local. La interfaz receptora decodifica las señales, recuperando los bits originales y comunicándolos al software que espera los datos. Ambas partes de la aplicación distribuida se han comunicado un mensaje.


##Medios y enlaces
El material que atraviesan las señales transmitidas sobre un enlace se llama el **medio** del enlace. Las tecnologías de construcción de los enlaces son muchas. 

- Cuando las señales se codifican mediante impulsos eléctricos, como en las redes de cables de **par trenzado** o **coaxial**, el medio es un conductor, como el cobre.  
- Para distancias mayores (como las transoceánicas) o para ambientes donde existe mucho **ruido** o interferencia electromagnética (como en fábricas), se utiliza **fibra óptica**.
- Cuando no es posible, o práctico, tender un cable, no queda más solución que utilizar emisiones de **radio**. Ejemplos de tecnologías de radio son los enlaces satelitales, los de microondas, y las LAN inalámbricas bajo norma **802.11** conocidas popularmente como **WiFi**. Estas tecnologías utilizan como medio el **espacio**.


Las principales compañías de conectividad del mundo tienden enlaces de fibra óptica transoceánicos. Como la instalación de estos cables es una maniobra muy compleja y tiene un costo altísimo, se aseguran de instalar capacidad de transmisión en abundancia. Por ejemplo, uno de estos enlaces tiene una capacidad de 3.2 Tbps, lo que permitiría transmitir el contenido completo de un disco rígido de 1 TB en menos de tres segundos. Esta capacidad es compartida entre varios proveedores de Internet que compran el servicio de transporte.

**Interesante**

[Submarine Cable Map](http://www.submarinecablemap.com/#/landing-point/las-toninas-argentina)


En el pasado también se usaron los enlaces satelitales para resolver el problema de cubrir grandes distancias. Los satélites son repetidores de radio colocados en órbita. Reciben emisiones de una estación terrena y la comunican a otra distante, superando el problema de la curvatura terrestre, que no permitiría la propagación en línea recta de la emisión de radio. 

Su principal inconveniente es la alta **latencia o retardo** en la llegada de la señal desde un punto a otro, debido a las grandes distancias que se deben enlazar. Los satélites **geoestacionarios** o de órbita alta (**GEO**) se instalan a una altura de alrededor de 35700 km. Al ubicarlos a esta altura se alcanza un equilibrio entre la fuerza de gravedad terrestre y la fuerza centrífuga del satélite, lo que garantiza que permanecerán inmóviles respecto de algún punto de la superficie terrestre, y así cubrirán siempre la misma región del planeta. Pero la órbita alta implica una gran distancia a recorrer para las señales, lo que introduce demoras de alrededor de un cuarto de segundo entre estaciones terrestres. Estas demoras son tolerables para algunas aplicaciones de tráfico de datos, pero perjudiciales para las comunicaciones interactivas.

Paulatinamente van siendo abandonados en favor de la fibra óptica para comunicación de datos a grandes distancias. Hoy se estima que sólo un 5% del tráfico internacional es satelital, y el resto es conducido por fibras ópticas. Sin embargo, siguen siendo una buena solución para atravesar áreas continentales, o para distribuir tráfico hacia muchos puntos simultáneos de bajada, como en los medios de comunicación televisivos (aplicación llamada **broadcasting**).


##Velocidades de transmisión y de propagación
Cada interfaz funciona a una determinada **velocidad de transmisión**, que es la cantidad de bits por segundo que es capaz de escribir en el enlace, o leer del enlace. Las unidades utilizadas para expresar la velocidad de transmisión son las del sistema decimal. Así, una medida habitual es el Gbps o gigabit por segundo ($10^9 b/s$). La velocidad de transmisión suele ser llamada también **ancho de banda digital**.

Por otro lado, una vez que **cada bit** ha sido escrito en un enlace, ese bit aún debe viajar desde la interfaz de salida hasta la interfaz del otro extremo del enlace. Ese viaje, aunque se realiza a velocidades cercanas a la de la luz, **no es instantáneo**. Dependiendo del medio, la **velocidad de propagación** de un bit puede ser de alrededor de un 60% a 90% de la velocidad de la luz, que es de unos 300.000 km/s, o $3\times 10^8 m/s$.

- Notemos que la **velocidad de transmisión** depende exclusivamente de las características tecnológicas de la interfaz. Son la construcción y la configuración de la interfaz las que definen la velocidad de transmisión a la cual funcionará un enlace, y no el medio con el que se implementa el enlace.
- Por el contrario, notemos también que la **velocidad de propagación** es una cuestión puramente física y **no depende de la tecnología de las interfaces**. 

La velocidad de **transmisión** puede mejorarse si se mejoran las tecnologías de interfaz en los extremos del enlace. Pero un medio tiene una determinada velocidad de **propagación**, y ningún cambio en la tecnologia de las interfaces cambiará esa velocidad. 



##Tiempo de transferencia de un mensaje
Conocer las velocidades de transmisión y de propagación nos permite definir un modelo para el **tiempo de transferencia** de un mensaje a través de un enlace. 

Este modelo dependerá de otras dos variables: por un lado, como es lógico, del tamaño del mensaje que se quiere transmitir; y por otro lado, de la **distancia** que separa las interfaces.

Supongamos que:

- El mensaje es de $L$ bits.
- La velocidad de transmisión es $V_{transm}$.
- La velocidad de propagación es $V_{prop}$.

Y que además, llamamos $D$ a la distancia entre interfaces o longitud del enlace. Entonces:

- El **tiempo de transmisión** para los $L$ bits será $T_{transm} = L / V_{transm}$.
- El **tiempo de propagación** para el enlace de $D$ m será $T_{prop} = D / V_{prop}$.

Notemos una vez más que el **tiempo de transmisión es dependiente de la velocidad de transmisión de las interfaces**, y no de la longitud del enlace. Y además, que el **tiempo de propagación es función de la longitud del enlace**, y no de la velocidad de transmisión de las interfaces.

El **tiempo de transferencia** que demorarán en llegar los $L$ bits a destino, será la suma de ambos tiempos: 

$$T_{tot} = T_{transm} + T_{prop}$$.





Es habitual ver en la bibliografía de Redes los diagramas de flujo de mensajes, que muestran qué ocurre en cada nodo a medida que transcurre el tiempo. En estos diagramas, el tiempo avanza hacia abajo, y los nodos emisor y receptor están representados por columnas. 

En el emisor, a la izquierda, un trazo vertical de línea gruesa encima del nodo indica el tiempo de transmisión de un mensaje. Donde comienza el trazo, comienza la transmisión del primer bit del mensaje. Donde finaliza el trazo vertical y comienza una línea oblicua, finaliza la transmisión del último bit. Mientras más largo este trazo vertical, mayor el tiempo de transmisión y, por lo tanto, menor la velocidad de transmisión de la interfaz.

La línea oblicua, proyectada sobre la columna del emisor, indica el tiempo invertido en atravesar el enlace desde el emisor hasta el receptor. El ángulo formado por la oblicua con la vertical se relaciona con el tiempo de propagación. Mientras más tienda la oblicua a la horizontal, menor será el tiempo de propagación, lo que indica un enlace de menor longitud.



Comparemos ambos tiempos de transmisión y propagación. Podemos tener un **enlace 1** (línea azul) de baja velocidad de transmisión respecto del **enlace 2** (línea verde). Como las líneas de propagación tienen el mismo ángulo, inferimos que los enlaces son de la misma longitud.

![Comparando enlaces de la misma longitud][enlaces1]

[enlaces1]: img/enlaces-1.png "Comparando enlaces"

En este diagrama, el tiempo total mayor corresponde al enlace 1, que es el que tiene el mayor tiempo de transmisión.


Sin embargo, el tiempo de transmisión no es lo único que determina un mayor tiempo de transferencia. Si los enlaces fueran de diferente longitud, la situación podría invertirse. Un enlace de mayor velocidad de transmisión (línea azul) podría seguir siendo el de mayor tiempo de transferencia si fuera de longitud suficientemente mayor que el otro.

![Comparando enlaces de longitudes diferentes][enlaces2]

[enlaces2]: img/enlaces-2.png "Comparando enlaces"


##Entidades de red
Llamamos **entidades** a las piezas de software o de hardware que funcionan como componentes de los nodos dentro de una red. Las entidades pueden ubicarse a cualquier nivel: pueden ser dos routers, dos interfaces de red, o las partes de una aplicación distribuida. 

Las entidades de nodos diferentes que van a comunicarse estarán siempre al mismo nivel.

##Eventos de red
Llamamos **eventos** a cualquier suceso de interés que ocurre dentro de la red, especialmente si se trata de una interacción entre entidades. Por ejemplo, la llegada de un mensaje.

##Protocolos
Los **protocolos** son conjuntos de reglas que definen la interacción entre dos entidades de la red. 

Para comunicarse, las entidades de cualquier nivel deben compartir un protocolo. Los protocolos especifican:

- Cuál es el **formato** de los mensajes que pueden intercambiar las entidades;
- Qué tipo de **acciones** o respuestas debe dar cada entidad al recibir cada mensaje.



Puede ser útil comparar los protocolos de red con protocolos sencillos de la vida cotidiana. Muchas interacciones entre las personas están gobernadas por protocolos, a veces poco evidentes. Por ejemplo, comprar un artículo cualquiera en un comercio sigue unas pautas bastante definidas. 

Aunque los contenidos específicos de los mensajes pueden variar, es habitual que existan fases en la interacción entre las personas, como el **inicio de sesión, la autentificación, la autorización, las peticiones o requerimientos (*requests*), las respuestas (*responses*), y el cierre de sesión**. 

Todas éstas son fases habituales en la comunicación entre los humanos, pero también en los protocolos de las redes.

###Modelo cliente-servidor
Estas fases habituales aparecen en los protocolos que definen relaciones de **cliente y servidor** entre entidades. En el modelo cliente-servidor:

- El nodo cliente es el que inicia una interacción, con un **request** o requerimiento hacia el servidor. 
- El nodo servidor contesta con una respuesta o **response**. 
- El ciclo puede repetirse indefinidamente. 

La mayoría de las aplicaciones de Internet siguen este **modelo cliente-servidor** de interacción. El protocolo **HTTP**, motor de la **WWW**, es un ejemplo claro.

###Modelo peer-to-peer
El modelo cliente-servidor es asimétrico: los roles de cliente y de servidor están bien diferenciados. Un modelo alternativo, diferente, es el llamado **peer-to-peer**, donde no existe un nodo servidor propiamente dicho, sino que todos los nodos que comparten el protocolo son, a la vez, clientes y servidores, en igualdad de condiciones.



###Autómatas

Los **autómatas** son una herramienta formal muy útil para describir detalladamente los protocolos. Un autómata es la especificación de los **estados** en los que puede encontrarse una entidad y los **eventos** que disparan los cambios de estado o **transiciones**. El autómata puede tomar la forma de un diagrama de burbujas y flechas.

+ En un diagrama de autómata, las burbujas representan **estados**. 
+ Las flechas representan **transiciones**. 
+ Las flechas llevan **rótulos** que describen qué **evento** es necesario para disparar la transición, y qué **acción** debe ejecutar la entidad como respuesta al evento.

    - Cuando no se requiere un evento para entrar en un estado (por ejemplo, porque es el estado inicial del autómata), el evento es **vacío** (y se denota "-").
    - Un mensaje de respuesta que confirma la recepción correcta de un mensaje anterior se llama un **reconocimiento o acknowledgement (ACK)**. Si el mensaje de respuesta indica la **recepción incorrecta**, se llama un **acknowledgement negativo** o **NAK**.

###Autómata del cliente

![Autómata del cliente][cliente]

[cliente]: img/protocolo-cliente.png "Autómata del cliente"

En el ejemplo, el cliente ingresa al estado de **Abriendo conexión** presentando sus credenciales. Si son aceptadas, envía su primera solicitud y pasa al estado **En servicio**. A cada respuesta que reciba, podrá enviar una nueva solicitud. Finalmente, emitirá un mensaje de cierre de conexión y terminará la interacción con el servidor.


###Autómata del servidor
Por su parte, el servidor presenta un autómata complementario al del cliente. La mayor parte del tiempo, el servidor estará en el estado **Esperando conexión** hasta que reciba unas credenciales de un cliente. Si las reconoce, pasa al estado **En servicio** donde acepta solicitudes y emite respuestas. Cuando el cliente decide poner fin a la interacción, vuelve al estado de esperar conexión de un nuevo cliente.

![Autómata del servidor][servidor]

[servidor]: img/protocolo-servidor.png "Autómata del servidor"

###Protocolos de parada y espera
¿Cómo se relacionan, por un lado, las medidas de tiempo de transmisión y tiempo de propagación, y, por el otro, los autómatas de un protocolo cliente-servidor? 

Muchos protocolos requieren que una entidad reciba la confirmación de un mensaje anterior antes de poder enviar el siguiente mensaje. Cuando esto ocurre, decimos que el protocolo es del tipo de **parada y espera (*stop and wait*)**.  Cuando el enlace entre dos entidades es de longitud muy grande, un protocolo de parada y espera puede tener una eficiencia muy reducida. 

Si la aplicación que desea usar este protocolo de parada y espera es interactiva, y el enlace es muy largo, la experiencia de usuario será frustrante. El usuario deberá soportar las demoras correspondientes al tiempo de propagación de cada mensaje más el de su confirmación.  Durante ese lapso, no se puede seguir transmitiendo datos porque aún no ha llegado la confirmación o **ACK** del mensaje anterior. Las demoras pueden hacer que la aplicación directamente no sea viable. 

El punto crucial aquí es que este problema **no se resuelve aumentando el ancho de banda de los enlaces**, porque, como hemos dicho, el retardo de propagación no tiene nada que ver con la velocidad de transmisión de las interfaces.

Gran parte de la complejidad de Internet se debe a la necesidad de resolver este problema de los protocolos de parada y espera. En Internet, la solución está representada por el protocolo **TCP/IP**, que en lugar de obligar a esperar un tiempo de propagación por cada mensaje, es capaz de encadenar varios mensajes sin necesidad de esperar confirmación por cada uno. El protocolo TCP pertenece al nivel de **transporte** de las redes.

**Pregunta**

Supongamos que se tiene un enlace de radio de 1Gbps entre una estación terrestre y un vehículo experimental **que circula por la superficie de Marte**. Supongamos además que la aplicación sea controlar interactivamente desde la Tierra este vehículo mediante un protocolo de parada y espera. Los mensajes de este protocolo son comandos de la forma **avanzar**, **detenerse**, **izquierda**, **derecha**, etc.

La distancia teórica mínima al planeta Marte es de unos $54 \times 10^6 km$. Esto se traduce en unos 3 minutos de retardo de propagación. Quiere decir que cada comando enviado desde la Tierra a Marte demorará, en el mejor caso, unos 6 minutos en ser confirmado. Esto ocasiona problemas para controlar el vehículo, porque una mala maniobra puede dejarlo en una situación peligrosa sobre el escarpado suelo marciano. Se necesita una velocidad de respuesta mucho mayor. 

Elevar el ancho de banda digital del enlace, de 1Gbps a 10Gbps, ¿sería una solución?




























































