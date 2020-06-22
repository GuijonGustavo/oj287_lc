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
freq=x-rays

awk 'BEGIN { FS=","; OFS="\t" } {$1=$1; print}' curve.dat > out.tsv
awk '{ gsub(/</,""); print }' out.tsv > ${object}_${freq}_clean.dat
rm out.tsv

awk '{ printf "%s\t %.5f\t %.5f\t  %.5f\t %.5f\t %.5f\t %.5f\n", strftime("%F", ($1-40587)*86400 + $2), $1, $2, $3, $4, $5, $6 }' ${object}_${freq}_clean.dat > ${object}_${freq}_gregorian.dat

#datamash -s sort -g group 
datamash -s -g 1 mean 5 mean 6 mean 7 < ${object}_${freq}_gregorian.dat >  ${object}_${freq}_average.dat
 
date_i=$(awk -F: '/^[^!|^#]/ {printf "%d\n", $1}' ${object}_${freq}_clean.dat | head -1)
date_f=$(awk -F: '/^[^!|^#]/ {printf "%d\n", $1}' ${object}_${freq}_clean.dat | tail -1)

seq $date_i $date_f > ${object}_${freq}_seq.dat

awk '{ printf "%s\t %.5f\n", strftime("%F", ($1-40587)*86400 + $2), $0 }' ${object}_${freq}_seq.dat > ${object}_${freq}_date.dat

awk 'FNR==NR{a[$1]=$2"\t"$3;next}{print $1"\t",a[$1]?a[$1]:"NaN\tNaN"}' ${object}_${freq}_average.dat ${object}_${freq}_date.dat > ${object}_${freq}_final.dat

