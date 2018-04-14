#!/bin/bash
cd ~/scaletest/
source coinlist
count=0

while [ "x${coinlist[count]}" != "x" ]
do
  all=${coinlist[count]}
  name=${all%% *}
  if [ "$name" != "" ]
    then
     echo $name
     size=$(komodo-cli -ac_name=$name getmempoolinfo | awk ' /\"size\"/ {printf $2}' | sed 's/,//' )
	 if $size < 100 then;
		komodo-cli -ac_name=$name $1 $2 $3 $4 $5 $6 $7 $8 $9
	 fi
  fi
  count=$(( $count +1 ))
done