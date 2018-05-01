set terminal pdf
set output "corenum-network-tput.pdf"

set lmargin 12
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5
set xlabel "Number of cores"  font "Arial, 20"
set ylabel "Tput (k read/s)" font "Arial, 20" offset graph -0.02, 0
set xtics font "Arial, 18"
set ytics font "Arial, 18"
set key inside right top font "Arial, 18"

$linux << EOD
1 1272
2 2457
3 3772
4 4956
5 6226
6 7341
7 8000
8 8282
9 8570
10 7323
11 9002
12 7506
13 7560
14 8199
15 8005
16 8151
EOD

$libvma << EOD
1 18732.7 18578.0 18777.0
2 4732.0 4578.0 4910.0
3 1884.1 1511.0 10495.0
4 1116.2 605.0 4323.0
5 2002.4 766.0 7122.0
6 4505.3 680.0 7501.0
7 2533.0 607.0 6136.0
8 2868.1 1901.0 4695.0
9 3866.8 2855.0 5715.0
10 3506.6 2789.0 4511.0
11 2789.4 2052.0 3759.0
12 2464.3 1823.0 3487.0
13 1926.3 1302.0 3009.0
14 2297.1 1719.0 3084.0
15 2388.3 1701.0 2910.0
16 2519.6 1914.0 3297.0
EOD

$RDMA << EOD
1	13406.31360
2	26817.17265
3	39520.31865
4	51659.95182
5	63393.07340
6	75603.97482
7	88146.26680
8	99901.55355
9	102408.10508
10	102067.94124
11	102348.45893

EOD

plot "$linux" title "Linux" with linespoints linestyle 1,\
"$libvma" title "LibVMA" with yerrorlines linestyle 2,\
"$RDMA" title "RDMA" with linespoints linestyle 3,\
1 title "SocksDirect" linestyle 4