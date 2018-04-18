set terminal pdf
set output "nginx-multiround-tput.pdf"
set title "Throughput with the number of cores (Nginx multiple round-trip)"
set xlabel "Number of cores"
set ylabel "Throughput/k connections per sec"
plot sin(x) title "SocksDirect",cos(x) title "Linux socket"