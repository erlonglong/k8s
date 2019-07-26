FROM harbor.120.net/devops/centos:7.6
RUN yum install gcc  libxslt libxslt-devel libxml2-devel openssl openssl-devel  bzip2 bzip2-devel  libcurl-devel libjpeg-devel libpng-devel freetype-devel perl  gcc-c++ gcc-g77 autoconf gd-devel -y \
&& ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone;cd /usr/local/src/ \
&& curl -O  http://yum.120ask.com/ctu/soft/libzip-1.2.0.tar.gz  && tar -zxvf libzip-1.2.0.tar.gz &&cd libzip-1.2.0 && ./configure && make && make install \ 
&& cp /usr/local/lib/libzip/include/zipconf.h /usr/local/include/ ;cd /usr/local/src/;curl -O http://yum.120ask.com/ctu/soft/php-7.3.7.tar.gz \ 
&& tar -zxf php-7.3.7.tar.gz && cd php-7.3.7 \
&& ./configure --prefix=/usr/local/php \
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
    --without-pear \
&& make -j  && make install;cd /usr/local/src/ \
&& curl -O http://yum.120ask.com/ctu/soft/redis-5.0.1.tgz && tar -zxf redis-5.0.1.tgz && cd redis-5.0.1 \
&& /usr/local/php/bin/phpize && ./configure --with-php-config=/usr/local/php/bin/php-config && make && make install \
&& cd /usr/local/php/etc/ && curl -O http://yum.120ask.com/ctu/conf/php-fpm.conf \
&& cd /usr/local/php/lib && curl -O http://yum.120ask.com/ctu/conf/php.ini && cd /usr/bin/ && history -c
&& rm -rf /usr/local/src  && rm -rf /usr/sbin/* && yum clean all && rm -rf /var/cache/yum && rm -rf /var/lib/yum && rm -rf /var/lib/rpm 
CMD ["/usr/local/php/sbin/php-fpm","-c","/usr/local/php/lib/php.ini" ,"-y","/usr/local/php/etc/php-fpm.conf","-F"]
