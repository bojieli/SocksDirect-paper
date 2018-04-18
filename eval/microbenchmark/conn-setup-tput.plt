set terminal pdf
set output "conn-setup-tput.pdf"
set title "Connection setup tput of libipc/Linux socket/FastSocket/libvma/"
set xlabel "Number of Cores"
set ylabel "Throughput/k connections per sec"
plot sin(x) title "SocksDirect",cos(x) title "linux socket", 2*x title "Fastsocket", 3*x title "IX", 4*x title "mTCP"