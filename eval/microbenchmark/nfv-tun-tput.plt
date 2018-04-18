set terminal pdf
set output "nfv-tun-tput.pdf"
set title "Throughput with the number of cores (NFV)"
set xlabel "Number of cores"
set ylabel "Throughput/k connections per sec"
plot sin(x) title "SocksDirect",cos(x) title "Linux socket"