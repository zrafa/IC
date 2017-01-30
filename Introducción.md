
## Introducción



## Componentes de las redes



## Aplicaciones distribuidas



## Conmutación de circuitos

Existen dos maneras para llevar a cabo la transmisión de datos a través de una red de enlaces y conmutadores (switches y/o routers). A continuación los describimos:
				

**Conmutación por circuitos**

En las redes que implementan este tipo de conmutación, los enlaces que conectan a conmutadores y terminales poseen una cierta cantidad de circuitos y cada uno de estos se destina a una conexión en particular. Por lo tanto, un enlace con N circuitos podrá soportar hasta N conexiones simultáneas.

* La característica distintiva de una red basada en conmutación por circuitos es que para establecer una conexión entre dos terminales se debe previamente reservar los recursos que se van a emplear en ella, es decir que se va a reservar un circuito de cada enlace que conecta al par de terminales. 


Los recursos que reservó una conexión solo pueden ser empleados por ella durante el tiempo que dure. Esto significa que una conexión no comparte sus recursos con otra.

Existen dos formas para implementar los circuitos de un enlace:


1. **Multiplexación por división de frecuencia (FDM)**: el espectro de frecuencias del enlace es dividido en varias bandas, cada una ellas se asignará a una conexión en particular, durante la duración de la misma. Luego, cada circuito obtiene de forma contínua una fracción del ancho de banda del enlace.
Por ejemplo, los sistemas de televisión por cable implementan este tipo de conmutación: el espectro de frecuencias del enlace es dividida en varias bandas, cada una de ellas es asignada a una "emisora" o "canal" determinado.

2. **Multiplexación por división en el tiempo (TDM)**: el tiempo es dividido en marcos de una determinada longitud, y cada marco se subdivide en una cantidad fija de  "slots". Cada uno de estos slots está dedicado a una determinada conexión, solo ella puede usarlo para el transporte de datos. Entonces, cuando se establece un enlace mediante la red, se asigna a esta conexión un slot de cada marco, que no son compartidos.
A diferencia de FDM, en TDM cada circuito ocupa el total del ancho de banda del enlace durante el "slot" de tiempo que tiene asignado.





_Ana Candelaria Alvarez, Nahuel Mamani_




## Conmutación de paquetes

**Conmutación por paquetes**

Este tipo de conmutación se aplica en las redes actuales, y su característica principal es que **_los mensajes transmitidos entre dos nodos son divididos en porciones más pequeñas de datos que se denominan paquetes.**_ Cada paquete se conforma por los datos a enviar y por la información de control.

Para que el mensaje llegue correctamente desde el nodo transmisor al receptor, los paquetes correspondientes viajan a través del enlace de comunicaciones y de los conmutadores de paquetes, que se ubican en la capa de enlace y son los routers y los switches. En este momento entra en juego la información de control, cuya función es indicar qué ruta debe seguir el paquete hasta llegar a destino. Cada router posee una tabla de reenvio, que basicamente establece una correspondencia entre direcciones de destino y enlaces salientes.

En general, los conmutadores utilizan el método de transmisión almacenamiento y reenvío (store and forward). Esto significa que el paquete debe llegar y almacenarse completo en el conmutador, y recién entonces podrá comenzar su transmisión al enlace de salida. Para implementar este método, el conmutador tiene que tener algún tipo de memoria interna, denominada buffer o cola de salida y se utiliza para un enlace específico de los varios conectados al conmutador. El tiempo demorado para que el paquete llegue completo y se almacene en el conmutador se denomina retardo de almacenamiento, y se analizará más adelante.

Según la velocidad del enlace y la cantidad de paquetes para transmitir, puede ocurrir que los paquetes lleguen más rápido al conmutador de lo que salen al enlace. En estos casos, la cola o buffer comienza a llenarse y se generan retardos de cola. Un fenómeno que puede ocurrir es la pérdida de paquetes; ocurre cuando un paquete desea entrar al conmutador y almacenarse en el buffer correspondiente pero éste se encuentra lleno

**Conclusiones**

La _conmutación por circuitos_ es ideal para aquellas redes en las cuales se emplearán aplicaciones de tiempo real, por ejemplo videollamadas, porque el retardo que hay entre el envío de un dato desde un terminal y la recepción del mismo en otro terminal generalmente no varía. En cambio, en la conmutación por paquetes las conexiones no poseen enlaces dedicados, por lo que existen retardos  variables e impredecibles, al tener que esperar a que el enlace se desocupe para transmitir un dato.

