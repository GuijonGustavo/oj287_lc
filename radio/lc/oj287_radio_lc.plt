# Made by:
# Gustavo Magallanes-Guijón <gustavo.magallanes.guijon@ciencias.unam.mx>
# Instituto de Astronomia UNAM
# Ciudad Universitaria
# Ciudad de Mexico
# Mexico

set terminal png size 1280,960
set key autotitle columnhead
set key 
set output "images/oj287_radio_lc.png"
set title "OVRO/RADIO 40m QSO J0854+2006"
set xlabel "MJD"
set x2data time
set timefmt "%Y-%m-%d"
set format x2 "%Y-%m-%d"
set x2tics
set x2range["2008-01-08":"2020-01-26"]
set ylabel "Flux Density (Jy)"

plot 'data/oj287_radio_clean.dat' using 1:2:3 title "Flux Density (Jy)" with yerrorbars lc "blue"
