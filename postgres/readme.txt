创建 docker-compose.yml 文件，内容参考
db:
  restart: always
  image: postgres:latest   // postgres 镜像
  privileged: true  //解决权限
  ports:
    - 5432:5432  //映射端口号
  environment:
    POSTGRES_PASSWORD: ${pwd}  //密码
    PGDATA: /var/lib/postgresql/data/pgdata //数据存储文件夹
  volumes:
    - /home/server/pg_data/data:/var/lib/postgresql/data/pgdata //将数据映射到对应的路径
注：启动时可能会出现权限问题，所以添加了 privileged: true

使用 docker-compose 命令启动服务
    docker-compose up -d
在docker-compose的时候 docker-compose up会优先使用已有的容器，而不是重新创建容器。需要带上 --force-recreate 参数重新创建容器 docker-compose up -d --force-recreate 。

docker-compose的安装
参考：https://docs.docker.com/compose/install/#prerequisites
本文内容参考：
https://blog.csdn.net/sinat_20560415/article/details/81204445

注：当有多个schema（模式）时，可以设置postgresql.conf改变默认的search_path，否则需要每次登陆时设置search_path以访问不同模式下面的对象；

作者：子非黑白鱼
链接：https://www.jianshu.com/p/56c2bd4f0bb5
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