Por otra parte, quienes argumentan a favor de la _conmutación por paquetes_ afirman que permite un mejor uso compartido del ancho de banda y en comparación es mas económica, sencilla y eficiente. El mejor uso compartido se justifica ya que en este tipo de conmutación los enlaces no son dedicados, por lo que no ocurriría que cierto enlace tenga un periodo ocioso y desperdicie recursos. Además, puede explorarse todo el ancho de banda, permitiendo mas usuarios conectados a la vez. El uso del enlace se denomina bajo demanda; dependiendo de la cantidad de usuarios simultáneos van a tener dedicado más o menos ancho de banda. Esta forma de compartir recursos según lo requerido, se denomina multiplexación estadística de recursos.


_Ana Candelaria Alvarez, Nahuel Mamani_


## Protocolos

##Protocolos

Los protocolos definen el formato y el orden de los mensajes intercambiados entre dos o más entidades, como así también las acciones llevadas a cabo a partir de la emisión o recepción de un mensaje u otro evento. 

Los protocolos de red son similares a los protocolos humanos, excepto que las entidades que intercambian mensajes y llevan a cabo acciones son componentes de hardware y software de algún dispositivo. 

El intercambio de mensajes entre dos personas se asemeja mucho al intercambio de peticiones que se dan entre un cliente y un servidor. Supongamos que dos personas quieren iniciar una conversación: la conducta normal sería esperar a que alguna de ellas empiece con un saludo, y una vez que la otra persona responde, ambas empezarían a hablar. En los protocolos de red pasa algo similar. El cliente envía un mensaje de saludo al servidor, y si no hay ningún problema, el servidor le devuelve un mensaje diciendo que está dispuesto a empezar una comunicación. Una vez que la conexión está establecida, el cliente y el servidor pueden intercambiar datos relevantes para su correcto funcionamiento. 

No respetar un protocolo puede hacer muy difícil la comunicación. Todas las actividades en Internet que involucran comunicaciones entre dos o más entidades remotas son gobernadas por un protocolo. 

* Por ejemplo, los protocolos de hardware entre dos máquinas conectadas controlan el flujo de bits que llega a través del cable que conecta las dos placas de red. 
* Los protocolos de control de congestión controlan el ritmo en que los paquetes son transmitidos entre el emisor y el receptor. 
* Los protocolos en el router determinan el camino que van a tomar los paquetes desde el origen hasta el destino. 

En general, Internet y las redes de computadoras hacen un uso extensivo de distintos protocolos para llevar a cabo distintas tareas de comunicación. 

_Nahir Saddi-Nicolás Panozo-Sebastián López Mesa-Jordan Fingerhut_


## Medios físicos

Medios Físicos## Medios Físicos

Para hacer posible la comunicación entre diferentes terminales, es necesario un canal que los comunique. Este canal es llamado *medio físico* y puede ser de dos tipos:

Medios guiados y Medios no guiados. A continuación, desarrollaremos cada uno de estos.

Medios guiados: En este caso las ondas son transmitidas a través de un medio sólido, como puede ser un cable de fibra óptica, un cable de cobre de par trenzado o un cable coaxial. El costo de la instalación de este tipo de medio es, generalmente, más elevado en relación con el costo de los materiales.

Describamos cada uno de los medios enunciados:



* Cable de cobre de par trenzado: Es el más utilizado en las redes domiciliarias por su bajo costo. El 99% de las redes telefónicas utilizan este tipo de medio. Consta por grupos de cables trenzados dos a dos en forma helicoidal (normalmente cuatro grupos), de esta forma se logra reducir la interferencia eléctrica entre cada par mejorando la transmisión de datos. El conjunto de los pares están protegidos por una cubierta aislante. Para redes de computadoras de área local, generalmente se utilizan par trenzado desprotegido, comúnmente llamado UTP.

* La tasa de transferencia de datos oscila entre 10 y 100mbs para la categoría 3, y hasta 1Gbps para la categoría 5.



* Cable coaxial: Está formado por un hilo de cobre en la parte central, una malla metálica, un cilindro de plástico que aísla estos dos conductores y una funda protectora aislante. La malla metálica tiene el propósito de pantalla ante las interferencias.

Existen dos tipos de cable coaxial:

* Thicknet (Cable coaxial de banda amplia): Tiene un grosor de 1,27cm y su señal se puede extender a más de 500 mts. Al ser grueso, su instalación es más dificultosa y su uso fue disminuyendo.

