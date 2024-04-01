# Procesos y Threads

## Introducción

- Entender la ejecución de aplicaciones es clave para la administración del equipo.
- Recursos limitados (CPU, RAM, etc.) requieren una distribución eficiente.

## Conceptos iniciales: Proceso, thread y tarea

- Proceso: aplicación en ejecución con recursos asociados.
  - Inicia al ejecutar la aplicación.
  - Cargado en memoria RAM.
- Thread: unidad de procesamiento más pequeña.
  - Ejecuta las instrucciones cargadas en memoria.

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

    <img src="images/proceso.png">

## Estado de los procesos

- Procesos pueden tener diferentes estados.
  - En ejecución, en espera, detenido, etc.
- No todos los procesos en memoria se ejecutan simultáneamente.

## Prioridad de los procesos

- Planificador decide qué procesos ejecutar.
- Considera la prioridad asignada a cada proceso.
- La prioridad indica la importancia del proceso y puede cambiar dinámicamente.


# Instalación Software 

## Definición

- Conjunto de programas distribuidos conjuntamente.
- Funcionalidades complementarias entre programas.
- Instalación mediante Sistemas de Gestión de Paquetes (SGP).

## Sistema de Gestión de Paquetes

- Automatiza la instalación.
- Maneja dependencias.
- Interfaz mediante comandos o entornos gráficos.

## Información en el Nombre del Paquete

- Tipo de paquete según extensión (.deb, .rpm, .tar.gz, .cab, etc.).
- Información sobre versión, sistema, estado, idioma, etc.

## Tipos de Paquetes

- **.deb (Debian):** Para distribuciones basadas en Debian (Ubuntu, Mint).
- **.rpm (RedHat Package Manager):** Para distribuciones basadas en RedHat (CentOS, Fedora, OpenSuse).
- **.tar.gz, .tar.xz, .tgz, tar.bz2, etc.:** Ficheros empaquetados/comprimidos, común para distribuir contenido almacenado en texto (código, documentación).
- **.cab:** Paquetes para Microsoft Windows. Menos común, generalmente acompañados por instaladores (.msi, .exe).
- **Otros menos comunes:** .apk (Alpine Linux y Android), .eopkg (SolusOS), .xbps (Void Linux), etc.

### Conversiones

- Algunas utilidades (ej. "alien") permiten convertir paquetes de un formato a otro.

## Ciclo de Vida del Software

### Fases

- **Nightly:** Versión compilada automáticamente cada noche, incompleta y con fallos. Principalmente para colaboradores o evaluación preliminar.
- **Pre-alpha:** Versión de prueba muy preliminar, generalmente para uso interno de desarrolladores o empresas.
- **Alpha:** Versión de prueba con casi todas las funcionalidades implementadas, pero no testeada en profundidad.
- **Beta:** Versión con todas las funcionalidades implementadas, pero aún en fase de prueba antes de ser liberada.
- **RC (Release Candidate):** Versión considerada candidata a la versión final, después de pasar pruebas y no detectar errores significativos durante un tiempo.
- **RTM/RTW (Release to Manufacture/Web):** Versión final enviada para fabricación o publicada en la web. No tan común actualmente.
- **GA (General Availability) o Gold:** Versión final liberada al público sin etiquetas adicionales.
- **LTS (Long Term Support):** Versión final con soporte extendido, recomendada para servidores debido a su estabilidad y soporte prolongado.
- **ESM (Extended Security Maintenance):** Algunos ofrecen mantenimiento extendido de seguridad como un extra (generalmente de pago).

### Arquitectura (de Procesador)

- amd64, x86_64 (64 bits), x86, i386, i486, i586, i686, i786 (32 bits), arm64, aarch64 (procesadores ARM), noarch, all (independiente de arquitectura).

### Idioma/País

- Ejemplos: Español (es, es_ES, es_MX), Inglés (en, en_US, en_UK).

## Sistema de Versiones

