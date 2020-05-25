#!/usr/bin/env bash
# Many branches - perform client role, selecting from the branches
# Usage: mbc_profile.sh | tee results.csv

FN="Large.scr"
TEMPLATE="OneToMany.purs"
IFS=

echo "Branches, Wall clock time, User time, System time, Memory (kbytes)"
for ((s=1; s<=20; s++))
do
  for ((i=2; i<=11; i++))
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

    #  for ((j=2; j<=$i; j++))
    #  do
    #    echo $'  Connect() connect A to B'$j';' >> $FN
    #    echo $'  M'$j'() from A to B'$j';' >> $FN
    #  done

     cat $TEMPLATE > src/Main.purs

     for ((j=2; j<=$i; j++))
     do
       echo $'        connect (Role :: Role OTM.B'$j') (URL $ "ws://127.0.0.1:916'$j'")' >> src/Main.purs
       echo $'        send (OTM.Connect)' >> src/Main.purs
       echo $'        send (OTM.M'$j')'  >> src/Main.purs
     done

     for ((j=2; j<=$i; j++))
     do
       echo $'        disconnect (Role :: Role OTM.B'$j')' >> src/Main.purs
    #    echo $'  disconnect A and B'$j';' >> $FN
     done
    #  echo $'  }' >> $FN

     echo '          where' >> src/Main.purs
     echo '            bind = ibind' >> src/Main.purs
     echo '            pure = ipure' >> src/Main.purs
     echo '            discard = bind' >> src/Main.purs

    #  cat $FN
    #  docker run -v $(PWD):/gen/ --entrypoint "./scribblec.sh" scribble-java -d ./scribblec.sh -d /gen/src /gen/Large.scr -api-ps OneToMany > /dev/null 2>&1
     cp oneToMany/OneToMany$i.purs src/Scribble/Protocol/Large/OneToMany.purs
     RESULTS=$( { time -p spago build; } 2>&1 3>&1)
     WCTIME=$(echo $RESULTS | grep "real" | awk 'NF>1{print $NF}')
     UTIME=$(echo $RESULTS | grep "user" | awk 'NF>1{print $NF}')
     STIME=$(echo $RESULTS | grep "sys" | awk 'NF>1{print $NF}')
    #  MEM=$(echo $RESULTS | grep "Maximum resident set size" | awk 'NF>1{print $NF}')
     echo $i, $WCTIME, $UTIME, $STIME
  done
done