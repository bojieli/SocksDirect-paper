set terminal pdf
set output "nginx-multiround-tput.pdf"


set lmargin 12
set rmargin 5
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5 ps 1.0
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5 ps 1.0
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5 ps 1.0
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5 ps 1.0
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5 ps 1.0
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5 ps 1.0
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5 ps 1.0
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5 ps 1.0
set xlabel "Rounds"  font "Arial, 24"
set ylabel "Latency (ms)" font "Arial, 24" offset graph -0.02, 0
set xtics  ("1" 1, "10" 10, "100" 100, "1K" 1000, "10K" 10000, "100K" 100000, "1M" 1000000) font "Arial, 24"
set ytics font "Arial, 24"
set key inside reverse left top font "Arial, 24"
set logscale y 10 
set logscale x 10
set samples 7
set xrange [1:1000000]
plot (600+10*x)/1000 title "SocksDirect" with linespoints linestyle 1,\
(600+30*x)/1000 title "Linux socket" with linespoints linestyle 2