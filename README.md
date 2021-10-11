# binex

`binex` is an Ubuntu-based Docker image built for binary inspection and exploitation, such as would be used for creating/exploiting buffer overflows and working on CTFs.

It comes in most handy when using a computer without all of the necessary tools installed, or especially on MacOS where getting `gdb` to work properly can be a pain.

It's also very handy on Windows, for obvious reasons.

Scroll down to the bottom for a [probably non-exhaustive] list of all installed scripts, tools, and utilities.  More will be added in time.

**There are a few different ways to run `binex`:**

## Pull latest image from DockerHub

`docker run --name binex --rm -itv /path/to/host_folder_to_share:/share lphxl/binex:latest /bin/bash`

You will need to specify the path to the directory on the host that you wish to mount to the `/share` directory in the container.

#### Updating the image:

`docker pull lphxl/binex:latest`

Running via DockerHub is the most straightforward way to run `binex`, and I will always try to keep the image up-to-date.
However, since DockerHub recently made GitHub integration a subscription-only feature, the image will not auto-update on new pushes to the repository.
I may go with the Pro Plan at some point, but if you want to guarantee that you have the most upt-to-date image or you don't want to blindly trust my DockerHub image,
feel free to read the `Dockerfile` and build it directly using the method below.

## Build from Dockerfile

```
git clone https://github.com/phx/binex
cd binex
docker build -t binex .
docker run --name binex --rm -itv /path/to/host_folder_to_share:/share binex /bin/bash
```

I have the following personal alias sourced from my `~/.bash_profile` for that last command:

`alias binex='docker run --name binex --rm -itv /Users/phx:/share binex /bin/bash'`

#### Updating the image:

Just `cd` back to the binex git repo directory, pull any updates, and rebuild the image:

```
cd binex
git pull
docker build -t binex .
```

## Probably incomplete list of scripts, and tools installed:

```
build-essential
gdb
- peda (https://github.com/longld/peda)
python2.7:
- pip
  - pwntools
  - ropper
  - lilendian (https://github.com/phx/lilendian)
python3:
- pip
  - pwntools
  - ropper
  - lilendian (https://github.com/phx/lilendian)
libc-database (https://github.com/niklasb/libc-database)
checksec (standalone)
pattern_create.rb (https://raw.githubusercontent.com/rapid7/metasploit-framework/master/tools/exploit/pattern_create.rb)
pattern_offset.rb (https://raw.githubusercontent.com/rapid7/metasploit-framework/master/tools/exploit/pattern_offset.rb)
personal scripts:
- hex2ascii
- hexorganize
- hex2ascii_organize
- pietest
- vc
others tools:
- curl
- dnsutils
- less
- lsof
- nano
- nc
- ncat
- socat
- telnet
- vim
- wget
```
