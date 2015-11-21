#!/bin/bash

echo "Installing TeXLive from ctan"

# Download texlive installer
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -zxvf install-tl-unx.tar.gz
INSTALLER=$(find . -name client -prune -o -name 'install-tl' -print)
chmod +x $INSTALLER

# execute texlive installer
$INSTALLER --profile /tmp/texlive.profile
find / -name pdflatex
/usr/local/texlive/2015/bin/x86_64-linux/tlmgr install codesection lastpackage tablestyles templatetools

# clean
rm -rf install-tl-*

# Set PATH
export PATH=$PATH:/usr/local/texlive/2015/bin/x86_64-linux/
echo "export PATH=$PATH:/usr/local/texlive/2015/bin/x86_64-linux/" | sudo tee -a /etc/profile
