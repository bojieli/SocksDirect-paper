set terminal pdf
set output "msgsize-ipc-tput.pdf"
set title "Throughput of one connection with different message size (IPC)"
set xlabel ""
set ylabel "Throughput/k read operations per sec on 16 byte message"
set xtics ('16B' 0, '4KB' 1)
set yrange [0:2]
set ytics 0,1,2
plot for [i=2:7] "msgsize-ipc-tput.txt" using i with histogram title columnheader(i)