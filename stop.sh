#!/bin/sh

# SPDX-FileCopyrightText: 2026 Julian Brost <julian@0x4a42.net>
# SPDX-License-Identifier: MIT

if [ $# -ne 0 ]; then
	echo "usage: $0" >&2
	exit 1
fi

echo '<0>modprobe (no-kmod-autoload): restoring automatic module loading' > /dev/kmsg
if sysctl --quiet --write "$(</run/no-kmod-autoload-state)"; then
  	rm /run/no-kmod-autoload-state
else
  echo '<0>modprobe (no-kmod-autoload): failed to restore automatic module loading' > /dev/kmsg
fi

