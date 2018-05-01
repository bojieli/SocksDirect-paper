set terminal pdf
set output "connnum-network-tput.pdf"


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
1 1348
10 1085
100 1480
1000 1328
10000 637
50000 519
EOD

$libvma << EOD
1 17296
10 14532
100 10085
1000 6766
10000 4266
EOD

$RDMA << EOD
1 13649.18406
10 13575.12295
100 12768.29057
200 12905.72247
400 10958.84387
500 7947.88746
1000 5502.08657
10000 5125.87778
20000 4390.90406

EOD

plot "$linux" title "Linux" with linespoints linestyle 1,\
"$libvma" title "LibVMA" with linespoints linestyle 2,\
"$RDMA" title "RDMA" with linespoints linestyle 3,\
1 title "SocksDirect" linestyle 4

