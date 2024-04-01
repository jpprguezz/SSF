## Recursos de los procesos
- Espacio de memoria asignado por el sistema operativo.
- Tiempo de ejecución en CPU asignado dinámicamente.
- Otros recursos: descriptores de ficheros, pilas de ejecución, espacio en disco, dispositivos, etc.
- Identificador de Proceso único (PID).
- Asociado a un usuario con niveles de privilegios.

## MultiProceso y MultiThreading
- Multiproceso:
  - Varios procesos ejecutan la misma tarea.
  - Puede generar duplicación de memoria.
- Multithreading:
  - Un proceso tiene varios hilos de ejecución.
  - Comparten la misma memoria, reduciendo duplicación.
  - Aumenta complejidad de gestión.

## Estado de los procesos
- Procesos pueden tener diferentes estados.
  - En ejecución, en espera, detenido, etc.
- No todos los procesos en memoria se ejecutan simultáneamente.

## Prioridad de los procesos
- Planificador decide qué procesos ejecutar.
- Considera la prioridad asignada a cada proceso.
- La prioridad indica la importancia del proceso y puede cambiar dinámicamente.

## Comandos utilizados con los procesos (Linux)

### Comandos para gestionar procesos

- `ps` (opciones: aux, fea, -p, -o, ...): Muestra información sobre los procesos en ejecución.

    - Explicación de cada columna del comando ps -aux

        ```
        USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
        root           1  0.1  0.1 168184 13516 ?        Ss   19:32   0:06 /sbin/init sp

        - USER: El usuario que inició el proceso.

        - PID: El ID del proceso.

        - %CPU: El porcentaje de CPU utilizado por el proceso.

        - %MEM: El porcentaje de memoria utilizada por el proceso.

        - VSZ: Tamaño virtual de la imagen del proceso en (KiB).

        - RSS: Tamaño de la memoria física que el proceso está utilizando (KiB).

        - TTY: Terminal asociado con el proceso.

        - STAT: Estado del proceso. Puede ser S (Sleeping), R (Running), Z (Zombie), etc.

        - START: Hora de inicio del proceso.

        - TIME: Tiempo de CPU utilizado por el proceso.

        - COMMAND: Nombre del comando que inició el proceso.
        ```
- `pstree`: Muestra la jerarquía de procesos en forma de árbol.

- `pidof`: Muestra los PIDs de los procesos que coinciden con un programa.

- `pgrep`: Muestra los PIDs de los procesos que coinciden con un patrón.

- `top` / `htop` (`atop`, `btop`, ...): Muestra una lista dinámica de los procesos y sus estadísticas.

- `uptime`: Muestra el tiempo que ha estado encendido el sistema y la carga promedio.

- `kill` / `pkill` / `killall` / `xkill` (opciones: -l, -9, -15, ..., -INT, -KILL, -TERM, -STOP, -TSTP, CONT, -USR1, -USR2, ...): Envía señales a procesos o usuarios.

    - Señales entre procesos

        ```
        SIGTERM (15): señal de terminación, se envía por defecto cuando no se especifica ninguna señal.

        SIGINT (2): Interrupción por teclado (Ctrl+C)

        SIGKILL (9): Matar el proceso (NO se puede ignorar)

        SIGSTOP (17): Parar el proceso desde el teclado (Ctrl+Z)

        SIGTSTP (18): Parar el proceso (NO se puede ignorar)

        SIGCONT (19): Continuar proceso parado

        SIGUSR1 (10): Señal definida por el usuario

        SIGUSR2 (12): Señal definida por el usuario
        ```

- `sleep`: Pausa la ejecución durante un intervalo de tiempo especificado.

- `trap 'comandos' SIGNALs`: Captura señales y ejecuta comandos asociados.

- `nice` / `renice`: Controla la prioridad de los procesos.

- `nohup` / `disown` (opciones: -h, -a, -r): Ejecuta procesos de manera que persistan incluso si se cierra la terminal.

- `ulimit`: Establece límites para recursos del sistema.


### Procesos en primer plano (foreground) y segundo plano (background):

- `jobs` (opciones: -l, ...): Muestra trabajos en segundo plano.

- `*comando que se quiera ejecutar* &`: Ejecuta un comando en segundo plano.

- `bg`: Pone trabajos en segundo plano.

    - El comando funciona asi (usando de ejemplo el programa xeyes)
        1. Colocas el comando xeyes
        2. Colocas Ctrl+Z para que el programa se detenga y sea mandado a segundo plano
        3. Una vez ya con la terminal libre, colocas bg y el programa funcionará (se tendrá que colocar bg tantas veces como progrmas abiertos haya. Ej: Hay 5 xeyes, colocamos 5 veces bg)

