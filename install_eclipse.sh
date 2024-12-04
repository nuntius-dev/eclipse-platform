#!/bin/bash

ECLIPSE_VER_DATE="2024-09"
ARCH=$(uname -m | sed 's/x86_64/x86_64/' | sed 's/aarch64/aarch64/')
OS="linux-gtk"

cd /tmp
wget -q -O eclipse.tar.gz "https://mirrors.xmission.com/eclipse/technology/epp/downloads/release/${ECLIPSE_VER_DATE}/R/eclipse-java-${ECLIPSE_VER_DATE}-R-${OS}-${ARCH}.tar.gz"

if [ $? -eq 0 ]; then
  tar -xzf eclipse.tar.gz -C /opt
  ECLIPSE_ICON="/opt/eclipse/plugins/$(ls /opt/eclipse/plugins/ | grep -m 1 org.eclipse.platform_)/eclipse128.png"
  cat <<EOF > /usr/share/applications/eclipse.desktop
[Desktop Entry]
Name=Eclipse IDE
Type=Application
Exec=/opt/eclipse/eclipse
Icon=${ECLIPSE_ICON}
Categories=Development;IDE;
EOF
  chmod +x /usr/share/applications/eclipse.desktop
else
  echo "Error descargando Eclipse. Verifica la URL o versión."
fi
