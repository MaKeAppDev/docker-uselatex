FROM ubuntu

COPY install-texlive.sh /tmp/install-texlive.sh

RUN apt-get update -y
RUN apt-get install -y wget git curl

RUN /tmp/install-texlive.sh

# RUN apt-get install texlive-full -y

RUN apt-get install -y cmake
RUN wget https://raw.githubusercontent.com/kmorel/UseLATEX/master/UseLATEX.cmake
RUN mv UseLATEX.cmake /usr/share/cmake-2.8/Modules/
