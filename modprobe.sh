#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Julian Brost <julian@0x4a42.net>
# SPDX-License-Identifier: MIT

cmd="modprobe$(printf ' %q' "$@")"
echo "<3>modprobe (no-kmod-autoload): not loading module: $cmd" > /dev/kmsg
