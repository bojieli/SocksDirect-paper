set terminal pdf
set output "msgsize-network-tput.pdf"
set lmargin 12
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5 ps 1.0
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5 ps 1.0
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5 ps 1.0
set style line 4 pt 12 lc rgb "#984ea3" linewidth 2 dt 2 ps 1.0
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5 ps 1.0
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5 ps 1.0
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5 ps 1.0
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5 ps 1.0
set xlabel "Message size (Bytes)"  font "Arial, 24"
set ylabel "Throughput (Gbps)" font "Arial, 24" offset graph -0.02, 0
set yrange [0.1:100]
set logscale y 10
set xtics ("8B" 8, "64B" 64, "512B" 512, "4K" 4096, "32K" 32768, "256K" 262144, "1M" 1048576) font "Arial, 24"
set ytics font "Arial, 24"
set key inside reverse right bottom vertical font "Arial, 20"
set logscale x 2

$linux << EOD
8	0.077453613
16	0.150268555
32	0.289550781
64	0.5546875
128	1.006835938
256	1.861328125
512	3.53125
1024	6.4609375
2048	11.640625
4096	17.34375
8192	22.75
16384	23.875
32768	23.75
65536	27.5
131072	31
262144	28
524288	24
1048576	32

EOD

$libvma << EO
8	1.138977051
16	2.210327148
32	4.320556641
64	7.547851563
128	12.31738281
256	16.87890625
512	21.61328125
1024	25.59375
2048	28.34375
4096	27.03125
8192	30.75
16384	27.75
32768	28.25
65536	25
131072	30
262144	30
524288	28
1048576	32
EOD

$RDMA << EOD
8	0.815498146
16	1.635326577
32	3.25909042
64	6.520168945
128	13.02890251
256	26.00604424
512	51.636025
1024	53.69909219
2048	54.0
4096	54.2
8192	54.4
16384	54.9
32768	54.9
65536	54.8
131072	55.0
262144	54.9
524288	54.3
1048576 55.7
EOD

$libsd << EOD
8	0.513122559
16	1.033081055
32	2.109863281
64	4.20703125
128	8.161132813
256	14.359375
512	27.11328125
1024	44.6640625
2048	53.796875
4096	53.875
8192	51.3125
8192	53.3125
16384	53.875
16384	53.875
32768	53.75
32768	53.75
65536	54
131072	54
262144	54
524288	52
1048576	56
EOD

$rsocket << EOD
8 0.361984
16 0.71616
32 1.40774
64 2.8288
128 5.60947
256 10.6271
512 18.5549
1024 26.796
2048 24.3958
4096 24.576
8192 28.3771
16384 29.4912
32768 32.5059
65536 36.1759
131072 20.9715
262144 29.3601
524288 25.1658
1048576 25.1658
EOD

plot "$libsd" title "SocksDirect" with linespoints linestyle 1,\
"$linux" title "Linux" with linespoints linestyle 2, \
"$libvma" title "LibVMA" with linespoints linestyle 3, \
"$rsocket" title "RSocket" with linespoints linestyle 5, \
"$RDMA" title "RDMA" with linespoints linestyle 4
