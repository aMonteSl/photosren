Escribe un script de shell sh para Linux llamado photosren.sh que reciba un parámetro obligatorio, que será un directorio.

El script tiene que buscar todos los ficheros del directorio (no del subárbol, no hay que recorrerlo recursivamente) que son imágenes y moverlos a un subdirectorio cuyo nombre será la fecha actual en un formato similar a 20_jan_2020.

Los nombres de los ficheros se renombrarán para que su nombre sea un número seguido de la extensión y  todos los nombres sean de la misma longitud (sin incluir la extensión).

Por ejemplo:

$> date
lun mar 23 10:05:22 CET 2020
$> ls /tmp/x
a.gif
b.jpeg
c.txt
de.png
r.png
qwe.png
ss.gif
etc...
r
$> photosren /tmp/x
$> ls /tmp/x
23_mar_2020
c.txt
r
$> ls /tmp/x/23_mar_2020
000.gif
001.jpeg
002.png
003.png
004.png
005.gif
etc...
103.gif
$>


Para detectar qué ficheros son imágenes, se recomienda el uso del comando file:

man 1 file

Para las fechas, hay que usar el comando date:

man 1 date
 
