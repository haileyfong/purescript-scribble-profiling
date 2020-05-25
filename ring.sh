#!/usr/bin/env bash
# Many branches - perform client role, selecting from the branches
# Usage: mbc_profile.sh | tee results.csv

FN="Large.scr"
TEMPLATE="OneToMany.purs"
IFS=

echo "RingSize, Wall clock time, User time, System time, Memory (kbytes)"
for ((s=1; s<=50; s++))
do
  for ((i=3; i<=15; i++))
  do
    #  rm -f $FN
    #  rm -rf src
    #  mkdir src

    #  ROLES="role A"
    #  for ((j=2; j<=$i; j++))
    #  do
    #    ROLES+=", role B$j"
    #  done

    #  echo $'module Large;\n\nexplicit global protocol OneToMany('$ROLES') {' > $FN
    #  cat $TEMPLATE > src/Main.purs

    #  echo $'  Connect() connect A to B2;' >> $FN
    #  echo $'  M() from A to B2;' >> $FN

    #  for ((j=2; j<$i; j++))
    #  do
    #    echo $'  Connect() connect B'$j' to B'$((j+1))';' >> $FN
    #    echo $'  M() from B'$j' to B'$((j+1))';' >> $FN
    #  done

    #  echo $'  Connect() connect B'$i' to A;' >> $FN
    #  echo $'  M() from B'$i' to A;' >> $FN
    #  echo $'  disconnect A and B2;' >> $FN
     
    #  for ((j=2; j<$i; j++))
    #  do
    #    echo $'  disconnect B'$j' and B'$((j+1))';' >> $FN
    #  done

    #  echo $'  disconnect B'$i' and A;' >> $FN

     cat $TEMPLATE > src/Main.purs

     echo $'        connect (Role :: Role OTM.B2) (URL $ "ws://127.0.0.1:916'$j'")' >> src/Main.purs
     echo $'        send (OTM.Connect)' >> src/Main.purs
     echo $'        send (OTM.M)'  >> src/Main.purs
     echo $'        request (Role :: Role OTM.B'$i') (URL $ "ws://127.0.0.1:916'$((j+1))'")' >> src/Main.purs
     echo $'        (OTM.M) <- receive'  >> src/Main.purs
     echo $'        disconnect (Role :: Role OTM.B2)' >> src/Main.purs
     echo $'        disconnect (Role :: Role OTM.B'$i')' >> src/Main.purs

    #  echo $'  }' >> $FN

     echo '          where' >> src/Main.purs
     echo '            bind = ibind' >> src/Main.purs
     echo '            pure = ipure' >> src/Main.purs
     echo '            discard = bind' >> src/Main.purs

    #  cat $FN
    #  docker run -v $(PWD):/gen/ --entrypoint "./scribblec.sh" scribble-java -d ./scribblec.sh -d /gen/src /gen/Large.scr -api-ps OneToMany > /dev/null 2>&1
     cp ring/Ring$i.purs src/Scribble/Protocol/Large/OneToMany.purs
     RESULTS=$( { time -p spago build; } 2>&1 3>&1)
    # #  echo $RESULTS
     WCTIME=$(echo $RESULTS | grep "real" | awk 'NF>1{print $NF}')
     UTIME=$(echo $RESULTS | grep "user" | awk 'NF>1{print $NF}')
     STIME=$(echo $RESULTS | grep "sys" | awk 'NF>1{print $NF}')
    #  MEM=$(echo $RESULTS | grep "Maximum resident set size" | awk 'NF>1{print $NF}')
     echo $((i)), $WCTIME, $UTIME, $STIME
  done
done