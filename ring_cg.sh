#!/usr/bin/env bash
# Many branches - perform client role, selecting from the branches
# Usage: mbc_profile.sh | tee results.csv

FN="Large.scr"
TEMPLATE="OneToMany.purs"
IFS=

echo "RingSize, Wall clock time, User time, System time, Memory (kbytes)"
for ((s=1; s<=1; s++))
do
  for ((i=9; i<=9; i++))
  do
     rm -f $FN
     rm -rf src
     mkdir src

     ROLES="role A"
     for ((j=2; j<=$i; j++))
     do
       ROLES+=", role B$j"
     done

     echo $'module Large;\n\nexplicit global protocol OneToMany('$ROLES') {' > $FN
     echo $'  Connect() connect A to B2;' >> $FN
     echo $'  M() from A to B2;' >> $FN

     for ((j=2; j<$i; j++))
     do
       echo $'  Connect() connect B'$j' to B'$((j+1))';' >> $FN
       echo $'  M() from B'$j' to B'$((j+1))';' >> $FN
     done

     echo $'  Connect() connect B'$i' to A;' >> $FN
     echo $'  M() from B'$i' to A;' >> $FN
     echo $'  disconnect A and B2;' >> $FN
     
     for ((j=2; j<$i; j++))
     do
       echo $'  disconnect B'$j' and B'$((j+1))';' >> $FN
     done

     echo $'  disconnect B'$i' and A;' >> $FN
     echo $'  }' >> $FN

    #  cat $FN
     RESULTS=$( { time -p docker run -v $(PWD):/gen/ --entrypoint "./scribblec.sh" scribble-java -d ./scribblec.sh -d /gen/src /gen/Large.scr -api-ps OneToMany; })
    #  RESULTS=$( { time -p spago build; } 2>&1 3>&1)
    # #  echo $RESULTS
     WCTIME=$(echo $RESULTS | grep "real" | awk 'NF>1{print $NF}')
     UTIME=$(echo $RESULTS | grep "user" | awk 'NF>1{print $NF}')
     STIME=$(echo $RESULTS | grep "sys" | awk 'NF>1{print $NF}')
    #  MEM=$(echo $RESULTS | grep "Maximum resident set size" | awk 'NF>1{print $NF}')
     echo $i, $WCTIME, $UTIME, $STIME
  done
done