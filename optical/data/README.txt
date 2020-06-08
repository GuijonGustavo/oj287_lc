#Generar los dias julianos
seq 45842 58952 > cal.dat

#Generar cal.dat a fecha corriente


#Caldula MJD a date linux
awk '{ printf "%s\t%s\n", strftime("%F", ($1-40587)*86400 + $2), $0 }' file1.dat > file_fecha.dat

#Promedio
awk '{sum[$1]+=$5; count[$1]++} END{for(k in sum) printf "%s\t%.5f\n",  k, sum[k]/count[k]}' file_fecha.dat > file_average.dat

datamash -s -g 1 mean 3 mean 4 < oj287_optical_gregorian.dat > prueba.dat



#Ordena
sort file_average.dat > file_sort.dat


awk 'FNR==NR{a[$1]=$2;next}{print $0,a[$1]?a[$1]:"0"}' file_sort.dat salida.dat > file_out.dat  #optical_date.dat solo tiene dos columnas


datamash transpose < curve_sort.dat > curve_transpose.dat

%s/,0$/,NaN/g
