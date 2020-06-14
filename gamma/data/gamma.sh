#!/bin/sh
# Made by:
# Gustavo Magallanes-Guijón <gustavo.magallanes.guijon@ciencias.unam.mx>
# Instituto de Astronomia UNAM
# Ciudad Universitaria
# Ciudad de Mexico
# Mexico
# Tue Jan 06 15:47:42 UTC 2020
#

object=oj287
freq=gamma

awk 'BEGIN { FS=","; OFS="\t" } {$1=$1; print}' oj287_gamma_lc.dat > out.tsv
awk '{ gsub(/</,""); print }' out.tsv > ${object}_${freq}_clean.dat
rm out.tsv

awk '{ printf "%s\t %.5f\t %.9f\t %.9f\n", strftime("%F", ($1-40587)*86400 + $2), $1, $2, $3 }' ${object}_${freq}_clean.dat > ${object}_${freq}_gregorian.dat

#datamash -s sort -g group 
datamash -s -g 1 mean 3 mean 4 < ${object}_${freq}_gregorian.dat >  ${object}_${freq}_average.dat
