set terminal pdf
set output "connnum-network-tput.pdf"
set title "Throughput with the number of connections (inter server)"
set xlabel "Number of connections"
set ylabel "Throughput/k read per sec"
plot sin(x) title "SocksDirect (TCP)",4*x title "SocksDirect (RDMA)", cos(x) title "libvma", 2*x title "StackMap", 3* x title "RDMA", 4 * x title "Linux socket"