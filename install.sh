#!/bin/env bash

ZIP="/tmp/jar"
URL="https://tlauncher.org/jar"
INST_PATH="/opt/Tlauncher"
EXEC_PATH="/usr/local/bin"


echo "$(whoami)"; [ "$UID" = "0" ] || exec sudo "$0" "$@"
rm -f /tmp/jar
rm -rf ${INST_PATH}

mkdir -p ${INST_PATH}
wget ${URL} -P /tmp 
unzip ${ZIP} -d ${INST_PATH}
mv ${INST_PATH}/TLauncher-* ${INST_PATH}/tlauncher.jar
cp $0 $EXEC_PATH/tlauncher-update

if test -f "${INST_PATH}/tlauncher.jar" ; then
  echo "#!/bin/env sh" > $EXEC_PATH/tlauncher
  echo "java -jar ${INST_PATH}/tlauncher.jar" > $EXEC_PATH/tlauncher
  chmod +x $EXEC_PATH/tlauncher
  
  echo '[Desktop Entry]
  Type=Application
  Name=Tlauncher
  GenericName=Minecraft
  Comment=Tlauncher - unnoficial Minecraft launcher
  Categories=Game;
  Exec='${EXEC_PATH}'/tlauncher
  Icon=minecraft' > /usr/share/applications/TLauncher.desktop
  echo "$(tput bold setaf 2)successfully installed."
  echo "$(tput sgr0)"

else
  tput setaf 1;
  echo "ERROR:$(tput sgr0) could not perform the installation. The link may be broken."
fi


