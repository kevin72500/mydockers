#/sbin/bash
ip=`ifconfig|grep 192|awk '{print $2}'`
echo ${ip}
if [ -f  docker-compose.yml.bk ];then
  rm docker-compose.yml
  mv docker-compose.yml.bk docker-compose.yml
  sed -i ".bk" "s/127.0.0.1/${ip}/g" docker-compose.yml
else
  sed -i ".bk" "s/127.0.0.1/${ip}/g" docker-compose.yml
fi
docker-compose -f docker-compose.yml up -d