- `fg`: Pone trabajos en primer plano (Simplemente cuando el programa esta en segundo plano, al colocar fg pasa a primer plano).

- `Ctrl+Z`: Detiene un trabajo y lo coloca en segundo plano.

### Ejecuciones en Primer Plano (foreground) y Segundo Plano (Background)
- Ejecución en primer plano (foreground) bloquea la terminal.

- Ejecución en segundo plano (background) permite seguir usando la terminal.

- Se usa el símbolo `&` al final del comando para ejecutar en segundo plano.

- Redirección de salida y errores para evitar interrupciones: `cmd > salida_cmd.txt 2> errores_cmd.txt &`

## Prioridades de los procesos en GNU/Linux
- 140 niveles de prioridad (0 - 139).
- Se dividen en:
  - 0 - 99: Prioridad en tiempo real, reservada al sistema.
  - 100 - 139: Prioridad de usuario (mapeada a 0-39).
- Comandos `nice` y `renice` para modificar la prioridad de los procesos.

## Cómo ejecutar procesos aún si se cierra la shell o la terminal
- Todos los procesos tienen un proceso padre.
- `nohup` al lanzar el proceso o `disown` si ya se ejecutó para evitar cierre con la terminal.

### Cosas sueltas

- find / -name "*" > `/dev/null` --> el directorio `null `  sirve para redirigir la salida y que no salga por pantalla
- `nohup aragorn > ~/aragorn.out 2> ~/aragorn.err &` --> ejecutará el programa "aragorn" en segundo plano, ignorando la señal de cierre, y redirigirá tanto la salida estándar como la salida de error estándar del programa hacia archivos específicos (el `2>` se usa para indicar la salida de error al archivo que queramos y el `.out` indica la salida que de el comando)


## Comandos utilizados con los procesos (Windows)

### Obtener la lista de procesos en Windows: `tasklist`
- Ayuda: `tasklist /?`
- Todos los procesos: `tasklist`
- Detalles de todos los procesos: `tasklist /v`
- Filtrar por nombre, estado, PID, y más.

### Ejemplos de Filtros
- Nombre del ejecutable que empiece por "calc": `tasklist /fi "IMAGENAME eq calc*"`
- Procesos en ejecución: `tasklist /fi "STATUS eq running"`
- Procesos relacionados con "firefox": `tasklist /m /fi "IMAGENAME eq firefox.exe"`
- Por PID específico, e.g., 508: `tasklist /fi "PID eq 508"`
- Varios filtros combinados: `tasklist /fi "PID gt 1000" /fi "STATUS eq RUNNING" /fi "MEMUSAGE lt 10240"`

## Comando alternativo: `wmic`
### Ejemplos `wmic`
- Información sobre el proceso con PID 1234: `wmic process where processid="1234"`
- Nombre del ejecutable con PID 1234: `wmic process where processid="1234" get name`
- Detalles del proceso con PID 1234: `wmic process where processid="1234" get name,description,status,parentprocessid,threadcount`
- Obtener PID de "svchost.exe": `wmic process where name="svchost.exe" get processid`
- Lista de campos disponibles: `Caption`, `CommandLine`, ...

## Finalizar procesos: `taskkill`
- Ayuda: `taskkill /?`
- Terminar por PID: `taskkill /fi "PID eq 1234"` o `taskkill /PID 1234`
- Forzar terminación por PID: `taskkill /f /PID 1234`
- Terminar con procesos hijos: `taskkill /t /PID 1234`
- Terminar por nombre: `taskkill /fi "IMAGENAME eq notepad.exe"` o `taskkill /IM notepad.exe`

### Ejemplos de Filtros
- Sintaxis similar a `tasklist`.

## Prioridades en Windows
- Prioridades: idle, below normal, normal, above normal, high priority, realtime

### Cambiar prioridad al ejecutar
- Ejemplo para notepad: `start "" /AboveNormal notepad.exe`
- Opciones: /low, /BelowNormal, /normal, /AboveNormal, /high, /RealTime

### Cambiar prioridad en ejecución
- Por PID, e.g., 1234: `wmic process where processid="1234" CALL setpriority "Above normal"`
- Por nombre, e.g., notepad: `wmic process where name="notepad.exe" CALL setpriority "Normal"`

### Obtener prioridad en ejecución
- Por PID, e.g., 1234: `wmic process where processid="1234" get priority`
- Por nombre, e.g., notepad: `wmic process where name="notepad.exe" get priority`