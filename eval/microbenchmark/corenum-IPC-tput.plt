set terminal pdf
set output "cornum-IPC.pdf"
set title "Throughput with the number of cores (IPC)"
set xlabel "Number of cores"
set ylabel "Throughput/k read per sec"
plot sin(x) title "libipc",cos(x) title "Linux socket", x title "Freeflow"