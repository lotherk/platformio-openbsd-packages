# platformio packages for OpenBSD

Discussion: [https://community.platformio.org/t/openbsd-esp8266-partially-working-help-with-atmelavr/18376](https://community.platformio.org/t/openbsd-esp8266-partially-working-help-with-atmelavr/18376)

Little helper scripts to build OpenBSD packages for platformio (specifically for esp8266 and atmelavr, but can be easy extended).

Packages are currently available at [https://konradlother.com/pub/platformio](https://konradlother.com/pub/platformio) and are build on amd64 and arm64 OpenBSD 6.8-RELEASE and work with 6.8-STABLE and -CURRENT.

# required packages
`git`, `gmake` and `arduino-esp8266` are only required to *build* the packages but not to *run* them.

```
# pkg_add git gmake arduino-esp8266 py3-pip
```

# install platformio

```
# pip3.8 install platformio
```

# build packages and test

```
$ git clone https://github.com/lotherk/platformio-openbsd-packages
$ cd platformio-openbsd-packages
$ ./build.sh
$ cd test; pio run
```
