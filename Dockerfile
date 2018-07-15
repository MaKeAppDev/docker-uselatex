FROM rikorose/gcc-cmake:latest

RUN apt update -y
RUN apt install -y wget git zip

# Install Texlive
RUN apt install texlive-full imagemagick -y

# Install important fix of titlesec package
RUN wget http://mirrors.ctan.org/macros/latex/contrib/titlesec.zip
RUN unzip titlesec.zip
RUN rm -r /usr/share/texlive/texmf-dist/tex/latex/titlesec
RUN mv titlesec /usr/share/texlive/texmf-dist/tex/latex/.

# Install UseLATEX.cmake
RUN wget https://gitlab.kitware.com/kmorel/UseLATEX/raw/master/UseLATEX.cmake
RUN CMAKE_ROOT=$(cmake --system-information | grep "CMAKE_ROOT " | cut -d' ' -f 2 | cut -d'"' -f2) && mv UseLATEX.cmake $CMAKE_ROOT/Modules/

# Install custom LaTeX4Ei package
RUN wget https://github.com/latex4ei/latex4ei-packages/archive/master.zip
RUN unzip master.zip
RUN mv latex4ei-packages-master /usr/share/texlive/texmf-dist/tex/latex/latex4ei
RUN mktexlsr
