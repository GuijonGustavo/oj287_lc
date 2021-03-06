# Made by:
# Gustavo Magallanes-Guijón <gustavo.magallanes.guijon@ciencias.unam.mx>
# Instituto de Astronomia UNAM
# Ciudad Universitaria
# Ciudad de Mexico
# Mexico

set terminal png size 1280,960
set key autotitle columnhead
set key 
set output "./images/oj287_optical_lc.png"
set title "AAVSO/OPTICAL QSO J0854+2006"
set xlabel "MJD"
set x2data time
set timefmt "%Y-%m-%d"
set format x2 "%Y-%m-%d"
set x2tics
set x2range["1987-09-26":"2020-06-03"]
set ylabel "MAGNITUDE"

plot './data/oj287_optical_clean.dat' using 1:2:3 title "Magnitude" with yerrorbars lc "blue"
