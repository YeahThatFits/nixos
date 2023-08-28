#!/bin/sh

set -e
root="/home/samuel/pr/nixos"

chown root:root "$root"/wg_private.conf
chmod 600 "$root"/wg_private.conf
rsync -a --delete "$root/" /etc/nixos/

printf "nixos-rebuild switch? [y/n]: "
read r
case $r in
    [yY]) nixos-rebuild switch ;;
    *) ;;
esac
