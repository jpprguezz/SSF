# Ejercicio B

1. Ejecutar el comando ps aux e indicar qué significa cada columna. ¿Qué estados puede tener un proceso y qué significa cada uno? (si se tienen dudas, usar man ps o ps --help)

```
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  1.6  0.1 166360 11744 ?        Ss   15:32   0:01 /sbin/init sp
```

`USER` --> Usuario
`PID` --> Numero que representa el ID del proceso
`%CPU` --> Utilizacion de CPU en procentaje y en formato "##.#"
`%MEM` --> Relación entre el tamaño del proceso y la memoria física de la máquina, en porcentaje.
`VSZ` --> Tamaño de la memoria virtual del proceso en KiB (1024)
`RSS` --> Tamaño del conjunto residente, la memoria física no intercambiada que ha utilizado una tarea (en kilobytes).
`TTY` --> Consola donde se esta ejecutando el proceso
`STAT` --> Estado del proceso
`START` --> Hora a la que inició el proceso
`TIME` -->  Cantidad de tiempo total que el proceso se ha estado ejecutando
`COMMAND` --> Nombre del proceso

Tipos de estados: (Por ver)


2. Ejecutar el comando uptime. ¿Qué significa cada uno de los datos que muestra y qué información puedo obtener de ellos?

```
16:00:10 up 27 min,  1 user,  load average: 0,10, 0,08, 0,15
```
`16:00:10` --> Hora
`up 27 min` --> Cuanto tiempo ha estado funcionando el sistema
`1 user` --> Cuantos usuarios hay conectados
`load average: 0,10, 0,08, 0,15` --> La carga media desde el minuto 1, 5 y 15 respectivamente
