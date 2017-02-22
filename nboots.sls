

{% from 'dhcpd.sls' import dhcpd %}


{{ dhcpd('salt://net_boot_server/dhcpd.conf') }}



