FROM debian:latest

RUN apt-get update

RUN apt-get -qq -y install git
RUN apt-get -qq -y install shellinabox
RUN apt-get -qq -y install build-essential cmake

RUN mkdir -p /code
WORKDIR /code
RUN git clone http://root.cern.ch/git/llvm.git src
WORKDIR /code/src
RUN git checkout cling-patches
RUN mkdir -p /code/src/tools
WORKDIR /code/src/tools
RUN git clone http://root.cern.ch/git/cling.git
RUN git clone http://root.cern.ch/git/clang.git
WORKDIR /code/src/tools/clang
RUN git checkout cling-patches
WORKDIR /code/
RUN mkdir build
WORKDIR /code/build
RUN apt-get -qq -y install python
RUN cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release ../src
RUN cmake --build .
RUN cmake --build . --target install

RUN useradd -ms /bin/bash cling
#USER cling
WORKDIR /home/cling
#ADD https://github.com/rianadon/shellinabox-md-style/raw/master/00%2BBlack%20on%20White.css /etc/shellinabox/options-enabled/
COPY ["00+Black on White.css" ,"/"]
COPY ["shellinabox-themes", "/usr/local/share/shellinabox"]

CMD ["shellinaboxd", "-t", "-s", "/cling:cling:cling:HOME:/usr/local/bin/cling", "--static-file=styles.css:/usr/local/share/shellinabox/shellinabox.css", "--user-css=Tomorrow Light:+/usr/local/share/shellinabox/theme-tomorrow-light.css,Tomorrow Dark:-/usr/local/share/shellinabox/theme-tomorrow-dark.css"]


