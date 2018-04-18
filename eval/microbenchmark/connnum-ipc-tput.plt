set terminal pdf
set output "connnum-ipc-tput.pdf"
set title "Throughput with the number of connections (IPC)"
set xlabel "Number of connections"
set ylabel "Throughput/k read per sec"
plot sin(x) title "SocksDirect",cos(x) title "linux socket", 2*x title "mTCP", 4 * x title "IX"