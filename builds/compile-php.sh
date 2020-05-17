sudo yum update -y
sudo yum install autoconf bison re2c gcc gcc-c++ libcurl-devel libxml2-devel -y

curl -sL http://www.openssl.org/source/openssl-1.0.2k.tar.gz | tar -xvz
cd openssl-1.0.2k
./config && make && sudo make install
cd -

curl -sL https://github.com/php/php-src/archive/php-7.3.18.tar.gz | tar -xvz
mkdir php7
cd php-src-php-7.3.18
./buildconf --force
# --prefix=/home/ec2-user/builds/php7/ for ec2
./configure --prefix=/home/ec2-user/environment/builds/php7/ --with-openssl=/usr/local/ssl --with-curl --with-zlib
# --enable-mbstring \
# --with-xmlrpc \
# --enable-soap \
# --enable-zip \
# --with-gd \
# --with-jpeg-dir \
# --with-png-dir \
# --with-mysqli \
# --with-pgsql \
# --enable-embedded-mysqli \
# --with-freetype-dir \
# --with-ldap \
# --enable-intl \
# --with-mysqlnd \
# --with-xsl
make install
