## Pruebas - Proyecto API Candy Soft

**API CandySoft** es una solución integral diseñada para optimizar la gestión de Candy Nails Spa, un negocio dedicado al diseño y cuidado de uñas. El sistema permite organizar de forma eficiente procesos como reservas de citas, manejo de insumos, control de servicios y gestión de cobros, ofreciendo una solución práctica y adaptable para la operación del negocio.

---
## Índice

- [1. Descripción de los módulos](#descripción-de-los-módulos)
- [2. Herramientas utilizadas](#herramientas-utilizadas)
- [3. Instalición y configuración](#paso-a-paso-instalación-y-despliegue)
  - [Clonar repositorio](#1-clonar-repositorio)
  - [Configurar archivo .env](#2-configurar-archivo-env)
  - [Crear y activar entorno virtual](#3-crear--y-activar-entorno-virtual)
  - [Instalar dependencias](#4-instalar-dependencias)
  - [Importar bd con el archivo SQL](#5-importar-bd-con-el-archivo-sql)
    - [Migrar base de datos (opción recomendada)](#51-migrar-base-de-datos-opcion-recomendada)
- [4. Ejecutar pruebas unitarias](#ejecutar-pruebas-unitarias)
## Descripción de los módulos
 
- **Módulo insumo**: Supervisa el inventario de productos y materiales, controlando existencias, entradas y salidas, y generando alertas para reposición cuando sea necesario. 
- **Módulo Manicurista**: Administra la información del personal encargado de realizar los servicios a los clientes, incluyendo datos de contacto, disponibilidad y asignación de citas.
- **Módulo Cliente**: Gestiona los datos de los clientes y les permite consultar sus citas previas, así como visualizar las citas programadas, brindando una experiencia más organizada y accesible. 
- **Módulo Proveedor**: Registra y controla la información de los proveedores de insumos, facilitando la gestión de pedidos y asegurando el abastecimiento oportuno.
- **Módulo Servicio**: Organiza y actualiza los detalles de los servicios ofrecidos, incluyendo descripción, precio e imagen de referencia, para mantener una oferta clara y precisa 

---

## Herramientas utilizadas  

Para garantizar el correcto funcionamiento y la ejecución óptima del sistema, se cuenta con la instalación previa de las siguientes herramientas, las cuales son esenciales para la implementación y operación del proyecto:

- **Visual Studio Code** (Editor de código que permite escribir, depurar y gestionar el desarrollo de la aplicación)  
  [Descargar](https://code.visualstudio.com/download)
  
- **Python** (Lenguaje de programación usado para implementar la lógica del sistema)   
  [Descargar](https://www.python.org/downloads/)  

- **MySQL** (Sistema gestor de base de datos para almacenar y administrar la información)  
  [Descargar](https://dev.mysql.com/downloads/)  

- **Git** (Herramienta para clonar el repositorio)  
  [Descargar](https://git-scm.com/downloads)  



---

## Paso a paso: instalación y despliegue
## 1. Clonar repositorio  

Opción A: Usando GitHub
1. Ingresa al repositorio y haz clic en el botón **Code**.  
2. Copia el enlace HTTPS.  
3. Abre **Visual Studio Code (VS Code)**, ve a Source Control y selecciona Clonar repositorio..  
4. Pega el enlace y elige la carpeta donde guardarás el proyecto.  
5. Luego se mostrará un mensaje preguntando si desea abrir el proyecto, haz click en **Abrir** y **VS Code** abrirá automáticamente el proyecto.  

Opción B: Descargar ZIP  
1. Ingresa al repositorio y haz clic en el botón **Code**.  
2. Selecciona la opción **Download ZIP** (Se descagará el proyecto comprimido en tu dispositivo).    
3. Extrae el archivo y ábrelo en **VS Code**. 

---

## 2. Configurar archivo .env
1. Crea el archivo dentro de la carpeta **apiCandySoft.**  
2. Copia y pega el siguiente código.
3. Cambia "tu_contraseña" por la contraseña de tu usuario MySQL. Si tu usuario NO tiene contraseña, deja este campo vacío.
4. Verifica el puerto (DB_PORT=3309), si tu MySQL corre en otro puerto cambia este valor para que coincida con tu configuración.

```bash
SECRET_KEY='django-insecure-$=ae#$xpmjkw=7v&&0kv@$a)j+o9ti%u%z+tygd#3nzju=pajc'
DEBUG=True

DB_ENGINE=django.db.backends.mysql
DB_NAME='CandySoftApi'
DB_USER='root'
DB_PASSWORD='tu_contraseña'
DB_HOST=127.0.0.1
DB_PORT=3309

EMAIL_HOST='smtp.gmail.com'
EMAIL_PORT=587
EMAIL_USE_TLS=True
EMAIL_HOST_USER='candysoftpruebaapi@gmail.com'
EMAIL_HOST_PASSWORD='ikyp huvb lnia zekw'

IMGBB_API_KEY='fec1ab2811dc77a5801a0952fead16'
```
---
## 3. Crear  y activar entorno virtual

1. Ejecuta el siguiente comando en tu terminal para crear un entorno virtual (ten en cuenta que el comando puede variar según tu sistema, pudiendo ser **py** o **python**)
```bash
py -m venv venv
```

2. Para activar el entorno virtual, ejecuta el siguiente comando en tu terminal (asegúrate de estar utilizando PowerShell):
```bash
.\venv\Scripts\activate
```
---
## 4. Instalar dependencias

1. Ejecuta el siguiente comando para instalar todas las dependencias definidas en el archivo requirements.txt
```bash
pip install -r requirements.txt
```
## 5. Importar bd con el archivo SQL

1. Ejecuta el siguiente comando en tu gestor de base de datos MySQL para crear una base de datos vacía
```bash
CREATE DATABASE CandySoftApi;
```
2. Ejecuta el siguiente comando en la terminal asegurándote de adaptarlo a tu configuración: verifica y ajusta la ruta del binario de MySQL en caso de que tu versión sea distinta o esté instalada en otro directorio, y reemplaza el puerto por el que tengas configurado en tu servidor MySQL
```bash
Get-Content db_apicandysoft.sql  | 
& "C:\Program Files\MySQL\MySQL Server 9.3\bin\mysql.exe" -u root -p --port=3309 CandySoftApi
```

## 5.1 Migrar base de datos (opción recomendada)

Si bien esta es una segunda opción por si no funciona importar la base de datos con el archivo SQL, es la opción que más recomiendo para garantizar un funcionamiento adecuado

1. Ejecuta el siguiente comando en tu gestor de base de datos MySQL (si primero se intentó importar la BD con el archivo SQL y por algún inconveniente se tuvo que recurrir a esta opción, recomiendo borrar la base de datos y volver a crearla, a menos que haya verificado que no se creó nada dentro de la BD)

```bash
CREATE DATABASE CandySoftApi;
```

2. Desde la terminal, navega hasta la carpeta donde se encuentra el archivo manage.py ejecutando este comando
```bash
cd apiCandySoft
```

3. Ejecuta el siguiente comando en la terminal para aplicar las migraciones (recuerda que el comando puede variar según tu sistema, pudiendo ser **py** o **python**)
```bash
py manage.py migrate
```

- **EN CASO DE ERROR:** En mi caso, al realizar una migración me sale este error "django.db.utils.NotSupportedError: MariaDB 10.5 or later is required (found 10.4.32)". Si te pasa lo mismo ejecuta el siguiente comando, si te aparece un mensaje escribe "Y" y luego vuelve a ejecutar el comando anterior (py manage.py migrate)
```bash
pip uninstall django
pip install "django<4.2"
```

## Ejecutar pruebas unitarias
1. Desde la terminal, asegurese de estar en la carpeta donde se encuentra el archivo manage.py ejecutando este comando
```bash
cd apiCandySoft
```
2. Para comprobar el correcto funcionamiento de los módulos, ejecuta las pruebas unitarias con los siguientes comandos:

- Módulo insumo (Carpeta insumo/tests/)
```bash
py manage.py test insumo.tests.test_insumo
```

- Módulo usuario (Carpeta usuario/tests/)
```bash
py manage.py test usuario.tests.test_manicurista
```
```bash
py manage.py test usuario.tests.test_cliente
```

- Módulo proveedor (Carpeta proveedor/tests/)
```bash
py manage.py test proveedor.tests.test_proveedor
```

- Módulo servicio (Carpeta servicio/tests/)
```bash
py manage.py test servicio.tests.test_servicio
```








