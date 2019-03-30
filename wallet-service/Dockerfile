FROM node:latest
ARG TAG

RUN PATH=$(echo $PATH | tr ':' "\n" | sed '/\/opt\/python/d' | tr "\n" ":" | sed "s|::|:|g")
RUN PATH=$PATH:/usr/lib/llvm-6.0/bin/
RUN export PATH

WORKDIR /app

# Basic env setup
RUN apt-get update
RUN apt-get -y install git build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 software-properties-common apt-utils
RUN add-apt-repository ppa:bitcoin/bitcoin

# install dependecies
RUN apt-get -y install libssl-dev libevent-dev libboost-all-dev \
    && apt-get -y install zlib1g-dev libseccomp-dev libcap-dev libncap-dev \
    && apt-get -y install software-properties-common \
    && apt-get -y install libdb4.8-dev libdb4.8++-dev \
    && apt-get -y install libminiupnpc-dev \
    && apt-get -y install libzmq3-dev

RUN git clone https://github.com/vergecurrency/VERGE.git verge

# switch to the freshly cloned verge project & compile it
WORKDIR /app/verge
RUN if [ -z "${TAG}" ] ; then echo "Tag not provided" ; else git checkout tags/${TAG} -b official-${TAG}; fi

# compile verged fresh
RUN ./autogen.sh
RUN ./configure --disable-bench --disable-gui --disable-tests --disable-gui-tests 
RUN make -j3

WORKDIR /app/verge/src

CMD [ "./verged", "-server=1 -rpcuser=test -rpcpassword=test -rpcallowip=127.0.0.1 -datadir=/data/verge" ]