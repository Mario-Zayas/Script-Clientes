# Script-Clientes

Escribe un script llamado crear_cliente.sh que va a automatizar la tarea de crear máquinas clientes a partir de la plantilla plantilla-cliente. Este script creará una nueva máquina con el nombre que le indiquemos, con un volumen con el tamaño que le indiquemos y conectada a la red que le indiquemos. El script cambiará el hostname de la máquina para poner el mismo nombre que hemos indicado como nombre de la máquina virtual. La nueva máquina se debe iniciar.

Por lo tanto el script recibe los siguientes argumentos en la línea de comandos:

    Nombre: nombre de la nueva máquina y hostname.
    Tamaño del volumen: Tamaño del volumen que tendrá la nueva máquina.
    Nombre de la red a la que habrá que conectar la máquina.

Para comprobar que funciona:

    Crea un nuevo cliente llamado cliente2 que tenga un volumen de 10G y que esté conectado a la red_intra. La instrucción que debes ejecutar será:

     sh crear_clientes.sh cliente2 10G red_intra

    Comprueba que la máquina está funcionando, y que ha tomado direccionamiento de red de forma dinámica.