### Esquemas de Versiones

- X.Y.Z (major.minor.revision), X.Y.P.B (major.minor.patch.build).
- X (major): Importantes características nuevas.
- Y (minor): Pequeñas o medianas nuevas funcionalidades, generalmente conservando compatibilidad.
- Z (revision o patch): Pequeñas modificaciones o revisiones, para corregir errores.

### Ejemplos

- 10.5.2, 5.2.12.234, 7.3.4-335.

### Codename

- Asignación de nombres claves a versiones, ejemplos: Android con "chucherías", Ubuntu con animales, Linux Mint con nombres de mujeres.

### Por Calendario (calVer)

- Ejemplos: Ubuntu 20.04 (abril 2020), Linux Mint 19.2 (tercera versión 2019).

### Entorno de Uso

- Desktop, Server, IoT (internet of things), Cloud, Mobile.

## Otra Información

- -dev (versión para desarrolladores)
- -src (código fuente),
- stripped/unstripped
  - stripped: versión del software donde se han eliminado símbolos y datos no esenciales para reducir el tamaño del ejecutable.
  - unstripped: Hace referencia a la versión que conserva todos los detalles, útil para propósitos de depuración y análisis.
  - Estable: Versión del software considerada sólida y confiable para uso general.
  - Testing (Pruebas): Una versión en fase de pruebas antes de ser etiquetada como estable.
  - Inestable: Versión en desarrollo, potencialmente con errores y no apta para uso en producción.
  - Deprecated: Indica que el software o una característica específica está desaconsejada y posiblemente será eliminada en futuras versiones.
  - DSFG (Debian Free Software Guidelines): Estándares utilizados por el proyecto Debian para determinar si un software es software libre o no.

## Relaciones entre Paquetes

### Dependencias

- **Dependencia (depends):** Software a instalar basado en otros paquetes, obligatorio para la ejecución.
- **Recomendación (recommends):** Fuertemente recomendado para tener todas las funcionalidades.
- **Sugerencia (suggests):** Podría añadir funcionalidades útiles, pero no es necesario.
- **Mejora (enhances):** Supone una mejora para otros paquetes.
- **Pre-dependencia (pre-depends):** Paquetes a instalar antes de comenzar la instalación.

# Servicios y Demonios

Los servicios de un sistema operativo y los demonios en entornos UNIX/GNU-Linux son procesos especializados que realizan tareas críticas para el sistema. Aunque el término "servicio" se asocia comúnmente con MS Windows, en la actualidad se utiliza en diversos sistemas operativos.

## Características de Servicios y Demonios

- Se ejecutan en segundo plano (background).
- Carecen de interfaz para interactuar con el usuario.
- No utilizan las entradas/salidas estándares del sistema.
- Comunican errores o mensajes a través de registros (logs) o servicios especializados.
- Convención de nombres en UNIX/GNU-Linux: suelen terminar en "d" para distinguirse de aplicaciones clientes.
- Realizan tareas esenciales del sistema, como control de hardware, red, energía, sonido, impresión, ejecución programada de tareas, interrupciones, etc.
- Residentes y siempre en ejecución desde el inicio del sistema operativo.
- Gestionados y controlados por el sistema operativo.
- Suelen ejecutarse con privilegios de superusuario en GNU/Linux.
- Muchos tienen como padre al proceso init (PID 1).
- La seguridad es crítica; algunos inician como root y luego cambian al usuario efectivo para minimizar riesgos.
- Es fundamental mantener activos solo los servicios necesarios por razones de seguridad.

## Gestión de Servicios

- Gestionados por el sistema operativo o administrador de servicios (en Windows).
- Deben proporcionar operaciones básicas como consulta de estado, inicio, paro, etc.
- Implican ciertos protocolos y requisitos de funcionamiento.
- La instalación de aplicaciones de terceros puede añadir servicios asociados.
- Es común tener varios servicios instalados, aunque no todos estarán activos.