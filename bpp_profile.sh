#!/usr/bin/env bash
# Unrolled PingPong with branching at the start
# Usage: bpp_profile.sh | tee results.csv

FN="Large.scr"
TEMPLATE="UnrolledPingPong.purs"
IFS=

echo "States, Wall clock time, User time, System time, Memory (kbytes)"

for ((s=1; s<=3; s++))
do
  for ((i=1; i<=450; i+=10))
  do
     rm -f $FN
     rm -rf src
     mkdir src

     echo $'module Large;\n\nexplicit global protocol UnrolledPingPong(role Client, role Server) {' > $FN
     cat $TEMPLATE > src/Main.purs
     echo '          SC.choice c {' >> src/Main.purs

     echo '  choice at Client {' >> $FN
     echo '    B1() from Client to Server;' >> $FN
     echo '             b1: \c -> do' >> src/Main.purs
     echo '               (Tuple _ c) <- SC.receive c' >> src/Main.purs

     for ((j=1; j<=$i; j++))
     do
       echo $'    Ping() from Client to Server;\n    Pong() from Server to Client;' >> $FN
       echo $'               (Tuple _ c) <- SC.receive c\n               c <- SC.send c UPP.Pong' >> src/Main.purs
     done

     echo $'  } or {\n    B2() from Client to Server;' >> $FN
     echo $'               pure c' >> src/Main.purs
     echo '           , b2: \c -> do' >> src/Main.purs
     echo '               (Tuple _ c) <- SC.receive c' >> src/Main.purs
     

     for ((j=1; j<=$i; j++))
     do
       echo $'    Ping() from Client to Server;\n    Pong() from Server to Client;' >> $FN
       echo $'               (Tuple _ c) <- SC.receive c\n               c <- SC.send c UPP.Pong' >> src/Main.purs
     done

     echo $'  }\n}' >> $FN
     echo $'               pure c' >> src/Main.purs
     echo $'            }' >> src/Main.purs

     docker run -v $(PWD):/gen/ --entrypoint "./scribblec.sh" scribble-server -d ./scribblec.sh -d /gen/src /gen/Large.scr -api-ps UnrolledPingPong Client > /dev/null 2>&1
     RESULTS=$( { gtime -o /dev/fd/3 -v pulp build 2> /dev/null > /dev/null; } 2>&1 3>&1)
     WCTIME=$(echo $RESULTS | grep "Elapsed (wall clock) time" | awk 'NF>1{print $NF}')
     UTIME=$(echo $RESULTS | grep "User time" | awk 'NF>1{print $NF}')
     STIME=$(echo $RESULTS | grep "System time" | awk 'NF>1{print $NF}')
     MEM=$(echo $RESULTS | grep "Maximum resident set size" | awk 'NF>1{print $NF}')
     echo $(($i * 2)), $WCTIME, $UTIME, $STIME, $MEM
 done
done
