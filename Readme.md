# UseLaTeX.cmake Docker Container
### Installed Packages
- texlive-full
- cmake
- UseLATEX.cmake

### Sample Usage
```
docker run --interactive --volume=$(pwd):/opt/workspace --workdir=/opt/workspace --rm makeappdev/uselatex  /bin/sh -c "mkdir -p build && cd build && cmake .. && make"
```
