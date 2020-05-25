#!/usr/bin/env bash
# Many branches - perform client role, selecting from the branches
# Usage: mbc_profile.sh | tee results.csv

FN="Large.scr"
TEMPLATE="ManyBranchesClient.purs"
IFS=

echo "Branches, Wall clock time, User time, System time, Memory (kbytes)"
for ((s=1; s<=21; s++))
do
  for ((i=2; i<=100; i+=10))
  do
     rm -f $FN
     rm -rf src
     mkdir src

     echo $'module Large;\n\nexplicit global protocol ManyBranches(role Client, role Server) {' > $FN
     cat $TEMPLATE > src/Main.purs
     echo $'  Connect() connect Client to Server;' >> $FN	
     echo $'  choice at Client {\n    B1() from Client to Server;' >> $FN
     for ((j=2; j<=$i; j++))
     do
       echo $'  } or {\n    B'$j'() from Client to Server;' >> $FN
     done

     cat $TEMPLATE > src/Main.purs
     echo '        select (SProxy :: SProxy "b'$i'")' >> src/Main.purs
     echo '        send MB.B'$i >> src/Main.purs
     echo '        disconnect (Role :: Role MB.Server)' >> src/Main.purs
     echo '          where' >> src/Main.purs
     echo '            bind = ibind' >> src/Main.purs
     echo '            pure = ipure' >> src/Main.purs
     echo '            discard = bind' >> src/Main.purs
     echo $'  disconnect Client and Server;' >> $FN
     echo $'  }\n}' >> $FN

     docker run -v $(PWD):/gen/ --entrypoint "./scribblec.sh" scribble-purs -d ./scribblec.sh -d /gen/src /gen/Large.scr -api-ps ManyBranches > /dev/null 2>&1
     RESULTS=$( { time -p spago build; } 2>&1 3>&1)
    #  echo $RESULTS
     WCTIME=$(echo $RESULTS | grep "real" | awk 'NF>1{print $NF}')
     UTIME=$(echo $RESULTS | grep "user" | awk 'NF>1{print $NF}')
     STIME=$(echo $RESULTS | grep "sys" | awk 'NF>1{print $NF}')
     MEM=$(echo $RESULTS | grep "Maximum resident set size" | awk 'NF>1{print $NF}')
     echo $i, $WCTIME, $UTIME, $STIME, $MEM
  done
done
