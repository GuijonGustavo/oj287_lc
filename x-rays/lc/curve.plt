# Made by:
# Gustavo Magallanes-Guijón <gustavo.magallanes.guijon@ciencias.unam.mx>
# Instituto de Astronomia UNAM
# Ciudad Universitaria
# Ciudad de Mexico
# Mexico

set terminal png size 1280,960
set key autotitle columnhead
set key 
set output "images/curve.png"
set title "Swift/XRT QSO J0854+2006"
set xlabel "MJD"
set x2data time
set timefmt "%Y-%m-%d"
set format x2 "%Y-%m-%d"
set x2tics
set x2range["2005-05-20":"2020-06-05"]
set ylabel "Count Rate (0.3-10 keV)(c/s)"

plot "<(sed -n '3,9470p' data/curve.dat)" using 1:4:5:6 title "Windowed Timing" with yerrorbars lc "blue", "<(sed -n '9478,$p' data/curve.dat)" using 1:4:5:6 title "Photon Counting" with yerrorbars lc "red"
