# Telesketch

![image](https://github.com/durangoretro/telesketch/assets/6067824/44e6d833-5df7-4d67-ad2e-ece6b989e215)


Draw Lines on Your Screen. Use the Directions buttons to draw the White line. This Game is in High Res Mode.

To use it on perdita, please start with -g option.

To compile this Game, You will need the next Dependencies:

* [CC65 Suite](https://cc65.github.io)
* [DurangoLib(v 0.1.0 or later)](https://durangoretro.com/https://durangoretro.com/tools/durangolib/)
* [Rescomp Java Utility](https://github.com/durangoretro/rescomp)
After download or install the dependencies, use the next commands to build the ROM:

```bash
make
```

or using the [Durango Dev Kit Docker Image](https://durangoretro.com/tools/docker/).

```bash
docker --rm -v $PWD:/src/durango zerasul/durangodevkit:latest
```
