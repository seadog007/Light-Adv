#!/bin/bash

while true
do
out='{'
left=`grep 'z:-184,y:63,x:21' logs/latest.log | tail -n1`
right=`grep 'z:-184,y:63,x:27' logs/latest.log | tail -n1`
[ -n "`echo $left | grep 'Text1:"0"'`" ] && out=$out'"left": false, '
[ -n "`echo $left | grep 'Text1:"1"'`" ] && out=$out'"left": true, '
[ -n "`echo $right | grep 'Text1:"0"'`" ] && out=$out'"right": false'
[ -n "`echo $right | grep 'Text1:"1"'`" ] && out=$out'"right": true'
out=$out'}'
echo $out
echo $out > light.json
sleep 1
done

