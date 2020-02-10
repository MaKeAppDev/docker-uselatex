FROM rikorose/gcc-cmake:latest

# Install Texlive and tools
RUN apt update -y \
    && apt install -y wget git zip texlive-full imagemagick

# Install UseLATEX.cmake
RUN wget https://gitlab.kitware.com/kmorel/UseLATEX/raw/master/UseLATEX.cmake \
    && CMAKE_ROOT=$(cmake --system-information | grep "CMAKE_ROOT " | cut -d' ' -f 2 | cut -d'"' -f2) \
    && mv UseLATEX.cmake $CMAKE_ROOT/Modules/

# Install custom LaTeX4Ei package
RUN wget https://github.com/latex4ei/latex4ei-packages/archive/master.zip \
    && unzip master.zip \
    && rm master.zip \
    && mv latex4ei-packages-master /usr/share/texlive/texmf-dist/tex/latex/latex4ei \
    && mktexlsr
