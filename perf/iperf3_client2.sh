#!/usr/bin/bash

NoT=${1:-1}
REMOTE_SERVER=l-csi-0104s
RUNTIME=60
FIFO_DIR=/root/ipsec/fifos/

res=($(seq 12 23) $(seq 36 47) $(seq 0 11) $(seq 24 35))
for i in $( seq 0 $(( NoT - 1)) )
do
    IPADDR=2.2.$i.2
    coren=${res[$i]}
    cmd="taskset -c $coren iperf3 -c $IPADDR -M 1350 --logfile ${FIFO_DIR}fifo${i} -t $RUNTIME &"
    echo $cmd
    eval $cmd
    
done
wait
