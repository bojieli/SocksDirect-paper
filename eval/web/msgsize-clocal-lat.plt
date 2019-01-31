set terminal pdf
set output "msgsize-clocal-lat.pdf"
set lmargin 12
set rmargin 3.5
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5 ps 1.0 
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5 ps 1.0 
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5 ps 1.0 
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5 ps 1.0
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5 ps 1.0
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5 ps 1.0
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5 ps 1.0
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5 ps 1.0
set xlabel "Message size (Bytes)"  font "Arial, 24"
set ylabel "Latency ({/Symbol m}s, log scale)" font "Arial, 24" offset graph -0.02, 0
set xtics ("8B" 8, "64B" 64, "512B" 512, "4K" 4096, "32K" 32768, "256K" 262144, "1M" 1048576) font "Arial, 24"
set ytics font "Arial, 24"
set key inside reverse left top font "Arial, 20"
set logscale y 10 
set logscale x 2

$linux << EOD
32 77.296 69.851 200.918                                                                                           
64 80.893 69.833 212.186                                                                                           
128 74.885 67.879 115.075                                                                                          
256 89.999 76.201 215.812                                                                                          
512 80.715 61.772 197.237                                                                                          
1024 75.513 64.269 207.739                                                                                         
2048 78.197 64.021 201.293
EOD

$libsd << EOD
32 15.567 13.285 25.564                                                                                            │       <http://gnu.org/licenses/gpl.html>.
64 13.940 11.765 23.496                                                                                            │       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the  extent
128 14.357 12.444 21.490                                                                                           │       permitted by law.
256 15.671 13.506 22.238                                                                                           │
512 16.692 14.481 23.010                                                                                           │SEE ALSO
1024 15.561 13.555 20.568                                                                                          │       tail(1)
2048 26.159 23.649 35.746 
EOD


plot "$libsd" title "SocksDirect" with yerrorlines linestyle 1,\
"$linux" title "Linux" with yerrorlines linestyle 2
