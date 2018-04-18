set terminal pdf
set output "connnum-ipc-tput.pdf"
set title "Throughput with the number of connections (IPC)"
set xlabel "Number of connections"
set ylabel "Throughput/k read per sec"
plot sin(x) title "libipc",cos(x) title "linux socket", x title "Fastsocket", 2*x title "StackMap"