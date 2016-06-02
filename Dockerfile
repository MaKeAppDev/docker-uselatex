FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y wget git zip

# Install Texlive
RUN apt-get install texlive-full imagemagick -y

# Install important fix of titlesec package
RUN wget http://mirrors.ctan.org/macros/latex/contrib/titlesec.zip
RUN unzip titlesec.zip
RUN rm -r /usr/share/texlive/texmf-dist/tex/latex/titlesec
RUN mv titlesec /usr/share/texlive/texmf-dist/tex/latex/.

# Install Cmake with UseLATEX.cmake
RUN apt-get install -y cmake
RUN wget https://raw.githubusercontent.com/kmorel/UseLATEX/master/UseLATEX.cmake
RUN mv UseLATEX.cmake /usr/share/cmake-3.5/Modules/

# Install custom LaTeX4Ei package
RUN wget https://github.com/latex4ei/latex4ei-packages/archive/master.zip
RUN unzip master.zip
RUN mv latex4ei-packages-master /usr/share/texlive/texmf-dist/tex/latex/latex4ei
RUN mktexlsr
