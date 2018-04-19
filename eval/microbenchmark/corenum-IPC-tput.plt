set terminal pdf
set output "corenum-IPC-tput.pdf"
set title "Throughput with the number of cores (IPC)"
set xlabel "Number of cores"
set ylabel "Throughput/k read per sec"
plot sin(x) title "SocksDirect",cos(x) title "Linux socket", 2*x title "IX", 3 * x title "mTCP"
