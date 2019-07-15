##### DHCP  service
isc-dhcp-server:
  pkg.installed:
    - pkgs:
      - isc-dhcp-server
  service.running:
     - watch:
        - file: /etc/dhcp/dhcpd.conf


/etc/dhcp/dhcpd.conf:
    file.managed:
       - source: salt://net_boot_server/dhcpd.conf

##### TFTP service
tftpd-hpa:
  pkg.installed:
    - pkgs:
      - tftpd-hpa
  service.running:
    - watch:
      - file: /etc/default/tftpd-hpa


/etc/default/tftpd-hpa:
    file.managed:
       - source: salt://net_boot_server/tftpd-hpa


##### HTTP service
apache2:
  pkg.installed:
    - pkgs:
      - apache2


#####  ESXi iso  mount
/var/lib/tftpboot/ESXi6.0.0b:
     mount.mounted:
        - device: /ESXi6.0.0b.iso
        - opts: loop
        - fstype: iso9660
        - mkmnt: True
        - require:
           - file: /ESXi6.0.0b.iso

/ESXi6.0.0b.iso:
    file.managed:
       - source: salt://net_boot_server/iso/ESXi6.0.0b-VMware-VMvisor-Installer-201507001-2809209.x86_64.iso

/var/lib/tftpboot/ESXi5.5.0:
     mount.mounted:
        - device: /ESXi5.5.0.iso
        - opts: loop
        - fstype: iso9660
        - mkmnt: True
        - require:
           - file: /ESXi5.5.0.iso

/ESXi5.5.0.iso:
    file.managed:
       - source: salt://net_boot_server/iso/VMware-VMvisor-Installer-5.5.0-1331820.x86_64.iso


#### PXE
/var/lib/tftpboot/bootx64.efi:
    file.copy:
        - source:  /var/lib/tftpboot/ESXi6.0.0b/efi/boot/bootx64.efi
        - makedirs: True

##ESXi 5.5
/var/lib/tftpbbot/boot.cfg:
    file.copy:
        - source: /var/lib/tftpboot/ESXi5.5.0/boot.cfg

