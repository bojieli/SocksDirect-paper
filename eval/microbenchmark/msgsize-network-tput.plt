set terminal pdf
set output "msgsize-network-tput.pdf"
set lmargin 12
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5
set xlabel "Message size (Bytes)"  font "Arial, 20"
set ylabel "Tput (k read/s)" font "Arial, 20" offset graph -0.02, 0
set xtics ("1B" 8, "8B" 64, "64B" 512, "4K" 4096, "32K" 32768, "256K" 262144) font "Arial, 18"
set ytics font "Arial, 18"
set key inside right top font "Arial, 18"
set logscale y 10 
set logscale x 2

$linux << EOD
8 1269
16 1231
32 1186
64 1136
128 1031
256 953
512 904
1024 827
2048 745
4096 555
8192 364
16384 191
32768 95
65536 55
131072 31
262144 14
524288 6
1048576 4
EOD

$libvma << EOD
8 18661
16 18107
32 17697
64 15458
128 12613
256 8642
512 5533
1024 3276
2048 1814
4096 865
8192 492
16384 222
32768 113
65536 50
131072 30
262144 15
524288 7
1048576 4 
EOD

$RDMA << EOD
8 13361.12162
16 13396.59532
32	13349.23436
64	13353.30600
128	13341.59617
256	13315.09465
512	13218.82240
1024 6873.48380
2048 3226.31327
4096 1681.93255
8192 823.69482
16384 415.49037
32768 195.73054
65536 97.79906
131072 49.01753
262144 24.49786
524288 12.32046
1048576	6.12429

EOD

plot "$linux" title "Linux" with linespoints linestyle 1, \
"$libvma" title "LibVMA" with linespoints linestyle 2, \
"$RDMA" title "RDMA" with linespoints linestyle 3,