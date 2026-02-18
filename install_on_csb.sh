yum install -y terminator vim snap shairport-sync vlc thunderbird net-snmp google-chrome-unstable

rsync -avgo --remove-source-files /home/dhill_restore/ /home/dhill/

cp etc/gdm/* /etc/gdm/
cp etc/snmp/* /etc/snmp/
cp etc/libvirt/libvirtd.conf /etc/libvirt

systemctl enable snapd
systemctl start snapd
systemctl enable snmpd
systemctl start snmpd
systemctl enable shairport-sync
systemctl start shairport-sync
systemctl restart libvirtd


firewall-cmd --zone=internal --add-service ssh --permanent
firewall-cmd --zone=FedoraWorkstation --add-service ssh --permanent
firewall-cmd --zone=internal --add-service snmp --permanent
firewall-cmd --zone=FedoraWorkstation --add-service snmp --permanent
firewall-cmd --zone=internal --add-port=113/tcp --permanent
firewall-cmd --zone=FedoraWorkstation --add-port=113/tcp --permanent
firewall-cmd --zone=internal --add-port=161/tcp --permanent
firewall-cmd --zone=FedoraWorkstation --add-port=161/tcp --permanent
firewall-cmd --zone=FedoraServer --add-port=161/tcp --permanent
firewall-cmd --zone=internal --add-port=161/udp --permanent
firewall-cmd --zone=FedoraWorkstation --add-port=161/udp --permanent
firewall-cmd --zone=FedoraServer --add-port=161/udp --permanent



snap install whatsdesk

cp /var/lib/snapd/snap/whatsdesk/current/meta/gui/icon.png /usr/share/pixmaps/whatsapp.png
cp usr/share/applications/whatsapp.desktop /usr/share/applications/whatsapp.desktop
cp usr/share/applications/whatsapp.desktop /home/dhill/.config/autostart

cp linux-brprinter-installer-2.2.0-1.gz tmp/
gunzip -c linux-brprinter-installer-2.2.0-1.gz > tmp/linux-brprinter-installer-2.2.0-1
chmod 755 tmp/linux-brprinter-installer-2.2.0-1
echo "Y" | sudo tmp/./linux-brprinter-installer-2.2.0-1 dcp-7030
rm -rf tmp

remotepackages="https://github.com/ringcentral/ringcentral-community-app/releases/download/v0.0.12/ringcentral-community-app-0.0.12.x86_64.rpm https://github.com/ringcentral/ringcentral-community-app/releases/download/v0.0.12/ringcentral-community-app-0.0.12.x86_64.rpm http://rpm.anydesk.com/fedora/x86_64/Packages/anydesk_7.1.4-1_x86_64.rpm"

yum install -y remotepackages
