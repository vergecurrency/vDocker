FROM ubuntu:latest
MAINTAINER marplezDEV

ARG BRANCH

# Basic env setup
RUN apt-get update
RUN apt-get -y install git build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 software-properties-common apt-utils
RUN add-apt-repository ppa:bitcoin/bitcoin

# install dependecies
RUN apt-get -y install libssl-dev libevent-dev libboost-all-dev \
    zlib1g-dev libseccomp-dev libcap-dev libncap-dev \
    software-properties-common libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libzmq3-dev gosu

WORKDIR /app
RUN git clone https://github.com/vergecurrency/VERGE.git verge

# switch to the freshly cloned verge project & compile it
WORKDIR /app/verge
RUN if [ -z "${BRANCH}" ] ; then echo "Branch not provided [default: develop]" && git checkout develop ; else git checkout ${BRANCH}; fi

# compile verged fresh
RUN ./autogen.sh
RUN ./configure --disable-bench --disable-gui --disable-tests --disable-gui-tests --disable-dependency-tracking
RUN make -j8

ENV VERGE_DATA=/data/verge
ENV PATH=$PATH:/app/verge/src
RUN echo $PATH

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["verged"]