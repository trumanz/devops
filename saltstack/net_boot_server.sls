
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

#### PXE
/var/lib/tftpboot/syslinux:
    archive.extracted:
        - source: https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.zip
        - skip_verify: True
        - enforce_toplevel: False

/var/lib/tftpboot/pxe/efi64/syslinux.efi:
    file.copy:
        - source: /var/lib/tftpboot/syslinux/efi64/efi/syslinux.efi
        - makedirs: True
/var/lib/tftpboot/pxe/efi64/ldlinux.e64:
    file.copy:
        - source: /var/lib/tftpboot/syslinux/efi64/com32/elflink/ldlinux/ldlinux.e64
        - makedirs: True


/var/lib/tftpboot/pxe/efi64/menu.c32:
     file.copy:
        - source:  /var/lib/tftpboot/syslinux/efi64/com32/menu/vesamenu.c32
        - makedirs: True

/var/lib/tftpboot/pxe/efi64/libcom32.c32:
     file.copy:
        - source:  /var/lib/tftpboot/syslinux/efi64/com32/lib/libcom32.c32
        - makedirs: True

/var/lib/tftpboot/pxe/efi64/libutil.c32:
     file.copy:
        - source:  /var/lib/tftpboot/syslinux/efi64/com32/libutil/libutil.c32
        - makedirs: True

/var/lib/tftpboot/pxe/efi64/pxelinux.cfg/default:
     file.managed:
        - source: salt://net_boot_server/pxe.efi64.cfg.default
        - makedirs: True
