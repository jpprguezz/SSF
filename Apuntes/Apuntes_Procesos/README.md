### Comandos utilizados con los procesos (Linux)

## Comandos para gestionar procesos

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

        SIGSTOP (17): Parar el proceso desde el teclado (CCtrl+Z)

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


## Procesos en primer plano (foreground) y segundo plano (background):

- `jobs` (opciones: -l, ...): Muestra trabajos en segundo plano.

- `*comando que se quiera ejecutar* &`: Ejecuta un comando en segundo plano.

- `bg`: Pone trabajos en segundo plano.

    - El comando funciona asi (usando de ejemplo el programa xeyes)
        1. Colocas el comando xeyes
        2. Colocas Ctrl+Z para que el programa se detenga y sea mandado a segundo plano
        3. Una vez ya con la terminal libre, colocas bg y el programa funcionará (se tendrá que colocar bg tantas veces como progrmas abiertos haya. Ej: Hay 5 xeyes, colocamos 5 veces bg)

- `fg`: Pone trabajos en primer plano (Simplemente cuando el programa esta en segundo plano, al colocar fg pasa a primer plano).

- `Ctrl+Z`: Detiene un trabajo y lo coloca en segundo plano.