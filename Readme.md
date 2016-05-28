# UseLaTeX.cmake Docker Container
### Installed Packages
- texlive-full
- cmake
- UseLATEX.cmake
- [LaTeX4Ei](https://github.com/latex4ei/latex4ei-packages)

### Sample Usage
```
docker run --interactive --volume=$(pwd):/opt/workspace --workdir=/opt/workspace --rm makeappdev/uselatex  /bin/sh -c "mkdir -p build && cd build && cmake .. && make"
```
