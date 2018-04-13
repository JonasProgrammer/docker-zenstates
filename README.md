# Docker Zenstates

Dockerized version of [zenstates by r4m0n](https://github.com/r4m0n/ZenStates-Linux).

## Usage

The docker image is just a lightweight wrapper that executes the `zenstates.py` script
as it's entrypoint. If you need another script (such as `togglecode.py`), you'll have to
overwrite the entrypoint.

Beware that the container needs to be run in privileged mode and the `msr` kernel module
must be loaded.

### Example Usage

List the current state configuration (the image defaults to `--list` as `CMD`):

`docker run --privileged --rm -it jonasprogrammer/zenstates`
`docker run --privileged --rm -it jonasprogrammer/zenstates --list`

Disable the infamous Ryzen C6 state, that causes penguins to soft or hard lockup randomly:

`docker run --privileged --rm -it jonasprogrammer/zenstates --c6-disable`

## ZenStates-Linux
Collection of utilities for Ryzen processors and motherboards

### zenstates.py
Dynamically edit AMD Ryzen processor P-States

Requires root access and the msr kernel module loaded (just run "modprobe msr" as root).

    usage: zenstates.py [-h] [-l] [-p {0,1,2,3,4,5,6,7}] [--enable] [--disable] [-f FID] [-d DID] [-v VID]

    Sets P-States for Ryzen processors

    optional arguments:
      -h, --help            show this help message and exit
      -l, --list            List all P-States
      -p {0,1,2,3,4,5,6,7}, --pstate {0,1,2,3,4,5,6,7}
                            P-State to set
      --enable              Enable P-State
      --disable             Disable P-State
      -f FID, --fid FID     FID to set (in hex)
      -d DID, --did DID     DID to set (in hex)
      -v VID, --vid VID     VID to set (in hex)
      --c6-enable           Enable C-State C6
      --c6-disable          Disable C-State C6


### togglecode.py
Turns on/off the Q-Code display on ASUS Crosshair VI Hero motherboards (and other boards with a compatible Super I/O chip)

Requires root access and the portio python module (to install run "pip install portio")

