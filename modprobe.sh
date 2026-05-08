#!/bin/sh

# SPDX-FileCopyrightText: 2026 Julian Brost <julian@0x4a42.net>
# SPDX-License-Identifier: MIT

echo "<3>modprobe: not loading module: modprobe $*" > /dev/kmsg
