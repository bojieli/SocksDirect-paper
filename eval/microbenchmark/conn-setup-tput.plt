set terminal pdf
set output "conn-setup-tput.pdf"
set title "Connection setup tput of libipc/Linux socket/FastSocket/libvma/"
set xlabel "Number of Cores"
set ylabel "Throughput/k connections per sec"
plot sin(x) title "libipc",cos(x) title "linux socket"