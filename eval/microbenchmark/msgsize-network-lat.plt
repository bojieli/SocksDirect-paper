set terminal pdf
set output "msgsize-network-lat.pdf"
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
set ylabel "Latency /  {/Symbol m}s" font "Arial, 20" offset graph -0.02, 0
set xtics ("1B" 8, "8B" 64, "64B" 512, "4K" 4096, "32K" 32768, "256K" 262144) font "Arial, 18"
set ytics font "Arial, 18"
set key inside right top font "Arial, 18"
set logscale y 10 
set logscale x 2

$linux << EOD
8 30.4059 28.7590 36.8800
16 23.6072 21.5470 27.717
32 24.3398 21.7650 57.947
64 30.4908 26.6370 37.336
128 30.8849 28.1530 38.391
256 23.4958 21.0810 32.462
512 24.1660 21.7380 29.173
1024 33.7691 30.1620 44.641
2048 41.5765 25.2090 55.504
4096 30.8637 20.9080 61.648
8192 45.3526 30.0550 63.443
16384 54.0435 46.0450 68.841
32768 83.4563 76.2480 113.254
65536 110.7810 98.7000 161.062
131072 186.7830 144.7430 236.274
262144 339.8730 262.5840 422.398
524288 506.6340 434.6310 603.676
1048576 730.0770 656.5630 868.885
EOD

$libvma << EOD
8 11.7791 10.1390 24.333
16 11.4879 10.569 23.328
32 11.0866 9.937 23.573
64 11.616 10.732 13.231
128 11.2279 10.855 12.014
256 13.5389 11.333 25.105
512 11.7223 10.781 13.638
1024 12.6471 11.818 24.916
2048 16.8054 14.325 34.819
4096 23.0248 16.261 39.550
8192 22.0221 19.604 43.712
16384 33.5005 27.320 68.538
32768 49.0956 42.622 93.650
65536 84.875 76.539 114.181
131072 173.641 140.883 247.109
262144 326.702 276.510 421.875
524288 560.381 536.118 635.079
1048576 1080.530 1005.273 1201.292
EOD

$RDMA << EOD
8	2.2
16	2.18
32	2.78
64	2.8
128	2.84
256	2.88
512	3
1024	3.26
2048	3.76
4096	5.02
8192	6.92
16384	10.28
32768	16.48
65536	27.18
131072	49.54
262144	87.62
524288	162.68
1048576	327.12
EOD

plot "$linux" title "Linux" with yerrorlines linestyle 1,\
"$libvma" title "LibVMA" with yerrorlines linestyle 2,\
"$RDMA" title "RDMA" with linespoints linestyle 3