* Thinnet (Cable coaxial de banda base): Su grosor es menor al anterior, de 0,64cm por lo cual es más fácil de instalar y es más utilizado, pero la señal puede llegar solo hasta 185 mts.



Fibra óptica: Es un medio flexible que transmite pulsos de luz (1 pulso = 1 bit). La fuente de luz podría ser un láser, por ejemplo. La fibra óptica es inmune a las interferencias electromagnéticas y es usada mayormente en las redes troncales de internet (como así también en enlaces transoceánicos) debido a que la señal es muy estable en largas distancias. Es de los medios físicos, el que aporta mayor velocidad de transmisión. La principal contra es el alto costo de los dispositivos ópticos (transmisores y receptores).



Canales de radio terrestre: Transportan señales por medios electromagnéticos. No requieren la instalación de cables, y pueden atravesar obstáculos como paredes (con cierto límite). Otra ventaja es también que proporciona conectividad a los usuarios móviles. Las señales se ven interferidas por otras señales electromagnéticas o por los objetos que se interponen en el radio de conectividad que ofrece. Los canales de radio terrestre se pueden dividir entre aquellas que operan en áreas locales (LAN inalámbrica-WiFi) y las redes de telefonía celular. 



Canales de radio vía satélite: Se encargan de comunicar a dos o más estaciones terrestres (transmisor/receptor), donde una transmite en cierta frecuencia y el satélite se encarga de re-transmitirlo en otra. Existen dos tipos de satélites dependiendo de su ubicación: Satélites geoestacionarios y satélites de órbita baja terrestre (LEO, Low-Earth Orbiting). 

Los primeros se encuentran ubicados en el mismo punto encima de la tierra, aproximadamente a unos 36mil kilómetros. Permiten el uso de antenas terrestres fijas (gracias a que su orientación no cambia) y asegura un contacto permanente con el satélite. El retardo que existe entre una estación terrestre y otra se debe a la distancia que debe recorrer desde la estación transmisora hasta el satélite, y del satélite hasta la estación receptora (280 milisegundos).

El otro tipo de satélite (LEO) está ubicado a una altitud considerablemente menor (750km aproximadamente). No permanecen en el mismo punto, sino que giran alrededor de la tierra. Es necesaria la presencia de varios de éstos satélites para proporcionar cobertura a una superficie terrestre determinada. Este tipo de satélites pueden comunicarse entre sí.



Bluetooth: Se trata de un protocolo de comunicaciones inalámbrico que apunta a dispositivos de bajo consumo ubicados a poca distancia. La comunicación se realiza a través de ondas de radio de corto alcance, aunque esto no quiere decir que los dispositivos deben estar en el mismo lugar. Dependiendo de la potencia de transmisión, la comunicación puede realizarse incluso en habitaciones diferentes, siempre y cuando ésta sea suficiente para conectarlos. 

Este protocolo es comúnmente utilizado por computadoras, celulares, cámaras digitales, stereos de vehículos, etc.. 

Bluetooth se divide en 3 clases, dependiendo de su alcance: Clase 1 (aproximadamente 100 metros), Clase 2 (aproximadamente 10 metros) y Clase 3 (aproximadamente 1 metro)



_Jonathan Esteban, Nadir Jaramillo_


## Redes de acceso



## Internet, red de redes



## Encolamiento y pérdida

##**Encolamiento y pérdida**

La transferencia de paquetes entre dos nodos de una red está dado por dos instancias precisas: el **envìo de paquetes** en el nodo emisor y la **recepción de paquetes** en el nodo receptor.

Para el envío de los paquetes, cada nodo emisor tiene una determinada velocidad de transferencia (a la que viajan los mismos) estos se transmiten -en la medida posible determinada por el ancho de banda del canal de transmisión- uno a uno por el canal. 

Cuando éste está ocupado, los paquetes quedan almacenados en la **memoria intermedia de salida**, también llamada **cola de salida**.

####**Encolamiento**
El llamado *encolamiento* de paquetes sucede cuando la velocidad de transmisión del nodo emisor es superior a la velocidad de recepción del nodo receptor, esto produce la saturación del *buffer* que puede contenerlos, haciendo de esta manera se genere una cola de paquetes, esperando para ser transmitidos, puede ocurrir el llenado de la cola de transmisión y esto nos puede traer algunos problemas subyacentes como es la **pérdida de paquetes**.

