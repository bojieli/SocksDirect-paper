set terminal pdf
set output "msgsize-ipc-lat.pdf"
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
8 11.63 10.98 13.43
16 11.80 11.03 13.75
32 11.70 11.05 13.92
64 11.66 11.02 15.14
128 11.89 11.15 14.49
256 11.86 11.13 13.53
512 11.92 11.24 14.78
1024 12.03 11.26 18.40
2048 12.94 12.15 24.97
4096 13.65 12.80 25.69
8192 15.73 14.10 23.07
16384 19.37 16.57 26.10
32768 24.13 22.22 36.11
65536 47.05 42.50 55.56
131072 54.62 53.11 62.88
262144 95.74 88.81 109.31
524288 172.49 164.90 200.69
1048576 321.70 314.53 355.89
EOD

$libvma << EOD
8 2.60 2.34 3.32
16 2.70 2.42 3.41
32 2.68 2.40 3.98
64 2.80 2.49 3.54
128 2.90 2.63 4.23
256 3.50 3.25 4.84
512 3.77 3.52 4.45
1024 4.15 3.89 5.47
2048 5.63 5.35 6.58
4096 7.24 6.79 9.79
8192 11.15 9.92 14.71
16384 17.10 15.70 20.91
32768 28.82 26.25 36.44
65536 51.01 47.21 61.85
131072 105.06 99.10 118.53
262144 204.74 196.86 218.15
524288 403.73 387.28 426.00
1048576 763.57 731.99 790.50
EOD

plot "$linux" title "Linux" with yerrorlines linestyle 1,\
"$libvma" title "LibVMA" with yerrorlines linestyle 2
