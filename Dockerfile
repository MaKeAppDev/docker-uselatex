FROM texlive/texlive:latest

# Install Texlive and tools
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    wget git zip build-essential cmake imagemagick poppler-utils ghostscript && \
    rm -rf /var/lib/apt/lists/*

# Install UseLATEX.cmake
RUN wget https://gitlab.kitware.com/kmorel/UseLATEX/raw/main/UseLATEX.cmake \
    && CMAKE_ROOT=$(cmake --system-information | grep "CMAKE_ROOT " | cut -d' ' -f 2 | cut -d'"' -f2) \
    && mv UseLATEX.cmake $CMAKE_ROOT/Modules/

# Install custom LaTeX4Ei package
RUN wget https://github.com/latex4ei/latex4ei-packages/archive/master.zip \
    && unzip master.zip \
    && rm master.zip \
    && mv latex4ei-packages-master /usr/local/texlive/texmf-local/tex/latex/local/latex4ei \
    && mktexlsr