####**Pérdida de paquetes**
La *pérdida de paquetes* por el llenado de  la cola de salida ocurre cuando un paquete quiere salir por el enlace del nodo emisor y se encuentra con que no solo el enlace está ocupado sino que también está completa la *memoria intermedia de salida*(cola de salida), entonces en este caso quedan dos soluciones, el paquete que intentó ingresar a la *cola de salida* se pierde o se da de baja algún paquete que ya se encuentra en la memoria intermedia de salida.

####**Otros factores de retardo**
Cuando un paquete se quiere transmitir de un nodo de salida a otro nodo destino ,muy probablemente en el proceso de emisión, recorre distintos nodos intermedios para poder llegar a destino. En este recorrido pueden ocurrir una serie de factores, que generan distintos tipos de retardo, como son los **retardo de procesamiento**, **retardo de transmisión**, **retardo de propagación** y como antes se explicó la *demora de espera* que ocurre cuando el enlace emisor está ocupado y probablemente también se encuentres paquetes en la memoria intermedia.

####**Retardo de procesamiento**
Es el tiempo en que se demora en verificar en qué enlace se enviará el paquete, esto se conoce al analizar su encabezado, luego de conocerlo se envía el paquete al destino, otro control que se realiza es que no se produzca un error a nivel de bit al enviar el paquete al nodo en que nos encontramos analizando.



####**Retardo de transmisión**
Es el tiempo necesario para introducir todos los bits del paquete por el enlace para luego transmitirlos, en la práctica sólo puede ser transmitido después de que todos los paquetes que hayan llegado antes hayan sido transmitidos.


####**Retardo de propagación**
Una vez que el bit haya entrado por el enlace (de transmisión), este debe propagarse al router de destino. La velocidad de propagación depende del medio físico del enlace (fibra óptica, cable de cobre,satélite). 
El retardo de propagación es igual a, la distancia entre dos routers dividida por la velocidad de propagación.

_Daiana Natalí Bonet Peinado_




## Retardos


Cuando se realiza transferencia de datos, estos se dividen en paquetes que se transfieren de un nodo a otro hasta alcanzar su destino final (borde de la red) o morir en el camino (en el núcleo de la red). 

En cada etapa del proceso de transmisión de los paquetes ocurren diversos retardos en el núcleo de la red:

Cuando un paquete llega a un nodo (llamémosle nodo A), éste verifica el encabezado del paquete para saber a qué interfaz de salida debe redirigirlo. Si el link por el cual debe enviar el paquete está ocupado, el paquete se pone en el buffer de salida que le corresponda a ese link y se encola hasta ser dirigido. Este tiempo que tarda en verificar el encabezado se llama *retardo de procesamiento*. Además de verificar el encabezado, el tiempo de procesamiento también puede verse incrementado por la comprobación de posibles errores a nivel de bit que pueden producirse en el envío del paquete desde el nodo anterior al nodo A. 

Cuando el paquete está en el buffer esperando a ser transmitido, sufre *retardo por encolamiento*, el cual es proporcional a la cantidad de paquetes que están delante de él (teniendo en cuenta que el buffer es atendido en orden de llegada –first come first serve-). Si no existen paquetes delante de él, el tiempo de retardo por encolamiento es cero; de lo contrario si hay muchos paquetes esperando a ser atendidos el tiempo de retardo por encolamiento es muy alto. 

Cuando el nodo está listo para transmitir el paquete, debe tomar bit por bit e ir colocándolos en el link. Este tiempo que tarda en colocar los bits en el link se llama *retardo de transmisión*. Supongamos que la cantidad de bit del paquete a transmitir es L, y la tasa de transferencia de bit del link es de R bit por segundos, entonces el retardo de transmisión se calcula como L/R bit por segundos que indica el tiempo que requiere para colocar todos los bits del paquete en el link.

Una vez que los bits del paquete están sobre el enlace, estos deben llegar al siguiente nodo. Durante el tiempo de viaje de un nodo a otro los bits sufren un tiempo de *retardo por propagación*. Este tiempo se ve afectado por el medio físico por el cual están siendo transmitidos los bits (fibra óptica, cables de pares trenzados de cobre, coaxial, etc.) y la longitud del camino entre los nodos.

Pérdida de paquetes: 

En el momento que el paquete debe ponerse en el buffer para ser transmitido al link, puede suceder que el buffer no tenga suficiente memoria para guardarlo, en tal caso la acción que se toma es eliminar el paquete, es decir el paquete se pierde en ese nodo y no es transmitido a ningún sitio.

_Martín Bermúdez_


## Ancho de banda digital

## Comando traceroute



## Capas de protocolos



## Encapsulamiento



## Preguntas

## Preguntas

## Preguntas

## Referencias


