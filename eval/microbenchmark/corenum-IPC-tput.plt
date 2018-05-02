set terminal pdf
set output "corenum-IPC-tput.pdf"

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
1 1182
2 2720
3 3718
4 4825
5 5844
6 5182
7 8504
8 8501
9 9125
10 7928
11 8165
12 7906
13 8268
14 8773
15 7414
16 7587
EOD

$libvma << EOD
1 1153
2 3310
3 3782
4 5401
5 5880
6 7100
7 8316
8 7537
9 8178
10 8256
11 7982
12 10809
13 8194
14 8807
15 7929
16 8141
EOD

$libsd << EOD
1 23707
2 45413
3 63126
4 79044
5 100975
6 121785
7 140448
8 160251
9 184827
10 203907
11 221930
12 241078
13 261136
14 278419
15 300805
16 306616
EOD


plot "$linux" title "Linux" with linespoints linestyle 1,\
"$libvma" title "LibVMA" with linespoints linestyle 2,\
"$libsd" title "SocksDirect" with linespoints linestyle 3