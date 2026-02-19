sudo timedatectl set-timezone America/Montreal
sudo hostnamectl set-hostname moriarty.orion

sudo sed -i 's/csb_hostname.*/csb_hostname = moriarty.orion/' /etc/ansible/facts.d/csb.fact
sudo sed -i 's/^dhill.*/moriarty.orion ansible_connection=local/' /etc/ansible/hosts

dconf write /org/gnome/deja-dup/google/folder "'moriarty.orion'"
dconf write /org/gnome/Weather/locations "[<(uint32 2, <('Montreal', 'CYUL', true, [(0.79354303905785273, -1.2871803233458181)], [(0.79354303905785273, -1.2871803233458181)])>)>]"

if ! rpm -qi gnome-session-xsession > /dev/null; then
  sudo yum install -y terminator vim snap shairport-sync vlc thunderbird net-snmp google-chrome-unstable gnome-classic-session git-lfs hexchat psutils glibc.i686 virt-manager gnome-session-xsession
fi
if [ -d /home/dhill_restore ]; then
  rsync -avgo --remove-source-files /home/dhill_restore/cases/ /cases/
  rm -rf /home/dhill_restore/cases/
  rsync -avgo --remove-source-files /home/dhill_restore/home/dhill/ /home/dhill/
  find /home/dhill_restore/ -depth -type d -empty -delete
fi

sudo cp etc/gdm/* /etc/gdm/
sudo cp etc/snmp/* /etc/snmp/
sudo cp etc/libvirt/libvirtd.conf /etc/libvirt
sudo cp var/lib/AccountsService/users/* /var/lib/AccountsService/users

sudo systemctl enable snapd
sudo systemctl start snapd
sudo systemctl enable snmpd
sudo systemctl start snmpd
sudo systemctl enable shairport-sync
sudo systemctl start shairport-sync
sudo systemctl restart libvirtd

if ! firewall-cmd --zone=internal --permanent --list-all | grep -q snmp; then
  sudo firewall-cmd --zone=internal --add-service ssh --permanent
  sudo firewall-cmd --zone=FedoraWorkstation --add-service ssh --permanent
  sudo firewall-cmd --zone=internal --add-service snmp --permanent
  sudo firewall-cmd --zone=FedoraWorkstation --add-service snmp --permanent
  sudo firewall-cmd --zone=internal --add-port=113/tcp --permanent
  sudo firewall-cmd --zone=FedoraWorkstation --add-port=113/tcp --permanent
  sudo firewall-cmd --zone=internal --add-port=161/tcp --permanent
  sudo firewall-cmd --zone=FedoraWorkstation --add-port=161/tcp --permanent
  sudo firewall-cmd --zone=FedoraServer --add-port=161/tcp --permanent
  sudo firewall-cmd --zone=internal --add-port=161/udp --permanent
  sudo firewall-cmd --zone=FedoraWorkstation --add-port=161/udp --permanent
  sudo firewall-cmd --zone=FedoraServer --add-port=161/udp --permanent
fi

if ! snap list whatsdesk >/dev/null; then
  sudo snap install whatsdesk
fi
if ! snap list signal-desktop >/dev/null; then
  sudo snap install signal-desktop
fi

sudo cp /var/lib/snapd/snap/whatsdesk/current/meta/gui/icon.png /usr/share/pixmaps/whatsapp.png
sudo cp usr/share/applications/whatsapp.desktop /usr/share/applications/whatsapp.desktop
sudo cp usr/share/applications/whatsapp.desktop /home/dhill/.config/autostart

if ! rpm -qi brscan3 > /dev/null; then
  cd rpms
  mkdir tmp
  cp linux-brprinter-installer-2.2.0-1.gz tmp/
  gunzip -c linux-brprinter-installer-2.2.0-1.gz > tmp/linux-brprinter-installer-2.2.0-1
  chmod 755 tmp/linux-brprinter-installer-2.2.0-1
  echo "Y" | sudo tmp/./linux-brprinter-installer-2.2.0-1 dcp-7030
  rm -rf tmp
fi

if ! rpm -qa | grep -iq slack ; then
  sudo yum install -y rpms/slack*
fi

if ! rpm -qa | grep -iq zoom ; then
  sudo yum install -y https://zoom.us/client/latest/zoom_x86_64.rpm
fi

if ! rpm -qa | grep -iq ringcentral; then
  sudo yum install -y https://github.com/ringcentral/ringcentral-community-app/releases/download/v0.0.12/ringcentral-community-app-0.0.12.x86_64.rpm
fi
if ! rpm -qa | grep -iq teamviewer; then
  sudo yum install -y https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
fi
if ! rpm -qa | grep -iq webex; then
  sudo yum install -y https://binaries.webex.com/WebexDesktop-CentOS-Official-Package/Webex.rpm --nogpgcheck
fi
if ! rpm -qa | grep -iq anydesk; then
  sudo rpm -ivh --nodeps http://rpm.anydesk.com/fedora/x86_64/Packages/anydesk_7.1.4-1_x86_64.rpm
fi

if ! rpm -qi jenkins > /dev/null; then
  sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm/jenkins.repo
  sudo yum install -y jenkins
fi

sudo tar xvf /home/dhill/jenkins.tar -C /
sudo tar xvf /home/dhill/libvirt.tar -C /
sudo yum update -y

if [ ! -e restarted_gdm ]; then
  touch restarted_gdm
  echo "bye bye wayland"
  sudo systemctl restart gdm
fi

