set terminal pdf
set output "conn-setup-tput.pdf"
set lmargin 12
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5
set style line 3 pt 6 lc rgb "#4daf4a"linewidth 1.5
set style line 4 pt 12 lc rgb "#984ea3"linewidth 1.5
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5
set xlabel "Number of Cores"  font "Arial, 20"
set ylabel "Tput (k connection/s)" font "Arial, 20" offset graph -0.02, 0
set xtics font "Arial, 18"
set ytics font "Arial, 18"
set key inside right center font "Arial, 18"


$linux << EOD
1 68
2 106
3 153
4 199
5 241
6 273
7 294
8 340
9 364
10 394
11 418
12 438
13 444
14 438
15 376
16 279
EOD

$libvma << EOD
1 26
2 46
3 69
4 85
5 100
6 128
7 142
8 163
9 171
10 195
11 206
12 222
13 222
14 234
15 255
16 94 
EOD

$libsd << EOD
1 772
2 857
3 1495
4 2878
5 2874
6 3249
7 3504
8 4033
9 3760
10 4216
11 4584
12 4605
13 4548
14 4408
15 4305
16 4400
EOD

plot "$libsd" title "SocksDirect" with linespoints linestyle 1,"$linux" title "Linux" with linespoints linestyle 3, 2*x title "Fastsocket", "$libvma" title "LibVMA" with linespoints linestyle 2, 4*x title "mTCP"