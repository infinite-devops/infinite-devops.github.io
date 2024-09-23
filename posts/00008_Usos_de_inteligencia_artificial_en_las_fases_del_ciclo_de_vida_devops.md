<!--

layout : post
title : Usos de inteligencia artificial en las fases del ciclo de vida devops
description : Conversaremos sobre como la ia puede ayudar en las fases como planificación, build, etc
category : devops
tags : devops
comments : true
author : JRichardsz & Bitmanuc
thumbnail_image_url: https://github.com/user-attachments/assets/bd785e10-083e-4d9f-bdb9-a092c68029e0
datetime : "2024-09-22"
duration: 00:27:06
sound:
    type : vocaroo_url
    value : https://vocaroo.com/embed/1m9w8Bl7Xl2h?autoplay=0
    language: es
-->

<p align="center">
  <img src="https://github.com/user-attachments/assets/bd785e10-083e-4d9f-bdb9-a092c68029e0" />
</p>

<br>

En este podcast hemos conversado sobre como la inteligencia artificial puede ayudar en cada una de las fases del ciclo de vida devops.

## Como funciona?

No trataremo de explicar como funciona una IA, pero de forma resumida es entrenar un modelo con mucha información para que usando otro programa se pueda "predecir"

## Fases

![image](https://github.com/user-attachments/assets/10cd7753-5ee0-457a-807d-4a2cfcbdb207)


## Planificación

- Asistente para gestion del proyecto
- Toma de requerimientos

## Code

- Asistente para solicitar plantillas tipo en cualquier lenguage y cualquier tipo (web, api, mobile, dameon, etc)
- No solo métodos o porciones de código

## Build

- Detectar automaticamente el lenguage y ejecutar los comandos build
- Entrenar con muchos repositorios git

## Test

- Usando los requerimientos solicitados por el usuario +  el tipo de aplicación , el asistente genera y sugiere test cases cubriendo todos los aspectos, incluida la seguridad
- Aprende el flujo gracias al tester humano y luego lo implementa con o sin Selenium

## Release

- Similar al build. Al haber sido entrenado con muchos repositorios git, automatizaciones devops y conocer la nube de la empresa, el asistente podría sugerir como y donde alojar el artefacto.
- Usaria prefijo y sufijos de la mejor forma (release, milestone, etc)

## Deploy

- Similar al release.

## Operacion y Monitoreo

- Al contar con los logs de miles aplicaciones, el asistente podría leer el log en tiempo real y saber si se trata de un error comun a las aplicaciones de el lenguage, nube, funcionalidad, etc
- El asistente podría conocer el impacto del error (dependencias)
- En casos de errores internos no públicos, el asistente aprendería del equipo interno
- Al ser una IA, puede llegar a detectar el error, saber como solucionar el error, crear el branch, modificar el código, lanzar el deploy, ejecutar pruebas y pedir una mínima aprobacion a un humano (si es requerido). Al final deployar en producción, notificar y cerrar el ticket