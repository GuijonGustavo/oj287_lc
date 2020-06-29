# Made by:
# Gustavo Magallanes-Guijón <gustavo.magallanes.guijon@ciencias.unam.mx>
# Instituto de Astronomia UNAM
# Ciudad Universitaria
# Ciudad de Mexico
# Mexico

set terminal png size 1280,960
set key autotitle columnhead
set key
set output "images/oj287_gamma_lc.png"
set title "Fermi/Gamma QSO J0854+2006"
set xlabel "MJD"
set x2data time
set timefmt "%Y-%m-%d"
set format x2 "%Y-%m-%d"
set x2tics
set x2range["2008-08-04":"2020-10-17"]
set ylabel "photons/cm^2/s"

plot 'data/oj287_gamma_lc.dat' using 1:2:3 title "photons/cm^2/s" with yerrorbars lc "blue"
