#!/usr/bin/env bash
# Many branches - perform server role, offering the branches
# Usage: mbs_profile.sh | tee results.csv

# FN="Large.scr"
# TEMPLATE="ManyBranchesServer.purs"
# IFS=

# echo "Branches, Wall clock time, User time, System time, Memory (kbytes)"

# for ((s=1; s<=3; s++))
# do
#   for ((i=2; i<=15; i+=1))
#   do
#      rm -f $FN
#      rm -rf src
#      mkdir src

#      echo $'module Large;\n\nexplicit global protocol ManyBranches(role Client, role Server) {' > $FN
#      cat $TEMPLATE > src/Main.purs

#      echo $'  Connect() connect Client to Server;' >> $FN
#      echo $'  choice at Client {\n    B1() from Client to Server;' >> $FN
#      echo '             b1: \c -> SC.receive c >>= (\(Tuple _ c) ->  pure c)' >> src/Main.purs
#      for ((j=2; j<=$i; j++))
#      do
#        echo $'  } or {\n    B'$j'() from Client to Server;' >> $FN
#        echo $'           , b'$j': \c -> SC.receive c >>= (\(Tuple _ c) ->  pure c)' >> src/Main.purs
#      done
#      echo $'  disconnect Client and Server;' >> $FN
#      echo $'  }\n}' >> $FN
#      echo '         }' >> src/Main.purs

#      docker run -v $(PWD):/gen/ --entrypoint "./scribblec.sh" scribble-java -d ./scribblec.sh -d /gen/src /gen/Large.scr -api-ps ManyBranches > /dev/null 2>&1
#      RESULTS=$( { time -p pulp build; })
#      WCTIME=$(echo $RESULTS | grep "real" | awk 'NF>1{print $NF}')
#      UTIME=$(echo $RESULTS | grep "user" | awk 'NF>1{print $NF}')
#      STIME=$(echo $RESULTS | grep "sys" | awk 'NF>1{print $NF}')
#      MEM=$(echo $RESULTS | grep "Maximum resident set size" | awk 'NF>1{print $NF}')
#      echo $i, $WCTIME, $UTIME, $STIME, $MEM
#   done
# done

FN="Large.scr"
TEMPLATE="ManyBranchesServer.purs"
IFS=

echo "Branches, Wall clock time, User time, System time, Memory (kbytes)"

for ((s=1; s<=3; s++))
do
  for ((i=2; i<=15; i+=1))
  do
     rm -f $FN
     rm -rf src
     mkdir src

     echo $'module Large;\n\nexplicit global protocol ManyBranches(role Client, role Server) {' > $FN
     cat $TEMPLATE > src/Main.purs

     echo $'  Connect() connect Client to Server;' >> $FN
     echo $'  choice at Client {\n    B1() from Client to Server;' >> $FN
    #  echo '        b1: \c -> SC.receive c >>= (\(Tuple _ c) ->  pure c)' >> src/Main.purs
     echo $'        { b1: do' >> src/Main.purs
     echo $'           MB.B1 <- receive' >> src/Main.purs
     for ((j=2; j<=$i; j++))
     do
       echo $'  } or {\n    B'$j'() from Client to Server;' >> $FN
       echo $'        , b'$j': do' >> src/Main.purs
       echo $'             MB.B'$j'<- receive' >> src/Main.purs
     done
     echo '        }' >> src/Main.purs
     echo '        disconnect (Role :: Role MB.Client)' >> src/Main.purs
     echo $'  disconnect Client and Server;' >> $FN
     echo $'  }\n}' >> $FN


     docker run -v $(PWD):/gen/ --entrypoint "./scribblec.sh" scribble-java -d ./scribblec.sh -d /gen/src /gen/Large.scr -api-ps ManyBranches > /dev/null 2>&1
     RESULTS=$( { time -p spago build; })
     WCTIME=$(echo $RESULTS | grep "real" | awk 'NF>1{print $NF}')
     UTIME=$(echo $RESULTS | grep "user" | awk 'NF>1{print $NF}')
     STIME=$(echo $RESULTS | grep "sys" | awk 'NF>1{print $NF}')
     MEM=$(echo $RESULTS | grep "Maximum resident set size" | awk 'NF>1{print $NF}')
     echo $i, $WCTIME, $UTIME, $STIME, $MEM
  done
done
