#!/bin/bash

template="
@podcast_name

## Inicio

@owner: Hola @panelist, bienvenidos a nuestro podcast:
        @podcast_name

Descripción mediana mencionar las 10 (pase a @panelist)

@panelist: Complementa

- foo
- bar
- baz

## Despedida

@owner:
Bueno, creo que con esto hemos terminado
A todos los oyentes, hasta el próximo podcast

@panelist:
Bueno, yo también me despido, hasta la siguiente.
"

echo -n "Enter Podcast name: " 
read podcast_name

echo -n "Enter the podcast owner name: " 
read owner

echo -n "Enter podcast panelist name: " 
read panelist


podcast=$(echo "${template//@podcast_name/"$podcast_name"}")
podcast=$(echo "${podcast//@owner/"$owner"}")
podcast=$(echo "${podcast//@panelist/"$panelist"}")

echo "$podcast"