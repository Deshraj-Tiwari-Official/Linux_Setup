#!/usr/bin/env bash

source /etc/os-release

case "$ID" in
  fedora)
    ~/dotfiles/00_scripts/distros/fedora.sh
    ;;
  arch)
    ~/dotfiles/00_scripts/distros/arch.sh
    ;;
  *)
    echo "Unsupported distro: $ID"
    exit 1
    ;;
esac
