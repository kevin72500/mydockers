#/sbin/bash
ip=`ifconfig|grep 192|awk '{print $2}'`
echo ${ip}
