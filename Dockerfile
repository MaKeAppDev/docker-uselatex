FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y wget git

#RUN source install-texlive.sh

RUN apt-get install texlive-full -y

RUN apt-get install -y cmake
RUN wget https://raw.githubusercontent.com/kmorel/UseLATEX/master/UseLATEX.cmake
RUN mv UseLATEX.cmake /usr/share/cmake-2.8/Modules/
