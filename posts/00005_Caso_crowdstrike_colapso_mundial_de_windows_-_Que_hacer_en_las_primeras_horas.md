<!--

layout : post
title : Caso crowdstrike colapso mundial de windows ¿Que hacer en las primeras horas?
description : Conversaremos sobre las variables de entorno y su uso en devops
category : devops
tags : devops
comments : true
author : JRichardsz & Bitmanuc
thumbnail_image_url: https://github.com/user-attachments/assets/5ce0ef49-8ebb-4f41-8462-0ef3ddce75c8
datetime : "2024-07-21"
duration: 00:36:28
sound:
    type : vocaroo_url
    value : https://vocaroo.com/embed/1hOeu4OzqQsW?autoplay=0
    language: es
-->

<p align="center">
  <img src="https://github.com/user-attachments/assets/5ce0ef49-8ebb-4f41-8462-0ef3ddce75c8" />
</p>

<br>

En este podcast hemos conversado sobre que hacer ante una situacion similar al Caso crowdstrike que ocasiono un colapso mundial en todas las máquinas que usa el sistema operativo windows.

Especificamente solo vamos a tocar la corrección y no la investigacion ya que puede ser crítico (hospitales, aeropuertos, etc). En un siguiente podcast, conversaremos sobre como encontrar la causa del error, alternativas que pueden haber evitado este error, etc

En resumen, lo que recomendamos es:

- Validar si el error es un caso aislado de muy pocos usuarios o si en realidad es un fallo en todas las maquinas de la empresa
- Comunicar el status a Gerencia
- Usando una máquina que tiene el error, aplicar un rollback (punto de control o imagen  ghost)
- Si el rollback ha funcionado, documentar los pasos exactos y pedir autorizacion a Gerencia para aplicar el procedimiento en todas las máquinas de la empresa.


## Ideas para automatizar el rollback

El uso de un dispositivo conectado en cada maquina (inversión $) que sea capaz de :

- Activarse en background cuando el usuario final enciende la máquina, antes de la secuencia de booteo.
- Consultar a un servicio de la empresa que le responda si debe iniciar con normalidad o debe aplicar un rollback (punto de control, imagen ghost, comandos batch, etc)


Este dispositivo deberia contener algo como:

- Un sistema inpirado en la version live de algunos distros linux o windows antiguos
- No debe tener interfaz de usuario. Todo en background!