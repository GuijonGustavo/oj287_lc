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

awk -F"," '{ print $1 "\t" $2 "\t" $3 }' *.csv > salida.dat

awk '{ gsub(/</,""); print }' salida.dat > out.csv
#echo '#mjd,		flux,	err' > radio.dat
#awk -F "\"*,\"*" '/[0-9]+\.[0-9]*/{print $1 $2 $2/10}' out.csv > radio.dat
awk -e '/^[0-9]/{print $1-2400000.5" \t "$2}' out.csv > ${object}_radio_clean.dat
#rm out.csv

awk '{ printf "%s\t%s\n", strftime("%F", ($1-40587)*86400 + $2), $0 }' ${object}_radio_clean.dat > ${object}_radio_gregorian.dat
# sum broup by and $3 is the column
awk '{sum[$1]+=$3; count[$1]++} END{for(k in sum) printf "%s\t%.5f\n",  k, sum[k]/count[k]}' ${object}_radio_gregorian.dat > ${object}_radio_average.dat

awk '{print $1"\t"$2"\t"$2/10}' ${object}_radio_average.dat > ${object}_radio_error.dat

sort ${object}_radio_error.dat > ${object}_radio.dat
