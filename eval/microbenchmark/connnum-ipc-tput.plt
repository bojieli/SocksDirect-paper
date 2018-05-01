set terminal pdf
set output "connnum-ipc-tput.pdf"

set lmargin 12
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5
set xlabel "Number of connections"  font "Arial, 20"
set ylabel "Tput (k read/s)" font "Arial, 20" offset graph -0.02, 0
set xtics font "Arial, 18"
set ytics font "Arial, 18"
set key inside right top font "Arial, 18"
set logscale y 10 
set logscale x 10

$linux << EOD
1 1368
10 1367
100 1759
1000 1537
10000 419
50000 307 
EOD

$libvma << EOD
1 18845
10 17110
100 11624
1000 7560
10000 5216
EOD

plot "$linux" title "Linux" with linespoints linestyle 1,\
"$libvma" title "LibVMA" with linespoints linestyle 2,\
1 title "SocksDirect" linestyle 3