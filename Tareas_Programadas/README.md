
### Linux

- Guardar en un fichero llamado "cargaNextMonday.txt" situado en el HOME la carga del sistema el próximo lunes a las 2:00 am
```bash
at 2:00 next Monday <<< "uptime > ~/CargaNextMonday.txt"
```

- Guardar en un fichero llamado "cargaAllMondays.txt" situado en el HOME la carga del sistema TODOS los lunes a las 2:00 am
```bash
#   m h  dom mon dow   command
    0 2  *   *   1     uptime >> ~/CargaAllMonday.txt 
```

- Guardar en un fichero llamado "carga30min.txt" situado en el HOME la carga del sistema cada 30 minutos de forma indefinida

```bash
# m h  dom mon dow   command
  */30 *   *   * uptime >> ~/CargaCada30min.txt
```

- Borrar todos los ficheros más antiguos de 30 días a las 3 de la mañana todos los días 10, 20 y 30 de cada mes

```bash
# m h  dom      mon dow   command
  0 3  10,20,30 *   *     find / -type f -atime +30 --exec rm {} \;
```

- Realizar los siguientes pasos (crea un script con nombre "miscript.sh" en tu HOME que simplemente imprima la fecha en el formato: "Ahora mismo son las HH:MM del día DD/MM/YYYY"). En cada tarea haz que la salida se añada a un fichero llamado "datos_fecha.txt" localizado en tu HOME.
```bash
<at> ./miscript.sh > datos_fecha.txt
```
- Ejecutar el script "~/miscript.sh" en 12 horas a partir de ahora.

```bash
at now + 12 hours
```
- Ejecutar el script "~/miscript.sh" a las horas en punto de 8:00 a 12:00 (ambas inclusive) los fines de semana de febrero a abril (ambos inclusive)

```bash
# m h    dom mon dow   command
  0 8-12 * 2-4 6,7 ~/miscript.sh >> datos_fechas.txt
```
- Ejecutar el script "~/miscript.sh" justo en una semana a partir de ahora.

```bash
# ejecutas at
at now +1 week 

# una vez ejecutado, escribes en at:
echo "./miscript.sh > datos_fecha.txt"
```
- Ejecutar el script "~/miscript.sh" cada 4 horas durante los diez primeros días de cada mes.

```bash
# m h    dom  mon dow   command
  0 */4  1-10 *   *     ~/miscript.sh >> datos_fechas.txt
```
- Ejecutar el script "~/miscript.sh" sólo cuando la carga baje de 1.5
- Mostrar que las ejecuciones están programadas y esperando para ejecutarse
- Eliminar/comentar todas las ejecuciones programadas


### Windows