#!/bin/env bash

INST_PATH="/opt/Tlauncher"
EXEC_PATH="/usr/local/bin"
LAUNCHER_PATH="/usr/share/applications"

[ "$UID" = "0" ] || exec sudo "$0" "$@"

rm -rf "${INST_PATH}" "${EXEC_PATH}/tlauncher" ${LAUNCHER_PATH}/TLauncher.desktop ${EXEC_PATH}/tlauncher-update

if test -f "${INST_PATH}/tlauncher.jar" ; then

  echo "$(tput bold setaf 1) uninstall fail, check your permissions ."
  echo "$(tput sgr0)"

else
  tput setaf 2;
  echo "uninstalled :)$(tput sgr0)"
fi


