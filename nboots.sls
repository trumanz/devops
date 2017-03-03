

#####DHCP
{% from 'service/dhcpd.sls' import dhcpd %}
{{ dhcpd('salt://net_boot_server/dhcpd.conf') }}

#####TFTP
{% from 'service//tftpd.sls' import tftpd %}
{{ tftpd('salt://net_boot_server/tftpd-hpa') }}

#####ISO
{% from 'misc/iso_mount.sls' import iso_mount %}
{{ iso_mount('/var/lib/tftpboot/ESXi6.0.0b', 'ESXi6.0.0b.iso', 'salt://net_boot_server/iso/ESXi6.0.0b-VMware-VMvisor-Installer-201507001-2809209.x86_64.iso') }}
{{ iso_mount('/var/lib/tftpboot/ESXi5.5.0', 'ESXi5.5.0.iso', 'salt://net_boot_server/iso/VMware-VMvisor-Installer-5.5.0-1331820.x86_64.iso') }}
{{ iso_mount('/var/lib/tftpboot/ESXi6.5.0', 'ESXi6.5.0.iso', 'salt://net_boot_server/iso/VMware-VMvisor-Installer-6.5.0-4564106.x86_64.iso') }}



#####HTTP service
apache2:
  pkg.installed:
    - pkgs:
      - apache2



#### PXE
/var/lib/tftpboot/syslinux:
    archive.extracted:
        - source: https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.zip
        - skip_verify: True
        - enforce_toplevel: False


/var/lib/tftpboot/pxelinux.0:
    file.copy:
        - source: /usr/lib/syslinux/pxelinux.0
        - makedirs: True

/var/lib/tftpboot/menu.c32:
    file.copy:
        - source: /usr/lib/syslinux/menu.c32
        - makedirs: True

/var/lib/tftpboot/pxelinux.cfg/default:
    file.managed:
       - source:  salt://net_boot_server/pxe.cfg.default

