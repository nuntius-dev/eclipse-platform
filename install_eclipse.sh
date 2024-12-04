#!/bin/bash

ECLIPSE_VER_DATE="2024-12"
ECLIPSE_URL="https://mirrors.xmission.com/eclipse/technology/epp/downloads/release/${ECLIPSE_VER_DATE}/R/eclipse-java-${ECLIPSE_VER_DATE}-R-linux-gtk-$(arch).tar.gz"
ECLIPSE_DIR="/opt/eclipse"
ECLIPSE_ICON_DIR="/opt/eclipse/plugins/$(ls /opt/eclipse/plugins/ | grep -m 1 org.eclipse.platform_)/eclipse128.png"
DESKTOP_FILE="$INST_SCRIPTS/eclipse/eclipse.desktop"

# Descargar y extraer Eclipse
cd /tmp
wget -q -O eclipse.tar.gz "$ECLIPSE_URL"
tar -xzf eclipse.tar.gz -C /opt

# Actualizar el icono en el archivo .desktop
sed -i "s#eclipse128.png#${ECLIPSE_ICON_DIR}#" "$DESKTOP_FILE"

# Copiar el archivo .desktop a las ubicaciones correspondientes
cp "$DESKTOP_FILE" $HOME/Desktop/
cp "$DESKTOP_FILE" /usr/share/applications/
