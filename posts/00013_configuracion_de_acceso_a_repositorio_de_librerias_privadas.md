<!--

layout : post
title : Configuración de acceso a repositorio de librerias privadas
description : 
category : devops,ci/cd
tags : devops,ci/cd
comments : true
author : JRichardsz & Bitmanuc
thumbnail_image_url: https://github.com/user-attachments/assets/80517d11-7d52-4214-b2e1-259c2bbc863b
datetime : "2025-05-31"
duration: 00:14:09
sound:
    type : vocaroo_url
    value : https://vocaroo.com/embed/133YoWYudqFk?autoplay=0
    language: es
-->

<p align="center">
  <img src="https://github.com/user-attachments/assets/80517d11-7d52-4214-b2e1-259c2bbc863b" class="sing_post_top_image"/>
</p>

En este podcast se menciono brevemente que alternativas existen para alojar libreria privadas de nuestra empresa:

- Nexus
- Artifactory
- AWS CodeArtifact
- Azure Artifacts
- GitHub Packages
- Google Cloud Artifact Registry
- GitLab Packages

El común denominador es que Nexus y Artifactory pueden ser instalados y configurados en tu servidor y el resto son servicios del tipo SAAS, donde solo pagas y todo esta listo para usar.

Tambien se menciono que archivos se configuran en los 3 lenguages comumente utilizados para el desarrollo de aplicaciones empresariales:

**Maven (Java)**

```
C:\Users\Jane\.m2\repo\settings.xml
```


**Dotnet (C#)**

```
%appdata%\NuGet\NuGet.Config
```


**npm (Node.js)**

```
/Users/Jane/.npmrc
```

Se finalizo mencionando que si se conoce como configurar estos archivos en modo desarrollador (interfaz de usuario), la configuración en un pipeline devops se divide en:

**Servidores 24*7**

Ejemplo: Jenkins. 

En este caso, como no hay interfaz de usuario  y solo tenemos la linea de comandos, lo unico que se hace es crear el archivo usando nano o vim una unica vez en el servidor en las rutas explicadas.

**Servidores efímeros o disposables**

Ejemplo: Github Packages


En este caso, tenemos una pequeña máquina que al finalizar el pipeline es destruido. Por ello, se recomendaría tener estos archivos en una ruta para descargarlos al inicio del pipeline.

Tambien se podrían crear con puros commandos si se conoce su contenido, el cual en los 3 casos es sencillo.

Si se usa docker, se podría crear una imagen base con estos archivos para que los builds ya hereden esta configuración

