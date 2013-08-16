rm *
rm -r CMake hphp

fakesu

apt-get update
apt-get -y install git-core libmysqlclient-dev libxml2-dev libmcrypt-dev libicu-dev openssl binutils-dev libcap-dev libgd2-xpm-dev zlib1g-dev libtbb-dev libonig-dev libpcre3-dev autoconf libtool libcurl4-openssl-dev wget libreadline-dev libncurses-dev libicu-dev libbz2-dev libc-client2007e-dev subversion bzip2 python-software-properties gawk

export CMAKE_PREFIX_PATH=`pwd`

# gcc
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get -y install gcc-4.6 g++-4.6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.6 20

# hiphop-base
git clone git://github.com/facebook/hiphop-php.git

# libevent
git clone git://github.com/libevent/libevent.git
cd libevent
git checkout release-1.4.14b-stable
cat ../hiphop-php/hphp/third_party/libevent-1.4.14.fb-changes.diff | patch -p1
./autogen.sh
./configure --prefix=$CMAKE_PREFIX_PATH
make -j
make install
cd ..

# curl
git clone git://github.com/bagder/curl.git
cd curl
./buildconf
./configure --prefix=$CMAKE_PREFIX_PATH
make -j
make install
cd ..

# libmemcached
wget http://launchpad.net/libmemcached/1.0/0.49/+download/libmemcached-0.49.tar.gz
tar -xzvf libmemcached-0.49.tar.gz
cd libmemcached-0.49
apt-get install -y libcloog-ppl0
./configure --prefix=$CMAKE_PREFIX_PATH
make -j
make install
cd ..

# cmake
wget http://www.cmake.org/files/v2.8/cmake-2.8.11.2.tar.gz
tar -xzvf cmake-2.8.11.2.tar.gz
cd cmake-2.8.11.2
./configure
make -j
make install
cd ..

# glog
svn checkout http://google-glog.googlecode.com/svn/trunk/ google-glog
cd google-glog
./configure --prefix=$CMAKE_PREFIX_PATH
make -j
make install
cd ..

# jemaloc
# wget http://www.canonware.com/download/jemalloc/jemalloc-3.0.0.tar.bz2
# tar xjvf jemalloc-3.0.0.tar.bz2
# cd jemalloc-3.0.0
# ./configure --prefix=$CMAKE_PREFIX_PATH
# make -j
# make install
# cd ..

# libunwind
wget http://download.savannah.gnu.org/releases/libunwind/libunwind-1.1.tar.gz
tar -xzvf libunwind-1.1.tar.gz
cd libunwind-1.1
./configure --prefix=$CMAKE_PREFIX_PATH
make -j
make install
cd ..

# tbb
wget http://ubuntu.wikimedia.org/ubuntu//pool/universe/t/tbb/libtbb2_4.0+r233-1_amd64.deb
wget http://ubuntu.wikimedia.org/ubuntu//pool/universe/t/tbb/libtbb-dev_4.0+r233-1_amd64.deb
dpkg -i libtbb*

# boost
wget 'http://downloads.sourceforge.net/project/boost/boost/1.48.0/boost_1_48_0.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fboost%2Ffiles%2Fboost%2F1.48.0%2F&ts=1376612902&use_mirror=hivelocity' -O boost_1_48_0.tar.gz
tar zxvf boost_1_48_0.tar.gz
cd boost_1_48_0
./bootstrap.sh --prefix=$CMAKE_PREFIX_PATH
./b2 install
cd ..

# libelf
wget http://launchpadlibrarian.net/71053826/libelf1_0.152-1ubuntu1_amd64.deb
wget http://launchpadlibrarian.net/76118581/libdwarf-dev_20110612-2_amd64.deb
wget http://launchpadlibrarian.net/71053827/libelf-dev_0.152-1ubuntu1_amd64.deb
dpkg -i libelf-dev_0.152-1ubuntu1_amd64.deb libdwarf-dev_20110612-2_amd64.deb libelf1_0.152-1ubuntu1_amd64.deb

# hiphop
git clone git://github.com/facebook/hiphop-php.git
cd hiphop-php
export HPHP_HOME=`pwd`
../cmake-2.8.11.2/bin/cmake .
make -j 8
