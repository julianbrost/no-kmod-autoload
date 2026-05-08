# no-kmod-autoload

Tooling to stop autoloading of kernel modules on Linux.

## Motivation

A number of recent local privilege escalation vulnerabilities
([CVE-2026-31431], [CVE-2026-43284 and CVE-2026-43500]) were disclosed with
exploits available before patched kernel versions were widely available.
Alongside the exploit, there also came a mitigation guide, that involved
preventing certain kernel modules from being loaded. This raises a question:
Does my computer need to automatically load every module if it is implicilty
requested by some user action? Typically, after the system finished booting up,
most kernel modules that are needed should have been loaded. Searching for this
brings up the [sysctl `kernel.modules_disabled`] which does solve this, but is
rather inconvenient: Once enabled, the kernel will not load or unload any
modules anymore. If you then notice that you are missing a module, say `tun` to
establish a VPN connection, you are forced to reboot first.

## How it works

When the kernel initiates loading a module, it invokes `modprobe` as a
userspace helper, which will then locate the appropriate kernel module in the
filesystem and then load it. The path of the userspace helper is controlled by
the [sysctl `kernel.modprobe`] and setting this to the empty string disables
autoloading. Thus, a quick `sysctl -w kernel.modprobe=''` is enough to disable
it. That is basically all the magic, everything else in this project is just to
make it a bit nicer and more convenient.

This project provides a systemd serivce unit that automatically sets the sysctl
after the system startup has finished. Also, instead of just disabling the
userspace helper, it instead installs a small shell script as the helper which
does not load the module but rather prints a helpful message to the kernel log
instead so that it appears in `dmesg`.

## Installation

Installation from source is possible using the following commands:

```console
# git clone https://codeberg.org/jb/no-kmod-autoload.git
# cd no-kmod-autoload
# make install
# systemctl enable --now no-kmod-autoload.service
```

If everything was successful, you should see a confirmation message showing up
in `dmesg`.

By default, everything is installed in `/usr/local`. The path can be customized
by setting make variables, for example `make prefix=/foo install`. See the top
of the `Makefile` for all paths that can be customized.

## Caveats

While most modules needed for hardware support are loaded by the time the
system finished booting, modules for devices that are not permanently connected
may be missing. Think of USB storage or USB-C docks for example. This also
applies to virtual devices like VPN connections or devices for containers. So
when starting to use this, there may be a few situations where you need to
manually load modules. To make this more convenient, modules that are regularly
needed on your system, but not loaded impliclity during boot, can be expliclity
configured to be loaded in `/etc/modules-load.d/`.

[CVE-2026-31431]: https://copy.fail/
[CVE-2026-43284 and CVE-2026-43500]: https://dirtyfrag.io/
[sysctl `kernel.modules_disabled`]: https://docs.kernel.org/admin-guide/sysctl/kernel.html#modules-disabled
[sysctl `kernel.modprobe`]: https://docs.kernel.org/admin-guide/sysctl/kernel.html#modprobe

<!--
SPDX-FileCopyrightText: 2026 Julian Brost <julian@0x4a42.net>
SPDX-License-Identifier: MIT
-->
