set terminal pdf
set output "msgsize-ipc-tput.pdf"
set lmargin 12
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5
set xlabel "Message size(Bytes)"  font "Arial, 20"
set ylabel "Tput(k read/s)" font "Arial, 20" offset graph -0.02, 0
set xtics ("1B" 8, "8B" 64, "64B" 512, "4K" 4096, "32K" 32768, "256K" 262144) font "Arial, 18"
set ytics font "Arial, 18"
set key inside right top font "Arial, 18"
set logscale y 10 
set logscale x 2

$linux << EOD
8 1204
16 1215
32 1183
64 1737
128 1631
256 1488
512 1384
1024 1220
2048 1045
4096 799
8192 534
16384 294
32768 142
65536 77
131072 40
262144 20
524288 10
1048576 5 
EOD

$libvma << EOD
8 1171
16 1147
32 1171
64 1685
128 1596
256 1417
512 1048
1024 1204
2048 1002
4096 795
8192 533
16384 290
32768 143
65536 72
131072 42
262144 20
524288 10
1048576 5 
EOD

plot "$linux" title "Linux" with linespoints linestyle 1, "$libvma" title "LibVMA" with linespoints linestyle 2