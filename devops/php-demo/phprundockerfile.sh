用到的一些关键性命令
#docker run -d --name centos -it centos 
#docker exec -it centos bash 
#yum install gcc  libxslt libxslt-devel libxml2-devel openssl openssl-devel  \
 bzip2 bzip2-devel  libcurl-devel libjpeg-devel libpng-devel freetype-devel perl  gcc-c++ gcc-g77 autoconf gd-devel -y 
#ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone
#curl -O  http://yum.xxx.com/ctu/soft/libzip-1.2.0.tar.gz
#./configure
#make && make install 
#cp /usr/local/lib/libzip/include/zipconf.h /usr/local/include/
#curl -O http://yum.xxx.com/ctu/soft/php-7.3.7.tar.gz
#./configure --prefix=/usr/local/php \
    --enable-bcmath \
    --enable-calendar \
    --enable-exif \
    --enable-fpm  \
    --enable-ftp \
    --enable-shmop \
    --enable-soap \
    --enable-sockets \
    --enable-sysvmsg  \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-session  \
    --enable-sigchild \
    --enable-wddx \
    --enable-pcntl  \
    --enable-zip \
    --enable-xml  \
    --enable-inline-optimization \
    --enable-mbregex  \
    --enable-mbstring \
    --enable-opcache  \
    --with-mysqli=mysqlnd  \
    --with-pdo-mysql=mysqlnd  \
    --with-zlib  \
    --with-bz2  \
    --with-curl  \
    --with-gd  \
    --with-jpeg-dir \
    --with-png-dir  \
    --with-gettext  \
    --with-mhash  \
    --with-xmlrpc  \
    --with-xsl  \
    --with-zlib-dir \
    --with-pcre-dir \
    --without-pear  \
    --with-iconv  \
    --with-openssl  \
    --with-xmlrpc \
    --with-libxml-dir \
    --with-pcre-dir  \
    --with-freetype-dir \
    --without-pear
curl -O http://yum.xxx.com/ctu/conf/php.ini
curl -O http://yum.xxx.com/ctu/conf/php-fpm.conf
curl -O http://yum.xxx.com/ctu/soft/redis-4.3.0.tgz
listen = /dev/shm/php-fpm.sock
listen.owner = nobody
listen.group = nobody
listen.mode = 0660
fastcgi_pass unix:/dev/shm/php-fpm.sock;
curl -O http://yum.xxx.com/ctu/soft/nginx-1.16.0.tar.gz
./configure --prefix=/usr/local/nginx \
    --with-poll_module \
    --with-http_ssl_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_xslt_module \
    --with-http_image_filter_module \
    --with-http_sub_module  \
    --with-http_flv_module  \
    --with-file-aio \
    --with-http_gzip_static_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_degradation_module \
    --with-http_stub_status_module \
    --with-pcre
make && make install 	
vim run.sh 
#!/bin/bash
nohup /usr/local/php/sbin/php-fpm -c /usr/local/php/lib/php.ini -y /usr/local/php/etc/php-fpm.conf 2>&1 &	
/usr/local/nginx/sbin/nginx -g  'daemon off;'

然后优化镜像大小
yum clean all && rm -rf /var/cache/yum/* 
cd /
du -sh *



ls |egrep -v  "^(clear|dir|find|hostname|ldd|logname|more|pwd|sh|split|taskset|true|uptime|whereis|awk|cmp|du|free|iconv|link|mv|raw|base64|echo|id|ls|nohup|tty|vi|bash|cp|egrep|ping|vmstat|xargs|cat|curl|env|grep|ln|pkill|rm|top|cd|gunzip|kill|printenv|tail|touch|zgrep|chmod|date|fc|head|lastlog|logger|printf|sed|sleep|tailf|uniq|watch|chown|df|login|mkdir|ps|sort|tar|tracepath|wc)$"


去目录大的地方删除无用的文件和目录
docker ps -l 
docker commit -m "nginx-php" 095e3fba99ab doudou007/nginx-php:v1
vim Dockerfile
FROM doudou007/nginx-php:v1
EXPOSE 80 443
CMD ["/run.sh"]
docker build -t doudou007/nginx-php:latest ./
docker images |egrep doudou007 
docker push doudou007/nginx-php:latest
然后去其他机器运行
https://cloud.docker.com/repository/docker/doudou007/nginx-php/general
docker pull doudou007/nginx-php
docker run -d --name web --rm -p80:80 -v /data/wwwroot:/data/wwwroot doudou007/nginx-php
docker ps -l 
curl http://node:80


删除不运行的镜像
docker images |awk '{print $3}'|xargs docker rmi -f
docker images |egrep harbor|awk -v OFS=':' '{print $1,$2}'|xargs docker rmi















