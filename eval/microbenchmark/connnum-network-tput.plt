set terminal pdf
set output "connnum-TCP-tput.pdf"
set title "Throughput with the number of connections (TCP)"
set xlabel "Number of connections"
set ylabel "Throughput/k read per sec"
plot sin(x) title "libipc",cos(x) title "libvma", x title "Fastsocket", 2*x title "StackMap"