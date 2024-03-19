# Tareas Programadas

Antes de hacer cualquier tarea programada, debemos saber lo siguiente:

- Usar siempre rutas absolutas para especificar los scripts, ficheros de entrada, de salida, etc. (Ej: /etc/apt/sources.list , /home/alumno/bashrc)

- Usar redirecciones para almacenar en ficheros los mensajes y datos de salida (stdout) y/o errores (stderr) si deseas conservarlos al finalizar la tarea. Si hubiera entradas por teclado, como evidentemente no va a ser posible usarlo, deberíamos redirigir también la entrada (stdin).

- Al no ejecutarse las tareas en terminales "normales", no podemos confiar en que cargue la configuración que hayamos indicado en nuestra shell habitual, así que NO debemos usar variables de entorno propias, alias o cualquier otro tipo de configuración que se ejecuta al iniciar la shell.

## Linux

### Tareas por tiempo (puntuales)

En Linux no suelen venir instaladas aplicaciones para esto, por ello el paquete más importante de estos es el llamada "at". Normalmente at suele ser invocado con varias formas:
 
- Formato (horas): 12H AM/PM o también formatos especificos como `noon (12:00)`, `midnight (0:00)`, etc.
- Formato (fecha): La más comun, la japonesa, hecha de ña siguiente manera: `YY-MM-DD`, aunque hay más formatos
- Formato (lenguaje natural): Esto solo funcioan en inglés `next month (siguiente mes)`, `now + 10 min (desde ahora + 10 minutos)`, `next week - 2 days (la próxima semana - 2 días)`

Una vez que se ha invocado el at, se nos abre una pequeña terminal, en la cual podemos jugar con at. Podemos salir de el simplemente pulsando `CTRL + D`. Vease en este ejemplo

```
at 18:00 tomorrow

at> who  >> ~/usuarios.txt 2>> ~/usuarios.err
at> last >> ~/usuarios.txt 2>> ~/usuarios.err

Ctrl+D
```

También existe la posibilidad de escribir una tarea en una sola linea, sin el interprete, pero hay que tener cuidado con usar bien los comandos. Hay varias opciones para crear una tarea en una sola línea:

- <<< + " "

En el siguiente caso se utiliza para almacenar la dirección 

```
at now + 10min <<< "uptime > ~/carga.txt 2> carga.err"
```

- echo + |

```
echo "uptime > ~/carga.txt 2> carga.err" | at now + 10min
```

- En el caso de querer usar scripts, lo hacemos con -f

```
at next month + 1 day -f ~/scripts/copia_seguridad.sh >> ~/backup.txt 2>> ~/backup.err
```

- Ejemplo hecho en los ejercicios de clase

```bash
"Guardar en un fichero llamado "cargaNextMonday.txt" situado en el HOME la carga del sistema el próximo lunes a las 2:00 am"

at 2:00 next Monday <<< "uptime > ~/CargaNextMonday.txt"
```


Otras opciones utiles con at son:

- `atq` o `at -l`: Lista todas tareas programadas
- `at -c (id de la tarea)`: Mostrar los detalles de la tarea con ID especificado
- `atrm X (id de la tarea)`: Borra la tarea especificada

Podremos descubir más de at con el comando `man at`


### Tareas por tiempo (repetitivas)

En este caso, usaremos el programa crontab. Este es un poco más extenso que at, y se utiliza de la siguien manera: debemos colocar `crontab -e`. Esto nos abre un pequeño editor de texto (como Vi o Nano). Dentro de el tendremos un menú como este:

![alt text](image.png)

Al final del documento podemos observar una siglas. Estos seran los datos que debemos indicarle a crontab para que ejecute el comando cuando queramos: 

![alt text](image-1.png)

- `m`: minutos (de 0 a 59)
- `h`: horas (de 0 a 23)
- `dom`: día del mes (del 1 al 31, dependiendo del mes)
- `mon`: mes (de 1 a 12)
- `dow`: día de la semana (0: domingo, 1: lunes, 2: martes, 3: miercoles, 4: jueves, 5: viernes, 6: sábado) 
- `command`: comando o script a ejecutar

Dentro de estos parametros, entraran unos valores los cuales pueden ser indicados de las siguientes formas:

- `*`: Cualquier valor 
- `-`: Para indicar rangos. Ej: 4-8 (entre 4 y 8, incluyendolos)
- `,`: Para indicar Listas. Ej: 1,2,3
- `/`: Para indicar Intervalors. Ej: */5 (cada cinco veces --> 0,5,10...)
- Se pueden hacer combinaciones de lo simbolos anteriormente nombrados. Ej: 6-12/2 (l rango entre 6 y 12 de 2 en 2)


- Ejemplos hechos en clase

```bash
"Borrar todos los ficheros más antiguos de 30 días a las 3 de la mañana todos los días 10, 20 y 30 de cada mes"
# m h  dom      mon dow   command
  0 3  10,20,30 *   *     find / -type f -atime +30 --exec rm {} \;


"Guardar en un fichero llamado "carga30min.txt" situado en el HOME la carga del sistema cada 30 minutos de forma indefinida"
# m h  dom mon dow   command
  */30 *   *   * uptime >> ~/CargaCada30min.txt


"Usar un script para borrar ficheros temporales todos los días a las 12:15"
#m  h  dom mon dow  cmd
15  12  *   *   *   ~/borrar_temporales.sh >> ~/borrar_temporales.out 2>> ~/borrar_temporales.err

"Guardar la carga cada 20 minutos de 8:00 a 19:40 de lunes a viernes durante los días impares de la primera quincena de los meses de febrero mayo, junio y septiembre"
# m    h      dom     mon    dow  cmd
 */20  8-19  1-15/2  2,5,6,9  1-5  uptime >> ~/carga.txt
```


