# Made by:
# Gustavo Magallanes-Guijón <gustavo.magallanes.guijon@ciencias.unam.mx>
# Instituto de Astronomia UNAM
# Ciudad Universitaria
# Ciudad de Mexico
# Mexico

set terminal png size 1280,960
set key autotitle columnhead
set key 

unset xlabel
set output "images/curve2.png"
unset xlabel

set multiplot layout 2, 1 title "Swift/XRT QSO J0854+2006"

set bmargin 0
set xtics format " "
set lmargin 10

set x2data time
set timefmt "%Y-%m-%d"
set format x2 "%Y-%m-%d"
set x2tics
set x2range["2005-05-20":"2020-06-05"]

set ylabel "Count Rate (0.3-10 keV) (s^-1)" # \n{/*0.8 Photon Counting Source}"

plot "<(sed -n '2,9468p' data/curve2.dat)" using 1:4:5:6 title "Windowed Timing (source)" with yerrorbars lc "blue", \
"<(sed -n '9475,$p' data/curve2.dat)" using 1:4:5:6 title "Photon Counting (source)" with yerrorbars lc "red"

set tmargin 0
set bmargin 3
set xtics format "%g"
set lmargin 10
set xlabel "MJD"
set ylabel "FracExp" # \n{/*0.8 Photon Counting Background}"


plot "<(sed -n '2,9468p' data/curve2.dat)" using 1:7:8:9 title "Windowed Timing (background)" with yerrorbars lc "pink", \
"<(sed -n '9475,$p' data/curve2.dat)" using 1:7:8:9 title "Photon Counting (background)" with yerrorbars lc "green"

unset multiplot



