FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y wget git curl zip

# Install Texlive
RUN apt-get install texlive-full imagemagick -y

# Install Cmake with UseLATEX.cmake
RUN apt-get install -y cmake
RUN wget https://raw.githubusercontent.com/kmorel/UseLATEX/master/UseLATEX.cmake
RUN mv UseLATEX.cmake /usr/share/cmake-3.5/Modules/

# Install custom LaTeX4Ei package
RUN wget https://github.com/latex4ei/latex4ei-packages/archive/master.zip
RUN unzip master.zip
RUN mv latex4ei-packages-master /usr/share/texlive/texmf-dist/tex/latex/latex4ei