Aunque no se use tanto, tambien existe la posibilidad de indicarle a crontab, ciertos atajos tales como `@hourly`, `@daily`, `@weekly`, etc


- Operaciones utiles con contrab:
    - `crontab -l`: Listar tareas
    - `crontab -r`: Borrar todas las tareas

Comando Watch: El `watch` nos permite ver las salidas en pantalla de los comandos, con el tiempo determinado que hayamos programado para que se muestre. Ej: `watch -n 1 -d ps aux` (simular top ejecutando el comando ps cada segundo, mostrando las diferencias). Las opciones que ofrece este comando son:

- `n (segundo que se le indiquen)`: ejecuta el comando cada X segundos
- `n -d`: resalta las diferencias en la salida
- `n -p`: aumenta la precisión en el cálculo de los intervalos de tiempo




### Tareas por evento

- `batch`: Esta dentro de at y ejecuta tareas cuando la máquina tiene poca carga
- `incron`: Sirve para ejecutar una tarea cuando se borra, crea o cambia un archivo
- `@reboot`: Para tareas relacionadas con el arranque de la máquina


## MS Windows

En Windows se usa `schtasks` para todo tipo de tareas, veamos esta tarea por partes como ejemplo:

```
"Abrir la calculadora a las 20:38"

schtasks /create /sc once /st 20:38 /tn tarea1  /tr c:\Windows\System32\calc.exe
```

- `/create`: Crea la tarea
- `/sc (once: para tareas puntuales) (daily: para tareas diarias) (weekly: para tareas semanales) (monthly: para mensuales) (onstar: al iniciar el sistema), (onlogon: al abrir sesión), (onidle: cuando hay baja carga en el sisytema)`: Para indicar pla periocidad de la tarea
- `/st 20:38`: Indica la hora de inicio
- `/tn tarea1`: Indica nombre de la tarea
- `/tr c:\Windows\System32\calc.exe`: Indica la ruta de la aplicación a ejcutar

Para averiguar la ruta de alguna aplicación, podemos usar el comando where junto al nombre de la app. Ej: `where calc.exe --> c:\Windows\System32\calc.exe`



## Extras

### Comandos a usar para la seccion de comando en las tareas

Procesos del sistema
- `ps (aux , fea, -p, ...)`
- `pstree`
- `pidof`
- `pgrep`
- `top / htop (btop, ...)`
- `iotop`
- `uptime`
- `kill / pkill / killall / xkill (-l, -9, -15, ..., -INT, -KILL, -TERM, -STOP, -TSTP, -CONT, -USR1, -USR2,  ...)`
- `sleep`
- `trap 'comandos' SIGNALs`
- `nice`
- `renice`
- `nohup`
- `disown (-h, -a, -r)`

Procesos en primer plano (foreground) y segundo plano (background):
- `jobs (-l, ...)`
- `cmd &`
- `bg`
- `fg`
- `Ctrl+Z`

Usuarios / grupos
- `useradd (-m, -g, -G, -s, -d, -k, ...)`
- `usermod (-m, -g, -G, -aG, -l, -s, -d, -L, -U, ...)`
- `userdel (-r, -f, ...)`
- `passwd (-l, -u, -S, ...)`
- `adduser, deluser`
- `groupadd, groupmod, groupdel`
- `addgroup, delgroup`
- `getent (passwd, group, ...)`
- `id`
- `groups`
- `chown`
- `chgrp`
- `chfn`
- `chsh`
- `chage (-E, -M, -m, -I, -W, ...)`
- `chpasswd`
- `chgpasswd`
- `newgrp`
- `sudo`
- `su -`
- `w`
- `who`
- `users`
- `last`
- `pinky`
- `getfacl`
- `setfacl (-m u:user:perm, ...)`

### Tabla Resumen de tareas programas (Windows/Linux)

| Tipo                                   | GNU/Linux                       | MS Windows (cmd)                          |
|----------------------------------------|---------------------------------|-------------------------------------------|
| Por tiempo (tareas puntuales)          | at (-c, atq, atrm)              | schtasks (/sc ONCE)                       |
| Por tiempo (tareas repetitivas)        | crontab (-l, -e)<br>anacron, ...| schtasks (/sc HOURLY, DAILY, MONTHLY, etc.)|
| Por evento (baja carga)                | batch                           | schtasks (/sc ONIDLE)                     |
| Por evento (arranque)                  | crontab (@reboot)<br>update-rc.d  | schtasks (/sc ONSTART)                    |
| Por evento (logon, cualquier usuario)  |/etc/profile.d/                  | schtasks (/sc ONLOGON)<br>shell:common startup|
| Por evento (login, usuario concreto)  |$HOME/.profile<br>$HOME/.bashrc  | shell:startup                             |
| Por evento (cambio en directorios,<br>ficheros,...)| incron            |                                          |
| Por evento (otros eventos)             | Programación propia             | schtasks (/sc ONEVENT)                    |




