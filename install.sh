#!/bin/env bash

echo "$(whoami)"; [ "$UID" = "0" ] || exec sudo "$0" "$@"

mkdir -p /opt/Tlauncher
wget -c https://tlauncher.org/download/15326 -O /opt/Tlauncher/tlauncher.jar

if test -f "/opt/Tlauncher/tlauncher.jar" ; then
  echo "$(tput bold setaf 10)successfully installed.$(tput sgr0)"
else
  tput 1;
  echo "ERROR:$(tput sgr0) could not perform the installation. The link may be broken."
fi
