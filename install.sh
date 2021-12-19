#!/bin/env sh

echo "$(whoami)"; [ "$UID" -eq 0  ] || exec sudo "$0" "$@"

mkdir -p /opt/Tlauncher
wget -c https://tlauncher.org/download/15326 -O /opt/Tlauncher/tlauncher.jar

if [[ "/opt/Tlauncher/tlauncher.jar" -e ]];then
  echo "$(tput bold setaf 10)successfully installed.$(tput scrgr0)"
else
  tput 1;
  echo "ERROR:$(tput scrgr0) could not perform the installation. The link may be broken."
fi

