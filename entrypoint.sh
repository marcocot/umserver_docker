#!/bin/sh
# Crea il file ultimamapper.conf utilizzando le variabili d'ambiente
cat <<EOF > ultimamapper.conf
<?xml version="1.0" encoding="UTF-8"?>
<network>
    <server name="${ULTIMA_MAPPER_NAME}" password="${ULTIMA_MAPPER_PASSWORD}" maxusers="25" enabled="1" port="12000">
        <User LastIP="192.168.1.102" Name="${ULTIMA_MAPPER_ADMIN_NAME}" IsAdmin="1" />
    </server>
</network>
EOF

# Avvia il comando passato (es. "./mappersrv")
exec "$@"
